//
//  TodayViewController.swift
//  AppExtensionsTodayExample
//
//  Created by Domo on 10/12/2019.
//  Copyright © 2019 Domo. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    
    let imageEndpointURL = "https://www.metaweather.com/static/img/weather/png/#IMAGE#.png"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cityLabel.text = "-"
        weatherLabel.text = "-"
        
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        
        let API = WeatherAPI()
        API.getWeather { (response) in
            
            DispatchQueue.main.async() {
                // get tomorrow object
                let tomorrowWeather = response?.consolidatedWeather[1]
                guard let unwTomorrowWeather = tomorrowWeather else {
                    return
                }
                                               
                self.cityLabel.text = response?.title
                
                // set city name
                self.cityLabel.text = response?.title

                // get image
                let weatherStateAbbr = tomorrowWeather?.weatherStateAbbr
                guard let unwWeatherStateAbbr = weatherStateAbbr else {
                    return
                }
                let imageString =  self.imageEndpointURL.replacingOccurrences(of: "#IMAGE#", with: unwWeatherStateAbbr)
                let imageUrl = URL(string: imageString)
                guard let unwImageUrl = imageUrl else {
                    return
                }
                let data = try? Data(contentsOf: unwImageUrl)
                               
                // set weather image
                if let imageData = data {
                    self.weatherImage.image = UIImage(data: imageData)
                }
                               
                // set weather label
                self.weatherLabel.text = unwTomorrowWeather.weatherStateName
                
            }
        }
        
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
      let expanded = activeDisplayMode == .expanded
      preferredContentSize = expanded ? CGSize(width: maxSize.width, height: 200) : maxSize
    }
    
}

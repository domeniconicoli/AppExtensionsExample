//
//  WeatherAPI.swift
//  AppExtensionsExample
//
//  Created by Domo on 10/12/2019.
//  Copyright © 2019 Domo. All rights reserved.
//

import Foundation

class WeatherAPI {
    
    // 44418 - London
    // Read here https://www.metaweather.com/api/ to know how to get you city
    let weatherAPIEndpoint = "https://www.metaweather.com/api/location/44418/"
    
    func getWeather(result: @escaping (WeatherResponse?) -> ()) {
        
        let request = NSMutableURLRequest(url: NSURL(string: weatherAPIEndpoint)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {

                do {
                    let responseJSON = try JSONDecoder().decode(WeatherResponse.self, from: data!)
                    result(responseJSON)
                } catch {
                    print("error")
                }
                
            }
        })

        dataTask.resume()
        
    }
    
}

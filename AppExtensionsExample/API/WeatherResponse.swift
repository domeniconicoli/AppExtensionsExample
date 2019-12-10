//
//  WeatherResponse.swift
//  AppExtensionsExample
//
//  Created by Domo on 10/12/2019.
//  Copyright © 2019 Domo. All rights reserved.
//

import Foundation

// MARK: - Post
class WeatherResponse: Codable {
    let consolidatedWeather: [ConsolidatedWeather]
    let time, sunRise, sunSet, timezoneName: String
    let parent: Parent
    let sources: [Source]
    let title, locationType: String
    let woeid: Int
    let lattLong, timezone: String

    enum CodingKeys: String, CodingKey {
        case consolidatedWeather = "consolidated_weather"
        case time
        case sunRise = "sun_rise"
        case sunSet = "sun_set"
        case timezoneName = "timezone_name"
        case parent, sources, title
        case locationType = "location_type"
        case woeid
        case lattLong = "latt_long"
        case timezone
    }

    init(consolidatedWeather: [ConsolidatedWeather], time: String, sunRise: String, sunSet: String, timezoneName: String, parent: Parent, sources: [Source], title: String, locationType: String, woeid: Int, lattLong: String, timezone: String) {
        self.consolidatedWeather = consolidatedWeather
        self.time = time
        self.sunRise = sunRise
        self.sunSet = sunSet
        self.timezoneName = timezoneName
        self.parent = parent
        self.sources = sources
        self.title = title
        self.locationType = locationType
        self.woeid = woeid
        self.lattLong = lattLong
        self.timezone = timezone
    }
}

// MARK: - ConsolidatedWeather
class ConsolidatedWeather: Codable {
    let id: Int
    let weatherStateName, weatherStateAbbr, windDirectionCompass, created: String
    let applicableDate: String
    let minTemp, maxTemp, theTemp, windSpeed: Double
    let windDirection, airPressure: Double
    let humidity: Int
    let visibility: Double
    let predictability: Int

    enum CodingKeys: String, CodingKey {
        case id
        case weatherStateName = "weather_state_name"
        case weatherStateAbbr = "weather_state_abbr"
        case windDirectionCompass = "wind_direction_compass"
        case created
        case applicableDate = "applicable_date"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case theTemp = "the_temp"
        case windSpeed = "wind_speed"
        case windDirection = "wind_direction"
        case airPressure = "air_pressure"
        case humidity, visibility, predictability
    }

    init(id: Int, weatherStateName: String, weatherStateAbbr: String, windDirectionCompass: String, created: String, applicableDate: String, minTemp: Double, maxTemp: Double, theTemp: Double, windSpeed: Double, windDirection: Double, airPressure: Double, humidity: Int, visibility: Double, predictability: Int) {
        self.id = id
        self.weatherStateName = weatherStateName
        self.weatherStateAbbr = weatherStateAbbr
        self.windDirectionCompass = windDirectionCompass
        self.created = created
        self.applicableDate = applicableDate
        self.minTemp = minTemp
        self.maxTemp = maxTemp
        self.theTemp = theTemp
        self.windSpeed = windSpeed
        self.windDirection = windDirection
        self.airPressure = airPressure
        self.humidity = humidity
        self.visibility = visibility
        self.predictability = predictability
    }
}

// MARK: - Parent
class Parent: Codable {
    let title, locationType: String
    let woeid: Int
    let lattLong: String

    enum CodingKeys: String, CodingKey {
        case title
        case locationType = "location_type"
        case woeid
        case lattLong = "latt_long"
    }

    init(title: String, locationType: String, woeid: Int, lattLong: String) {
        self.title = title
        self.locationType = locationType
        self.woeid = woeid
        self.lattLong = lattLong
    }
}

// MARK: - Source
class Source: Codable {
    let title, slug: String
    let url: String
    let crawlRate: Int

    enum CodingKeys: String, CodingKey {
        case title, slug, url
        case crawlRate = "crawl_rate"
    }

    init(title: String, slug: String, url: String, crawlRate: Int) {
        self.title = title
        self.slug = slug
        self.url = url
        self.crawlRate = crawlRate
    }
}

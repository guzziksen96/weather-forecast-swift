////
////  WeatherForecastModel.swift
////  WeatherForecast
////
////  Created by Klaudia on 10/12/18.
////  Copyright © 2018 Student. All rights reserved.
////
//
//import Foundation
//
//struct WeatherForecast: Codable {
//    let latitude, longitude: Double
//    //let currently: Currently
//    let minutely: Minutely
//    let hourly: Hourly
//    let daily: Daily
//    //let alerts: [Alert]
//    //let flags: Flags
//    //let offset: Int
//
//    enum CodingKeys: String, CodingKey {
//        case latitude = "latitude"
//        case longitude = "longitude"
//        case daily = "daily"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        latitude = try values.decodeIfPresent(Double.self, forKey: .latitude) ?? <#default value#>
//        longitude = try values.decodeIfPresent(Double.self, forKey: .longitude) ?? <#default value#>
//        daily = try values.decodeIfPresent(Daily.self, forKey: .daily)!
//
//    }
//}
//
////struct Alert: Codable {
////    let title: String
////    let regions: [String]
////    let severity: String
////    let time, expires: Int
////    let description: String
////    let uri: String
////}
//
////struct Currently: Codable {
////    let time: Int
////    let summary: Summary
////    let icon: Icon
////    let nearestStormDistance, nearestStormBearing: Int?
////    let precipIntensity, precipProbability, temperature, apparentTemperature: Double
////    let dewPoint, humidity, pressure, windSpeed: Double
////    let windGust: Double
////    let windBearing: Int
////    let cloudCover: Double
////    let uvIndex: Int
////    let visibility, ozone: Double
////    let precipType: PrecipType?
////}
//
//enum Icon: String, Codable {
//    case clearDay = "clear-day"
//    case clearNight = "clear-night"
//    case partlyCloudyDay = "partly-cloudy-day"
//    case partlyCloudyNight = "partly-cloudy-night"
//}
//
//enum PrecipType: String, Codable {
//    case rain = "rain"
//}
//
//enum Summary: String, Codable {
//    case clear = "Clear"
//    case partlyCloudy = "Partly Cloudy"
//}
//
//struct Daily: Codable {
//    let summary: String
//    let icon: Icon
//    let data: [DailyDatum]
//
//    enum CodingKeys: String, CodingKey {
//        case summary = "summary"
//        case icon = "icon"
//        case data = "data"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        summary = try values.decodeIfPresent(String.self, forKey: .summary)!
//        icon = try values.decodeIfPresent(Icon.self, forKey: .icon)!
//        data = [try values.decodeIfPresent(DailyDatum.self, forKey: .data)!]
//
//    }
//}
//
//struct DailyDatum: Codable {
//    let time: Int
//    let summary: String
//    let icon: Icon
//    let moonPhase, precipIntensity, precipIntensityMax: Double
//    let precipIntensityMaxTime: Int?
//    let precipProbability: Double
//    let precipType: PrecipType?
//    let temperatureHigh: Double
//    let temperatureHighTime: Int
//    let temperatureLow: Double
//    let temperatureLowTime: Int
//    let apparentTemperatureHigh: Double
//    let apparentTemperatureHighTime: Int
//    let apparentTemperatureLow: Double
//    let apparentTemperatureLowTime: Int
//    let dewPoint, humidity, pressure, windSpeed: Double
//    let windGust: Double
//    let windGustTime, windBearing: Int
//    let cloudCover: Double
//    let uvIndex, uvIndexTime, visibility: Int
//    let ozone, temperatureMin: Double
//    let temperatureMinTime: Int
//    let temperatureMax: Double
//    let temperatureMaxTime: Int
//    let apparentTemperatureMin: Double
//    let apparentTemperatureMinTime: Int
//    let apparentTemperatureMax: Double
//    let apparentTemperatureMaxTime: Int
//
//    enum CodingKeys: String, CodingKey {
//        case time = "time"
//        case summary = "summary"
//        case icon = "icon"
//        case
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        latitude = try values.decodeIfPresent(Double.self, forKey: .latitude) ?? <#default value#>
//        longitude = try values.decodeIfPresent(Double.self, forKey: .longitude) ?? <#default value#>
//        daily = try values.decodeIfPresent(Daily.self, forKey: .daily)!
//
//    }
//}
//
////struct Flags: Codable {
////    let sources: [String]
////    let nearestStation: Double
////    let units: String
////
////    enum CodingKeys: String, CodingKey {
////        case sources
////        case nearestStation = "nearest-station"
////        case units
////    }
////}
//
//struct Hourly: Codable {
//    let summary: String
//    let icon: Icon
//    let data: [Currently]
//}
//
//struct Minutely: Codable {
//    let summary: String
//    let icon: Icon
//    let data: [MinutelyDatum]
//}
//
//struct MinutelyDatum: Codable {
//    let time, precipIntensity, precipProbability: Int
//}

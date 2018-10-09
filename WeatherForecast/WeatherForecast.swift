//
//  WeatherForecast.swift
//  WeatherForecast
//
//  Created by Student on 09/10/2018.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation

struct WeatherForecast : Codable {
    let weatherConditions:String
    let pictogram:String
    let temperature:Double
    let stringData: String
    let tempMin: Double
    let tempMax: Double
    let windSpeed: Double
    let amountOfRain: Double
    let windDirection: String
    let atmosphericPressure: Double
    

}





//func formatDate(stringDate:String) -> Date{
//    let formatter = DateFormatter()
//    formatter.dateFormat = "yyyy/MM/dd HH:mm"
//    return formatter.date(from: stringDate)
//}

//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Student on 09/10/2018.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var precipitation: UILabel!
    @IBOutlet weak var windDirection: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var pictogram: UIImageView!
    
    private var myData: [Data]?
    
    //MARK: Actions
    
    @IBAction func displayNextDayForecastWeather(_ sender: UIButton) {
    }
    
    @IBAction func displayPreviousDayForecastWeather(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData { [weak self] weatherForecast in
            guard let self = self, let fetchData = weatherForecast.daily?.data?.first else {
                return
            }
            
            self.myData = weatherForecast.daily?.data
            self.setupFirst(data: fetchData)
        }
        
    }
    
    private func setupFirst(data: Data) {
        
        pictogram.contentMode = .scaleAspectFit
        pictogram.image = weatherPictogramFromString(stringIcon: data.icon)
        maxTemp.text = String(data.temperatureMax!)
        minTemp.text = String(data.temperatureMin!)
        pressure.text = String(data.pressure!)
        precipitation.text = String(data.precipIntensity!)
        summary.text = data.summary
        windSpeed.text = String(data.windSpeed!)
        date.text = convertTimestampToDate(time: data.time!)
    }
    
    let weatherForecastUrl = URL(string: "https://api.darksky.net/forecast/813dcd329357b2039f8650fbf84c481e/37.8267,-122.4233")!
    
    
    func getData (completion: @escaping (WeatherForecastBase) -> Void) {
        let task = URLSession.shared.dataTask(with: weatherForecastUrl) {(data, response, error) in
            guard let fetchedData = data else {
                return
            }

                do {
                    let weatherForecast = try JSONDecoder().decode(WeatherForecastBase.self, from: fetchedData)
                    
                    DispatchQueue.main.async() {
                        completion(weatherForecast)
                    }
                    
                } catch {
                    print(error.localizedDescription)
                
                }
        }
        task.resume()
    }
    
    func convertTimestampToDate(time: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(time))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateStyle = DateFormatter.Style.medium
        let localDate = dateFormatter.string(from: date)
        
        return localDate
    }
   
    func weatherPictogramFromString(stringIcon: String?) -> UIImage {
        guard let stringIcon = stringIcon else {
            return UIImage(named: "clear-day")!
        }
        
        var imageName: String
        
        switch stringIcon {
        case "clear-day":
            imageName = "clear-day"
        case "clear-night":
            imageName = "clear-night"
        case "rain":
            imageName = "rain"
        case "snow":
            imageName = "snow"
        case "sleet":
            imageName = "sleet"
        case "wind":
            imageName = "wind"
        case "fog":
            imageName = "fog"
        case "cloudy":
            imageName = "cloudy"
        case "partly-cloudy-day":
            imageName = "partly-cloudy"
        case "partly-cloudy-night":
            imageName = "cloudy-night"
        default:
            imageName = "clear-day"
        }
        
        let iconImage = UIImage(named: imageName)
        return iconImage!
       
    }
}




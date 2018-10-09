//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Student on 09/10/2018.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var pictogram: UIImageView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //pictogram.loadGif(name: "source")
       
        getData()
    }
    
    
    let weatherForecastUrl = URL(string: "https://api.darksky.net/forecast/813dcd329357b2039f8650fbf84c481e/37.8267,-122.4233")!
    
    func getData() {
        //to dziala asynchronicznie wiec musze to odpowiednio wywolac
            let task = URLSession.shared.dataTask(with: weatherForecastUrl) {(data: Data?, response:URLResponse?, error: Error?) in
            var forecastArray:[WeatherForecast] = []
            guard let unwrappedData = data else { return }
            
            do {
                let jsonDecoder = JSONDecoder()
                forecastArray = [try jsonDecoder.decode(WeatherForecast.self, from: unwrappedData)]
                print(forecastArray)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }


    
}


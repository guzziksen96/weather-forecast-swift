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
    
    @IBOutlet weak var maxTemp: UITextField!
    @IBOutlet weak var minTemp: UITextField!
    @IBOutlet weak var pressure: UITextField!
    @IBOutlet weak var precipitation: UITextField!
    @IBOutlet weak var summary: UITextField!
    @IBOutlet weak var windDirection: UITextField!
    @IBOutlet weak var windSpeed: UITextField!
    @IBOutlet weak var pictogram: UIImageView!
    
    //MARK: Actions
    
    @IBAction func displayNextDayForecastWeather(_ sender: UIButton) {
    }
    
    @IBAction func displayPreviousDayForecastWeather(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       data()
       // getData()
    }
    
    let weatherForecastUrl = URL(string: "https://api.darksky.net/forecast/813dcd329357b2039f8650fbf84c481e/37.8267,-122.4233")!
    
    
    func data() {
         let task = URLSession.shared.dataTask(with: weatherForecastUrl) {(data: Data?, response:URLResponse?, error: Error?) in
            guard let unwrappedData = data else { return }
            do {
                let someDictionaryFromJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: .allowFragments)     as! [String: Any]
                let json4Swift_Base = Json4Swift_Base(someDictionaryFromJSON)
                print(json4Swift_Base)
            } catch {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
    
    func getData() {

        //to dziala asynchronicznie wiec musze to odpowiednio wywolac
           let task = URLSession.shared.dataTask(with: weatherForecastUrl) {(data: Data?, response:URLResponse?, error: Error?) in
            guard let unwrappedData = data else { return }
            do {
                //let json = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [String:Any]
                //let json = try JSONSerialization.jsonObject(with: unwrappedData)
//                print(json)
             
                //print(type(of: json))
//                let jsonData = json.data(using: .utf8)!
//                let decoder = JSONDecoder()
//                let myStruct = try! decoder.decode(WeatherForecast.self, from: jsonData)
//                print(myStruct)
//                let result = try? JSONDecoder().decode((WeatherForecast.self), from: unwrappedData)

//                print(result)

                // let jsonDecoder = JSONDecoder()
                //TODO -> cannot convert
                
                 //let weatherObject = try jsonDecoder.decode(WeatherForecast.self, from: json)
                 //print(weatherObject)
                
               // print(json!)
            } catch {
                print(error.localizedDescription)
            }

        }

        task.resume()
    }
}




//
//  ViewController.swift
//  Stormy
//
//  Created by Pasan Premaratne on 2/15/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecipitationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let _key: String  = "6a4b2585e421fe05ee0b2ab6ddf256fa"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let currentWeather = CurrentWeather(temperature: 85.0, humidity: 0.8, precipitationProbability: 0.1, summary: "Hot!", icon: "clear-day")
        
        let factoryModel: ViewFactoryViewModel = ViewFactoryViewModel(model: currentWeather)
        
        displayWeather(using: factoryModel)
        //# belum manggil
        let baseUrl: URL?           = URL(string: "https://api.darksky.net/forecast/\(_key)/")
        let forecastURL:URL?        = URL(fileURLWithPath: "7.2575, 112.7521", relativeTo: baseUrl)
        
        if let url = forecastURL{
            do{
                
                let weatherData: Data = try Data(contentsOf: url)
                let weatherString:String =  try String(contentsOf: url)
                let weatherDataFromString:Data? = weatherString.data(using: String.Encoding.utf8)
                let json:[String:Any]? = try JSONSerialization.jsonObject(with: weatherDataFromString!, options: []) as? [String:Any]
//                print(weatherString)
                if JSONSerialization.isValidJSONObject(json){
                    print("Valid")
                }
            }catch {
                
            }

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayWeather(using viewModel: ViewFactoryViewModel){
        currentTemperatureLabel.text = viewModel.temperature
        currentHumidityLabel.text = viewModel.humidity
        currentPrecipitationLabel.text = viewModel.precipitationProbability
        currentSummaryLabel.text = viewModel.summary
        currentWeatherIcon.image = viewModel.icon
    }
}

















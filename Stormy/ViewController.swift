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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let currentWeather = CurrentWeather(temperature: 85.0, humidity: 0.8, precipitationProbability: 0.1, summary: "Hot!", icon: "clear-day")
        
        let factoryModel: ViewFactoryViewModel = ViewFactoryViewModel(model: currentWeather)
        
        displayWeather(using: factoryModel)
        let url:URL = URL(string: "https://api.darksky.net/forecast/6a4b2585e421fe05ee0b2ab6ddf256fa/37.8267,-122.4233")!
        
//        do{
//            
//            let string:String = try String(contentsOf: url)
//            print(string)
//            let data:Data = try Data(contentsOf: url)
//            let json:[String:Any]  = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
//            print(json["data"] as! [String])
//            
//        }catch{
//            print(error.localizedDescription)
//            
//        }
   
        let session = URLSession(configuration: .default)
        let request = URLRequest(url: url)
        session.dataTask(with: request, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
        
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

















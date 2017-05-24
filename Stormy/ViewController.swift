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

    let client = CDarkSkyApiClient()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.currentTemperatureLabel.text = "1"

        activityIndicator.hidesWhenStopped = true
        refreshButton.addTarget(self, action: #selector(self.refreshButtonFunction(sender:)), for: UIControlEvents.touchUpInside)
        
        refreshButtonFunction(sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayWeather(using viewModel: ViewFactoryViewModel){
        DispatchQueue.main.async {
            self.currentTemperatureLabel.text = viewModel.temperature
            self.currentHumidityLabel.text = viewModel.humidity
            self.currentPrecipitationLabel.text = viewModel.precipitationProbability
            self.currentSummaryLabel.text = viewModel.summary
            self.currentWeatherIcon.image = viewModel.icon
        }
       
    }
  
    func refreshButtonFunction(sender: UIButton?){
        togleRefreshAnimation(on: true)
        client.getCurrentWeather(){ [unowned self]weather,error in
            if let currentWeather = weather{
                let viewModel = ViewFactoryViewModel(model: currentWeather)
                DispatchQueue.main.async {
                    self.displayWeather(using: viewModel)
                    DispatchQueue.global(qos: .userInitiated).async{
                        sleep(3)
                        DispatchQueue.main.async {
                            self.togleRefreshAnimation(on: false)
                        }
                    }
                    
                }
                
            }
        }

    }
    
    func togleRefreshAnimation(on: Bool){
        refreshButton.isHidden = on
        
        if on{
            activityIndicator.startAnimating()
        }else{
            activityIndicator.stopAnimating()
        }
    }
}

















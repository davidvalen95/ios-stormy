//
//  CViewFactoryViewModel.swift
//  Stormy
//
//  Created by suryasoft konsultama on 5/8/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import UIKit

struct ViewFactoryViewModel{
    let temperature: String
    let humidity: String
    let precipitationProbability: String
    let summary: String
    let icon:UIImage
    
    init(model:CurrentWeather){
        
        let roundedTemperature = Int(model.temperature)
        
        self.temperature = "\(roundedTemperature)º" //# rounded
        
        let humidityPercentValue = Int(model.humidity * 100)
        self.humidity = "\(humidityPercentValue)%" //# 0-1 to percentage
        
        let precipititationProbabilityPercent = Int(model.precipitationProbability * 100)
        self.precipitationProbability = "\(precipititationProbabilityPercent)%"
        
        self.summary = model.summary
        
        let weatherIcon = WeatherIcon(iconString: model.icon)
        self.icon = weatherIcon.getImage()
        
        
    }
}

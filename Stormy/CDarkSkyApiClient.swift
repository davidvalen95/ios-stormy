//
//  CDarkSkyApiClient.swift
//  Stormy
//
//  Created by suryasoft konsultama on 5/23/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class CDarkSkyApiClient{
        fileprivate let apiKey = "6a4b2585e421fe05ee0b2ab6ddf256fa"
    
    lazy var baseUrl: URL = {
        let url:URL = URL(string: "https://api.darksky.net/forecast/\(self.apiKey)/37.8267,-122.4233")!
        return url
    }()
    let downloader = CJSonDownloader()
    
    func  getCurrentWeather(completionHandler: @escaping (CurrentWeather?, DarkSkyError?) -> Void ){
        let request = URLRequest(url: baseUrl)
        
        let closure = {(json: CJSonDownloader.JSON?, error: DarkSkyError?) -> Void in
            guard let json = json else {
                completionHandler(nil,error)
                return
            }
            guard let currentWeatherJson = json["currently"] as? [String:AnyObject],
                let currentWeather = CurrentWeather(json: currentWeatherJson) else{
                    
                    return
            }
            completionHandler(currentWeather,nil)
        }
        let task = downloader.jsonTask(request: request, completionHandler: closure)
        task.resume()
    }
}

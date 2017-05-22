//
//  CJsonDownloader.swift
//  Stormy
//
//  Created by suryasoft konsultama on 5/22/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class CJSonDownloader{
    typealias JSON = [String:AnyObject]
    let _session: URLSession

    init(configuration: URLSessionConfiguration){
        _session = URLSession(configuration: configuration)
    }
    convenience init(){
        self.init(configuration: .default)
    }
    
    
    func jsonTask(request: URLRequest, completionHandler completion: @escaping(JSON?,DarkSkyError?) -> Void) -> URLSessionDataTask{
        let task = _session.dataTask(with: request){ data,response,error in
            
            //# convert to HTTP Response
            guard let httpResponse = response as? HTTPURLResponse else{
                completion(nil, .requestFailed)
                return
            }
            if httpResponse.statusCode == 200{
                if let data = data{
                    do{
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
                        completion(json,nil)
                    }catch{
                        completion(nil, .jsonConversionFailure)
                    }
                }else{
                    completion(nil,.invalidData)
                }
            }
            else{
                completion(nil, .responseUnsuccessful)
            }
        }
        return task
    }
}

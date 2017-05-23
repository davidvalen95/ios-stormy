//
//  Coordinate.swift
//  Stormy
//
//  Created by suryasoft konsultama on 5/23/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation



struct Coordinate{
    let latititude: Double
    let longitude: Double
    
    func getDescription() -> String{
        return "\(latititude),\(longitude)"
    }
    
}

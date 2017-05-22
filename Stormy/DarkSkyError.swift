//
//  DarkSkyError.swift
//  Stormy
//
//  Created by suryasoft konsultama on 5/22/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


enum DarkSkyError: Error{
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
}

//
//  Weather.swift
//  WeatherApp
//
//  Created by Blake kvarfordt on 8/15/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    
    let daily: Daily
    
    struct Daily: Decodable {
        let data: [Day]
        
//        struct Data: Decodable {
//            let data: [Day]
        
            struct Day: Decodable {
                let weatherType: String
                let temperatureMax: Double
                
                enum CodingKeys: String, CodingKey {
                    case weatherType = "summary"
                    case temperatureMax
                }
            }
//        }
    }
}





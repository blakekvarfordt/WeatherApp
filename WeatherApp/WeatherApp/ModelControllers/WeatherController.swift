//
//  WeatherController.swift
//  WeatherApp
//
//  Created by Blake kvarfordt on 8/15/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation

class WeatherController {
    
    func fetchWeather(coordinates: (Double, Double), completion: @escaping (Weather?) -> Void) {
        
        guard let baseURL = URL(string: "https://api.darksky.net/forecast/") else { completion(nil); return }

        var builtURL = baseURL
        builtURL.appendPathComponent("4a6511ea8bef401af41556c9041a16a3")
        builtURL.appendPathComponent("\(coordinates.0),\(coordinates.1)")
        
        URLSession.shared.dataTask(with: builtURL) { (data, _, error) in
            
            if let error = error {
                completion(nil)
                print(error)
                print(error.localizedDescription)
            }
            
            guard let data = data else { completion(nil); return }
            
            let decoder = JSONDecoder()
            do {
                let weather = try decoder.decode(Weather.self, from: data)
                completion(weather)
                
            } catch {
                print("Error trying to decode data \(error) \(error.localizedDescription)")
            }
        }.resume()
    }
}

//
//  Data Service.swift
//  NewsPerformWeatherApp
//
//  Created by Nadya Postriganova on 17/5/20.
//  Copyright © 2020 Nadya Postriganova. All rights reserved.
//

import Foundation

class DataService {
    
    static var shared = DataService()
    
    private let baseUrl = "https://dnu5embx6omws.cloudfront.net/venues/weather.json"
    private var data = [Region]()

    private init() {}
    
    func fetchData(completion: @escaping (Result<[Region], Error>) -> Void) {
     
        guard let url = URL(string: baseUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil || data == nil {
                print("Client error!")
                return
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            
            guard let data = data, error == nil else { return }
            
            do {
                let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
                self.data = decodedResponse.data
                DispatchQueue.main.async {
                    completion(.success(self.data))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error.localizedDescription as! Error))
                }
            }
        }.resume()
    }
    
    func getCountries() -> [Country] {
        return Array(Set(data.map { $0.country }))
    }
    
    func sortedRegionsByDate() -> [Region]  {
        return data.sorted(by: {
            $0.weatherLastUpdated > $1.weatherLastUpdated
        })
    }
    func sortedByTemp() -> [Region] {
        return data.sorted(by: {
            ($0.weatherTemp as NSString).integerValue > ($1.weatherTemp as NSString).integerValue
        })
    }
    func sortedByAlpha() -> [Region] {
        return data.sorted(by: {
            $0.name < $1.name
        })
    }
    
    func getRegions() -> [Region] {
        return sortedByAlpha()
    }
    func getRegions(for countryId: String) -> [Region] {
        return data.filter({ $0.country.id == countryId })
    }
}

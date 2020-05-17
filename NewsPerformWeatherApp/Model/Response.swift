//
//  Region.swift
//  NewsPerformWeatherApp
//
//  Created by Nadya Postriganova on 15/5/20.
//  Copyright © 2020 Nadya Postriganova. All rights reserved.
//

import Foundation

struct Response: Codable {
    let ret: Bool
    let isOkay: Bool
    let data: [Region]
}

struct Region: Codable {
    let venueID: String
    let name: String
    let country: Country
    let weatherCondition: String
    let weatherConditionIcon: String
    let weatherWind: String
    let weatherHumidity: String
    let weatherTemp: String
    let weatherFeelsLike: String
    let sport: Sport
    let weatherLastUpdated: Double
    
    enum CodingKeys: String, CodingKey {
        case venueID = "_venueID"
        case name = "_name"
        case country = "_country"
        case weatherCondition = "_weatherCondition"
        case weatherConditionIcon = "_weatherConditionIcon"
        case weatherWind = "_weatherWind"
        case weatherHumidity = "_weatherHumidity"
        case weatherTemp = "_weatherTemp"
        case weatherFeelsLike = "_weatherFeelsLike"
        case sport = "_sport"
        case weatherLastUpdated = "_weatherLastUpdated"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.venueID = try container.decode(String.self, forKey: .venueID)
        self.name = try container.decode(String.self, forKey: .name)
        self.country = try container.decode(Country.self, forKey: .country)
        self.weatherCondition = try container.decodeIfPresent(String.self, forKey: .weatherCondition) ?? "-"
        self.weatherConditionIcon = try container.decodeIfPresent(String.self, forKey: .weatherConditionIcon) ?? "-"
        self.weatherWind = try Helpers.getValue(container.decodeIfPresent(String.self, forKey: .weatherWind))
        self.weatherHumidity = try Helpers.getValue(container.decodeIfPresent(String.self, forKey: .weatherHumidity))
        self.weatherTemp = try container.decodeIfPresent(String.self, forKey: .weatherTemp) ?? "-"
        self.weatherFeelsLike = try container.decodeIfPresent(String.self, forKey: .weatherFeelsLike) ?? ""
        self.weatherLastUpdated = try container.decodeIfPresent(Double.self, forKey: .weatherLastUpdated) ?? 0
        self.sport = try container.decode(Sport.self, forKey: .sport)
    }
}

struct Sport: Codable {
    let id: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_sportID"
        case description = "_description"
    }
}

struct Country: Codable {
    let id: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_countryID"
        case name = "_name"
    }
}

extension Country: Hashable {
    static func == (lhs: Country, rhs: Country) -> Bool {
        return lhs.id == rhs.id
    }
}


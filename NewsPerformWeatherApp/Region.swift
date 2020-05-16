//
//  Region.swift
//  NewsPerformWeatherApp
//
//  Created by Nadya Postriganova on 15/5/20.
//  Copyright © 2020 Nadya Postriganova. All rights reserved.
//

import Foundation

struct Region {
    let name: String
    let country: Country
    let weatherCondition: String
    let weatherWind: String
    let weatherHumidity: String
    let weatherTemp: String
    let weatherFeelsLike: String
    let weatherLastUpdated: String
}

struct Country {
    let id: String
    let name: String
}


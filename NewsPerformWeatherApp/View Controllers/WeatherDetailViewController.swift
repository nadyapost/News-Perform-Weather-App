//
//  WeatherDetailViewController.swift
//  NewsPerformWeatherApp
//
//  Created by Nadya Postriganova on 17/5/20.
//  Copyright © 2020 Nadya Postriganova. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    var regionName: String
    var weatherCondition: String
    var wind: String
    var humidity: String
    var temp: String
    var feelsLike: String
    var lastUpdated: Double
    
    let weatherDetailView = WeatherDetailView()
    
    init(regionName: String,
         weatherCondition: String,
         wind: String,
         humidity: String,
         temp: String,
         feelsLike: String,
         lastUpdated: Double
    ){
        self.regionName = regionName
        self.weatherCondition = weatherCondition
        self.wind = wind
        self.humidity = humidity
        self.temp = temp
        self.feelsLike = feelsLike
        self.lastUpdated = lastUpdated
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Weather details"
        self.view.backgroundColor = .white
        setupView()
        setupTitles()
    }

    func setupView() {
        view.addSubview(weatherDetailView)
        weatherDetailView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherDetailView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            weatherDetailView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            weatherDetailView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            weatherDetailView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func setupTitles() {
        weatherDetailView.regionLabel.text = regionName
        weatherDetailView.temperatureLabel.text = "\(temp)º"
        weatherDetailView.weatherConditionLabel.text = weatherCondition
        weatherDetailView.feelsLikeLabel.text = "Feels Like"
        weatherDetailView.feelsLikeLabelValue.text = "\(feelsLike)º"
        weatherDetailView.humidityLabel.text = "Humidity"
        weatherDetailView.humidityLabelValue.text = humidity
        weatherDetailView.windLabel.text = "Wind"
        weatherDetailView.windLabelValue.text = wind
        weatherDetailView.lastUpdatedLabel.text = "Last updated: \(Helpers.formattedDate(lastUpdated))"
    }
}


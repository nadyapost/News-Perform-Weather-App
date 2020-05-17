//
//  ViewController.swift
//  NewsPerformWeatherApp
//
//  Created by Nadya Postriganova on 15/5/20.
//  Copyright © 2020 Nadya Postriganova. All rights reserved.
//

import UIKit

class WeatherListViewController: UITableViewController {
    
    let regions: [Region] = [
        .init(name: "Baumaris", country: Country(id: "123", name: "Australia"), weatherCondition: "Sunny", weatherWind: "ESE at 17kph", weatherHumidity: "65%", weatherTemp: "27", weatherFeelsLike: "34", weatherLastUpdated: "1401666605"),
        .init(name: "Albany", country: Country(id: "123", name: "Australia"), weatherCondition: "clear", weatherWind: "West at 16kph", weatherHumidity: "91%", weatherTemp: "14", weatherFeelsLike: "14", weatherLastUpdated: "1399679406"),
        .init(name: "Warwick", country: Country(id: "123", name: "United Kingdom"), weatherCondition: "Scattered Clouds", weatherWind: "WNW at 0kph", weatherHumidity: "93%", weatherTemp: "12", weatherFeelsLike: "15", weatherLastUpdated: "1409097295")]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Weather"
        tableView.register(WeatherCell.self, forCellReuseIdentifier: "cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherCell
        cell.accessoryType = .disclosureIndicator
        cell.titleLable.text = regions[indexPath.row].name
        cell.subtitleLabel.text = regions[indexPath.row].weatherLastUpdated
        cell.temperatureLabel.text = "\(regions[indexPath.row].weatherTemp)º"
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller =  WeatherDetailViewController(
            regionName: regions[indexPath.row].name,
            weatherCondition: regions[indexPath.row].weatherCondition,
            wind: regions[indexPath.row].weatherWind,
            humidity: regions[indexPath.row].weatherHumidity,
            temp: regions[indexPath.row].weatherTemp,
            feelsLike: regions[indexPath.row].weatherFeelsLike,
            lastUpdated: regions[indexPath.row].weatherLastUpdated
        )
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
}


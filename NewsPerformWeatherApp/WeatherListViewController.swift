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
        .init(name: "Baumaris", country: Country(id: "123", name: "Australia"), weatherCondition: "Sunny", weatherWind: "Wind: ESE at 17kph", weatherHumidity: "Humidity: 65%", weatherTemp: "27", weatherFeelsLike: "34", weatherLastUpdated: "1401666605"),
        .init(name: "Albany", country: Country(id: "123", name: "Australia"), weatherCondition: "clear", weatherWind: "Wind: West at 16kph", weatherHumidity: "Humidity: 91%", weatherTemp: "14", weatherFeelsLike: "14", weatherLastUpdated: "1399679406"),
        .init(name: "Warwick", country: Country(id: "123", name: "United Kingdom"), weatherCondition: "Scattered Clouds", weatherWind: "Wind: WNW at 0kph", weatherHumidity: "Humidity: 93%", weatherTemp: "12", weatherFeelsLike: "15", weatherLastUpdated: "1409097295")]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Weather"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.137254902, green: 0.2588235294, blue: 0.3333333333, alpha: 1)
        tableView.register(WeatherCell.self, forCellReuseIdentifier: "cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherCell
        cell.titleLable.text = regions[indexPath.row].name
        cell.subtitleLabel.text = regions[indexPath.row].weatherLastUpdated
        cell.temperatureLabel.text = "\(regions[indexPath.row].weatherTemp)º"
        
        return cell
    }
    
}


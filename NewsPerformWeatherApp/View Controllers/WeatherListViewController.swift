//
//  ViewController.swift
//  NewsPerformWeatherApp
//
//  Created by Nadya Postriganova on 15/5/20.
//  Copyright © 2020 Nadya Postriganova. All rights reserved.
//

import UIKit

class WeatherListViewController: UITableViewController {
    let dataService = DataService.shared
    
    var regions = [Region]()
    
    lazy var refresher: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        let attributes = [NSAttributedString.Key.foregroundColor: Theme.Color.grayLabel]
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Weather Data ...", attributes: attributes)
        refreshControl.tintColor = Theme.Color.blueLabel
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        return refreshControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        self.title = "Weather"
        tableView.register(WeatherCell.self, forCellReuseIdentifier: "cell")
        tableView.refreshControl = refresher
    }
    
    @objc func refresh(_ sender: Any) {
       loadData()
    }
    
    func loadData() {
        dataService.fetchData(completion: { result in
            switch result {
            case .success(_):
                self.regions = self.dataService.getRegions()
                self.tableView.reloadData()
                let deadline = DispatchTime.now() + .milliseconds(700)
                DispatchQueue.main.asyncAfter(deadline: deadline) {
                    self.refresher.endRefreshing()
                }
            case .failure(let reason):
                let alert = UIAlertController(title: "Error", message: "\(reason)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
        })
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherCell
        cell.accessoryType = .disclosureIndicator
        cell.titleLable.text = regions[indexPath.row].name
        cell.subtitleLabel.text = Helpers.formattedDate(regions[indexPath.row].weatherLastUpdated)
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


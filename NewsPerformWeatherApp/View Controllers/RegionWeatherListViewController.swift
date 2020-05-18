//
//  ViewController.swift
//  NewsPerformWeatherApp
//
//  Created by Nadya Postriganova on 15/5/20.
//  Copyright © 2020 Nadya Postriganova. All rights reserved.
//

import UIKit

class RegionWeatherListViewController: UITableViewController {
    let dataService = DataService.shared
    
    var regions = [Region]()
    
    let country: Country?
    
    lazy var refresher: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        let attributes = [NSAttributedString.Key.foregroundColor: Theme.Color.grayLabel]
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Weather Data ...", attributes: attributes)
        refreshControl.tintColor = Theme.Color.blueLabel
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        return refreshControl
    }()
    
    init(for country: Country? = nil) {
        self.country = country
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.refreshControl = refresher
        setupNavigationBar()
    }
    func setupNavigationBar() {
        if country == nil {
            self.title = "Weather"
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(sortTapped))
            navigationItem.rightBarButtonItem?.tintColor = Theme.Color.blueLabel
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "All Countries", style: .plain, target: self, action: #selector(allCountriesTapped))
            navigationItem.leftBarButtonItem?.tintColor = Theme.Color.blueLabel
        } else {
            guard let country = self.country else { return }
            self.title = country.name
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backTapped))
            navigationItem.leftBarButtonItem?.tintColor = Theme.Color.blueLabel
        }
    }
    
    @objc func refresh(_ sender: Any) {
       loadData()
    }
    // MARK: - Load Data
    
    func loadData() {
        dataService.fetchData(completion: { result in
            switch result {
            case .success(_):
                if self.country != nil {
                    guard let country = self.country else { return }
                    self.regions = self.dataService.getRegions(for: country.id)
                    self.tableView.reloadData()
                } else {
                    self.regions = self.dataService.getRegions()
                    self.tableView.reloadData()
                    let deadline = DispatchTime.now() + .milliseconds(700)
                    DispatchQueue.main.asyncAfter(deadline: deadline) {
                        self.refresher.endRefreshing()
                    }
                }
            case .failure(let reason):
                let alert = UIAlertController(title: "Error", message: "\(reason)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
        })
    }
    
    // MARK: - Sorting
    
    @objc func sortTapped() {
        let alert = UIAlertController(title: "Sort by", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "A-Z", style: .default, handler: { _ in
            print ("Sort by A-Z")
            self.regions = self.dataService.sortedByAlpha()
            self.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Last updated", style: .default, handler: { _ in
            print ("Sort by Last updated")
            self.regions = self.dataService.sortedRegionsByDate()
            self.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Temperature", style: .default, handler: { _ in
            print ("Sort by Temperature")
            self.regions = self.dataService.sortedByTemp()
            self.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: WeatherCell = tableView.dequeueOrCreateCell()
        cell.titleLable.text = regions[indexPath.row].name
        cell.subtitleLabel.text = Helpers.formattedDate(regions[indexPath.row].weatherLastUpdated)
        cell.temperatureLabel.text = "\(regions[indexPath.row].weatherTemp)º"
        
        return cell
    }
    
    // MARK: - Navigation
    
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
    
    @objc func allCountriesTapped() {
        let controller =  CountryListViewController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    @objc func backTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}


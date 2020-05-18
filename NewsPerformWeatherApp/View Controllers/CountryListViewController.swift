//
//  CountryListViewController.swift
//  NewsPerformWeatherApp
//
//  Created by Nadya Postriganova on 18/5/20.
//  Copyright © 2020 Nadya Postriganova. All rights reserved.
//

import UIKit

class CountryListViewController: UITableViewController {
    let dataService = DataService.shared
    
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        title = "Countries"
        tableView.rowHeight = 58
    }
    
    func loadData() {
        dataService.fetchData(completion: { result in
            switch result {
            case .success(_):
                self.countries = self.dataService.getCountries()
                self.tableView.reloadData()

            case .failure(let reason):
                let alert = UIAlertController(title: "Error", message: "\(reason)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
        })
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueOrCreateCell()
        let disclosureIndicator = UIImageView(image: UIImage(named: "disclosureIndicator"))
        disclosureIndicator.setImageColor(color: Theme.Color.blueLabel)
        
        cell.accessoryView = disclosureIndicator
        cell.textLabel?.text = countries[indexPath.row].name
        cell.textLabel?.font = Theme.Font.titleLabel
        cell.textLabel?.textColor = Theme.Color.grayLabel
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = countries[indexPath.row]
        let controller =  RegionWeatherListViewController(for: country)
        navigationController?.pushViewController(controller, animated: true)
    }
}


//
//  WeatherCell.swift
//  NewsPerformWeatherApp
//
//  Created by Nadya Postriganova on 16/5/20.
//  Copyright © 2020 Nadya Postriganova. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    let titleLable: UILabel
    let subtitleLabel: UILabel
    let temperatureLabel: UILabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        titleLable = UILabel()
        subtitleLabel = UILabel()
        temperatureLabel = UILabel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let vStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.distribution = .fillProportionally
            stack.addArrangedSubview(titleLable)
            stack.addArrangedSubview(subtitleLabel)
            return stack
        }()
        let hStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .equalCentering
            stack.addArrangedSubview(vStack)
            stack.addArrangedSubview(temperatureLabel)
            return stack
            
        }()
        contentView.addSubview(hStack)
       
        hStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            hStack.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            hStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30),
            hStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
        ])
        temperatureLabel.font = UIFont.boldSystemFont(ofSize: 50)
        temperatureLabel.textColor = #colorLiteral(red: 0.6509803922, green: 0.9098039216, blue: 0.9176470588, alpha: 1)
        titleLable.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        titleLable.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        subtitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        subtitleLabel.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

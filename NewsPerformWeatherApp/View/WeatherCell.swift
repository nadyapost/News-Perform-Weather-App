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
            stack.addArrangedSubviews([titleLable, subtitleLabel])
            return stack
        }()
        let hStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .equalCentering
            stack.addArrangedSubviews([vStack, temperatureLabel])
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
        temperatureLabel.font = Theme.Font.largeTitleLabel
        temperatureLabel.textColor = Theme.Color.blueLabel
        titleLable.font = Theme.Font.titleLabel
        titleLable.textColor = Theme.Color.grayLabel
        subtitleLabel.font = Theme.Font.subtitleLabel
        subtitleLabel.textColor = Theme.Color.grayLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

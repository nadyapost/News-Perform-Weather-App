//
//  WeatherDetailView.swift
//  NewsPerformWeatherApp
//
//  Created by Nadya Postriganova on 17/5/20.
//  Copyright © 2020 Nadya Postriganova. All rights reserved.
//

import UIKit

class WeatherDetailView: UIView {
     let regionLabel = UILabel()
     let weatherConditionLabel = UILabel()
     let temperatureLabel = UILabel()
     
     let dividerView = UIView()
     let dividerView2 = UIView()
     
     let feelsLikeLabel = UILabel()
     let feelsLikeLabelValue = UILabel()
     
     let humidityLabel = UILabel()
     var humidityLabelValue = UILabel()
     
     let windLabel = UILabel()
     let windLabelValue = UILabel()
     
     let lastUpdatedLabel = UILabel()
    
    override init(frame: CGRect) {

        super.init(frame: frame)
        setupViews()
        setupColors()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews() {
        let topVStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.distribution = .fillProportionally
            stack.addArrangedSubviews([regionLabel, weatherConditionLabel])
            return stack
        }()
        let topHStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .equalCentering
            stack.addArrangedSubviews([topVStack, temperatureLabel])
            return stack
        }()
        let middleVstack1: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.addArrangedSubviews([feelsLikeLabel, feelsLikeLabelValue])
            return stack
        }()
        
        let middleVstack2: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.addArrangedSubviews([humidityLabel, humidityLabelValue])
            return stack
        }()
        
        let middleVstack3: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.addArrangedSubviews([windLabel, windLabelValue])
            return stack
        }()
        
        let middleHStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .equalCentering
            stack.addArrangedSubviews([middleVstack1, middleVstack2, middleVstack3])
            return stack
        }()
        
        let mainVStack: UIStackView = {
            let stack = UIStackView()
            stack.spacing = 20
            stack.axis = .vertical
            stack.distribution = .fillProportionally
            lastUpdatedLabel.textAlignment = .center
            stack.addArrangedSubviews([topHStack, dividerView, middleHStack, dividerView2, lastUpdatedLabel])
            
            return stack
        }()
        self.addSubview(mainVStack)
        mainVStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView2.heightAnchor.constraint(equalToConstant: 1),
            mainVStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            mainVStack.topAnchor.constraint(equalTo: self.topAnchor , constant: 20),
            mainVStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            mainVStack.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.55)
        ])
    }
    
    func setupColors() {
        dividerView.backgroundColor = Theme.Color.lightGray
        dividerView2.backgroundColor = Theme.Color.lightGray
        
        temperatureLabel.font = Theme.Font.largeTitleLabel
        temperatureLabel.textColor = Theme.Color.blueLabel
        
        regionLabel.font = Theme.Font.titleLabel
        regionLabel.textColor = Theme.Color.grayLabel
        
        weatherConditionLabel.font = Theme.Font.subtitleLabel
        weatherConditionLabel.textColor = Theme.Color.grayLabel
        
        feelsLikeLabel.font = Theme.Font.boldSubtitleLabel
        feelsLikeLabel.textColor = Theme.Color.grayLabel
        feelsLikeLabelValue.font = Theme.Font.thinSubtitleLabel
        feelsLikeLabelValue.textColor = Theme.Color.blueLabel
        
        humidityLabel.font = Theme.Font.boldSubtitleLabel
        humidityLabel.textColor = Theme.Color.grayLabel
        humidityLabelValue.font = Theme.Font.thinSubtitleLabel
        humidityLabelValue.textColor = Theme.Color.blueLabel
        
        windLabel.font = Theme.Font.boldSubtitleLabel
        windLabel.textColor = Theme.Color.grayLabel
        windLabelValue.font = Theme.Font.thinSubtitleLabel
        windLabelValue.textColor = Theme.Color.blueLabel
        
        lastUpdatedLabel.font = Theme.Font.thinSubtitleLabel
        lastUpdatedLabel.textColor = Theme.Color.grayLabel
    }
}

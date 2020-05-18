//
//  UIStackView Extention.swift
//  NewsPerformWeatherApp
//
//  Created by Nadya Postriganova on 18/5/20.
//  Copyright © 2020 Nadya Postriganova. All rights reserved.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}

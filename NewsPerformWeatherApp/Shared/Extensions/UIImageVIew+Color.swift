//
//  UIImageVIew+Color.swift
//  NewsPerformWeatherApp
//
//  Created by Nadya Postriganova on 18/5/20.
//  Copyright © 2020 Nadya Postriganova. All rights reserved.
//

import UIKit

extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}

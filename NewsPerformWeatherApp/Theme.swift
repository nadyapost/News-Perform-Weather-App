//
//  Theme.swift
//  NewsPerformWeatherApp
//
//  Created by Nadya Postriganova on 17/5/20.
//  Copyright © 2020 Nadya Postriganova. All rights reserved.
//

import UIKit
struct Theme {
    struct Color {
        static let white = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        static let lightGray = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        static let grayLabel = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        static let blueLabel = #colorLiteral(red: 0.6509803922, green: 0.9098039216, blue: 0.9176470588, alpha: 1)
        static let navivationBar = #colorLiteral(red: 0.137254902, green: 0.2588235294, blue: 0.3333333333, alpha: 1)
    }
    
    struct Font {
        static let largeTitleLabel = UIFont.boldSystemFont(ofSize: 50)
        static let titleLabel = UIFont.systemFont(ofSize: 24, weight: .medium)
        static let boldTitleLabel = UIFont.boldSystemFont(ofSize: 24)
        static let subtitleLabel = UIFont.systemFont(ofSize: 16, weight: .light)
        static let boldSubtitleLabel = UIFont.boldSystemFont(ofSize: 16)
        static let thinSubtitleLabel = UIFont.systemFont(ofSize: 16, weight: .light)
    }
}

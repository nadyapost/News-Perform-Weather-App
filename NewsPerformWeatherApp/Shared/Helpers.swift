//
//  Region.swift
//  NewsPerformWeatherApp
//
//  Created by Nadya Postriganova on 17/5/20.
//  Copyright © 2020 Nadya Postriganova. All rights reserved.
//

import Foundation

struct Helpers {
    static func getValue(_ string: String?) -> String {
        guard let string = string else { return "-" }
        return String(string.split(separator: ":").last ?? "-").trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    static func formattedDate(_ unixtimeInterval: Double) -> String {
        let date = Date(timeIntervalSince1970: unixtimeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "h:mm a dd MMM yyyy"
        return dateFormatter.string(from: date)
    }
}

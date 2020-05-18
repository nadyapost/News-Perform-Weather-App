//
//  UITableView+Dequeue.swift
//  NewsPerformWeatherApp
//
//  Created by Nadya Postriganova on 18/5/20.
//  Copyright © 2020 Nadya Postriganova. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeueOrCreateCell<T: UITableViewCell>() -> T {
        let reuseID = String(describing: T.self)
        
        var cell: T! = dequeueReusableCell(withIdentifier: reuseID) as? T
        
        if cell == nil {
            cell = T(style: .default, reuseIdentifier: reuseID)
        }
        return cell
    }
}

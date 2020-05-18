//
//  SceneDelegate.swift
//  NewsPerformWeatherApp
//
//  Created by Nadya Postriganova on 15/5/20.
//  Copyright © 2020 Nadya Postriganova. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        let rootViewController = UINavigationController(rootViewController: RegionWeatherListViewController())
        self.window?.rootViewController = rootViewController
        self.window?.makeKeyAndVisible()
        self.window?.tintColor = Theme.Color.grayLabel
    }

    func sceneDidDisconnect(_ scene: UIScene) {
 
    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }
}


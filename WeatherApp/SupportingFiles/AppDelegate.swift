//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Temirlan Idrissov on 17.02.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: MainViewController())
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        return true
    }

    


}


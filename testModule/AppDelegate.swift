//
//  AppDelegate.swift
//  testModule
//
//  Created by Anna Sverdlova on 31.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let mainVC = MainRouter.createMainModule()
        let rootVC = UINavigationController(rootViewController: mainVC)
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        return true
    }
}


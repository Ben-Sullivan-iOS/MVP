//
//  AppDelegate.swift
//  CrowdScoreDemoApp
//
//  Created by Ben Sullivan on 15/11/2018.
//  Copyright © 2018 Ben Sullivan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    let coordinator = MainCoordinator()
    coordinator.start(window: window)

    return true
  }
  
}

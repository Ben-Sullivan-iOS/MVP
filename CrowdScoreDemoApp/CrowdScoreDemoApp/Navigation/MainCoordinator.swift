//
//  MainCoordinator.swift
//  CrowdScoreDemoApp
//
//  Created by Ben Sullivan on 09/05/2019.
//  Copyright © 2019 Ben Sullivan. All rights reserved.
//

import Foundation

struct MainCoordinator {
  
  static let dataService = DataService()
  static let jsonService = JSONService()
  
  func start(window: UIWindow?) {
    
    let presenter = CompetitionsVCPresenter(
      dataService: MainCoordinator.dataService,
      jsonService: MainCoordinator.jsonService)
    
    let vc = CompetitionsVC(presenter: presenter)
    vc.title = "Competitions"
    let navigationController = UINavigationController()
    navigationController.setViewControllers([vc], animated: true)
    
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
  }
  
  func competitionsVC() -> CompetitionsVC {
    let sb = UIStoryboard.init(name: "Main", bundle: nil)
    let vc = sb.instantiateViewController(withIdentifier: "competitionVC") as! CompetitionsVC
    return vc
  }
}

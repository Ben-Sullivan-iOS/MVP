//
//  CompetitionsVCPresenter.swift
//  CrowdScoreDemoApp
//
//  Created by Ben Sullivan on 15/11/2018.
//  Copyright © 2018 Ben Sullivan. All rights reserved.
//

import Foundation

//  Any functionality which needs to be exposed to be added here
protocol CompetitionsVCPresenterType {
  mutating func onViewDidLoad(view: CompetitionsVCDelegate)
}

//  Single responsibility of handling data to be provided to a VC
struct CompetitionsVCPresenter: CompetitionsVCPresenterType {
  
  private let dataService: DataService
  private let jsonService: JSONService
  private var view: CompetitionsVCDelegate?
  
  mutating func onViewDidLoad(view: CompetitionsVCDelegate) {
    self.view = view
    updateCompetitions()
  }
  
  init(dataService: DataService, jsonService: JSONService) {
    self.dataService = dataService
    self.jsonService = jsonService
  }
  
  private mutating func updateCompetitions() {
    guard
      let matchesPath = Bundle.main.path(forResource:"matches", ofType: "json"),
      let matchesResultModel = jsonService.getJSONData(filePath: matchesPath)
      else {
        return
    }
    
    view?.competitions = dataService.createCompetitions(matchModels: matchesResultModel)
  }
}

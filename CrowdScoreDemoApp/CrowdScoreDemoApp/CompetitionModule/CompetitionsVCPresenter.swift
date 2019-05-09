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

struct CompetitionRepresentable {
  let ordering: Int
  var matches: [Match]?
  let name: String
}

//  Single responsibility of handling data to be provided to a VC
struct CompetitionsVCPresenter: CompetitionsVCPresenterType {
  
  private let dataService: DataService
  private weak var view: CompetitionsVCDelegate?
  
  init(dataService: DataService) {
    self.dataService = dataService
  }
  
  mutating func onViewDidLoad(view: CompetitionsVCDelegate) {
    self.view = view
    populateData()
  }
  
  private mutating func populateData() {
    guard let matchModels = getMatchModels() else { return }
    let representables = createRepresentables(from: matchModels)
    view?.competitions = representables
  }
  
  private func getMatchModels() -> [MatchesResultModel]? {
    guard
      let matchesPath = Bundle.main.path(forResource:"matches", ofType: "json") else {
        return nil
    }
    return dataService.getJSONData(filePath: matchesPath)
  }
  
  private func createRepresentables(from matchModels: [MatchesResultModel]) -> [CompetitionRepresentable] {
    var competitions = [CompetitionRepresentable]()
    
    let matchModelsSortedByCompetition = matchModels.sorted { $0.competition.ordering < $1.competition.ordering }
    
    matchModelsSortedByCompetition.forEach { match in
      let newMatch = Match(
        homeTeam: Team(shortName: match.homeTeam.shortName),
        awayTeam: Team(shortName: match.awayTeam.shortName),
        kickOffTime: match.kickOffTime.asTimeString())
      
      if competitions.isEmpty {
        let competition = CompetitionRepresentable(ordering: match.competition.ordering, matches: [newMatch], name: match.competition.name)
        competitions.append(competition)
        return
      }
      
      if var comp = competitions.last, match.competition.ordering == comp.ordering {
        
        comp.matches?.append(newMatch)
        competitions.removeLast()
        competitions.append(comp)
      } else {
        let competition = CompetitionRepresentable(ordering: match.competition.ordering, matches: [newMatch], name: match.competition.name)
        competitions.append(competition)
      }
    }
    
    return competitions
  }
}

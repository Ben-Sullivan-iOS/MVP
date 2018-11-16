//
//  CompetitionModel.swift
//  CrowdScoreDemoApp
//
//  Created by Ben Sullivan on 15/11/2018.
//  Copyright © 2018 Ben Sullivan. All rights reserved.
//

import Foundation

struct MatchesResultModel: Codable {
    let homeTeam: Team
    let awayTeam: Team
    let kickOffTime: Int
    let competition: Competition
    
    enum CodingKeys: String, CodingKey {
        case kickOffTime = "start"
        case homeTeam
        case awayTeam
        case competition
    }
}

struct Competition: Codable {
    let ordering: Int
    var matches: [Match]?
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case ordering
        case name
    }
}

struct Match {
    let homeTeam: Team
    let awayTeam: Team
    let kickOffTime: String
}

struct Team: Codable {
    let shortName: String
}

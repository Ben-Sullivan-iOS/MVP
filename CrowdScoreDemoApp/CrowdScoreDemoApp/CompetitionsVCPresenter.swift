//
//  CompetitionsVCPresenter.swift
//  CrowdScoreDemoApp
//
//  Created by Ben Sullivan on 15/11/2018.
//  Copyright © 2018 Ben Sullivan. All rights reserved.
//

import Foundation

struct CompetitionsVCPresenter {
    
    weak var delegate: CompetitionsVCDelegate?
    
    var competitions: [Competition]? {
        didSet {
            guard let competitions = self.competitions else { return }
            delegate?.modelDataUpdated(competitions: competitions)
        }
    }
    
    init() {
        
        guard let matchesResultModel = JSONService().getJSONData() else { return }
        
        competitions = DataService().createCompetitions(matchModels: matchesResultModel)
    }
}

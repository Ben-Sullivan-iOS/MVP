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
}

//  Single responsibility of handling data to be provided to a VC
struct CompetitionsVCPresenter: CompetitionsVCPresenterType {
    
    private weak var delegate: CompetitionsVCDelegate?
    
    private var competitions: [Competition]? {
        didSet {
            guard let competitions = self.competitions else { return }
            delegate?.modelDataUpdated(competitions: competitions)
        }
    }
    
    init(delegate: CompetitionsVCDelegate) {
        self.delegate = delegate
        updateCompetitions()
    }
    
    private mutating func updateCompetitions() {
        
        guard
            let matchesPath = Bundle.main.path(forResource:"matches", ofType: "json"),
            let matchesResultModel = JSONService().getJSONData(filePath: matchesPath)
            else {
                return
        }
        
        competitions = DataService().createCompetitions(matchModels: matchesResultModel)
    }
}

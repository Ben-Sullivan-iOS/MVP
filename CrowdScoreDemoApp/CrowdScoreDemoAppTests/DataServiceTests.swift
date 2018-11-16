//
//  CrowdScoreDemoAppTests.swift
//  CrowdScoreDemoAppTests
//
//  Created by Ben Sullivan on 15/11/2018.
//  Copyright © 2018 Ben Sullivan. All rights reserved.
//

import XCTest
@testable import CrowdScoreDemoApp

class DataServiceTests: XCTestCase {
    
    var validModel: [MatchesResultModel]?
    var invalidModel = [MatchesResultModel]()
    var dataService: DataService?

    override func setUp() {
        guard let matchesPath = Bundle.main.path(forResource:"matches", ofType: "json") else { return }
        validModel = JSONService().getJSONData(filePath: matchesPath)
        dataService = DataService()
    }

    func testCorrectModel() {
        guard let validModel = validModel else { return }
        let result = dataService?.createCompetitions(matchModels: validModel)
        XCTAssertNotNil(result)
    }

    func testPerformanceExample() {
        guard let validModel = validModel else { return }
        
        self.measure {
            let _ = dataService?.createCompetitions(matchModels: validModel)
        }
    }

}

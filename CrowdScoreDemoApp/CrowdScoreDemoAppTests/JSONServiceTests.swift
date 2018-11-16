//
//  JSONServiceTests.swift
//  CrowdScoreDemoAppTests
//
//  Created by Ben Sullivan on 16/11/2018.
//  Copyright © 2018 Ben Sullivan. All rights reserved.
//

import XCTest
@testable import CrowdScoreDemoApp

class JSONServiceTests: XCTestCase {

    var validJSONPath: String?
    var jsonService: JSONService?
    let invalidPath = "invalidFilePath"
    
    override func setUp() {
        guard let matchesPath = Bundle.main.path(forResource:"mockJSON", ofType: "json") else { return }
        
        validJSONPath = matchesPath
        
        jsonService = JSONService()
    }
    
    func testCorrectJSONPath() {
        guard let validJSONPath = validJSONPath else { return }
        let result = jsonService?.getJSONData(filePath: validJSONPath)
        XCTAssert(result?.count == 2)
    }
    
    func testInvalidJSONPath() {
        let result = jsonService?.getJSONData(filePath: invalidPath)
        XCTAssertNil(result)
    }
    
    func testPerformanceExampleWithLiveData() {
        guard let matchesPath = Bundle.main.path(forResource:"matches", ofType: "json") else { return }
        self.measure {
            let _ = jsonService?.getJSONData(filePath: matchesPath)
        }
    }
}

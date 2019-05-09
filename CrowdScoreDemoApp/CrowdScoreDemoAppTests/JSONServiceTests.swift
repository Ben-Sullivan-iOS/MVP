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
    
    var arr = [Int]()
    
    func setArray() {
        for i in 0...100000 {
            arr.append(i)
        }
    }
    
    func testMapPerformance() {
        setArray()
        var arr2 = [Int]()
        
        self.measure {
            let _ = arr.map({ i -> Void in
                let sum = 50 * i
                arr2.append(sum)
            })
        }
    }
    
    func testForEachPerformance() {
        setArray()
        var arr2 = [Int]()
        
        self.measure {
            arr.forEach({ i in
                let sum = 50 * i
                arr2.append(sum)
            })
        }
    }
}

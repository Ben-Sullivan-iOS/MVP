//
//  JSONService.swift
//  CrowdScoreDemoApp
//
//  Created by Ben Sullivan on 15/11/2018.
//  Copyright © 2018 Ben Sullivan. All rights reserved.
//

import Foundation

struct DataService {
    
    func getJSONData(filePath: String) -> [MatchesResultModel]? {
        guard let contentData = FileManager.default.contents(atPath: filePath) else { return nil }
        let jsonString = String(data:contentData, encoding:String.Encoding.utf8)
        let jsonData = jsonString?.data(using: .utf8)
        
        return decodeToModel(JSONData: jsonData)
    }
    
    private func decodeToModel(JSONData: Data?) -> [MatchesResultModel]? {
        guard let JSONData = JSONData else { return nil }
        do {
            return try JSONDecoder().decode([MatchesResultModel].self, from: JSONData)
        } catch {
            print(error)
            return nil
        }
    }
    
}

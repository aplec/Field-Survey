//
//  ObservationEventLoader.swift
//  Field Survey
//
//  Created by Ante Plecas on 11/22/19.
//  Copyright © 2019 Ante Plecas. All rights reserved.
//

import Foundation

class FieldSurveyLoader {
    
    class func load(jsonFileName: String) -> ObservationEvents? {
        var observationEvents: ObservationEvents?
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl) {
                observationEvents = try? jsonDecoder.decode(ObservationEvents.self, from: jsonData)
        }
        
        return observationEvents
    }
}

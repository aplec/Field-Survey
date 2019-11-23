//
//  ObservationEvent.swift
//  Field Survey
//
//  Created by Ante Plecas on 11/22/19.
//  Copyright © 2019 Ante Plecas. All rights reserved.
//

import Foundation

enum Observation: String, Codable{
    case amphibian
    case bird
    case fish
    case insect
    case mammal
    case plant
    case reptile
}

struct ObservationEvent: Codable {
    var observation: Observation
    var classification: String
    var title: String
    var description: String
    var date: Date
}

struct ObservationEvents: Codable {
    var status: String
    var observations: [ObservationEvent]
}

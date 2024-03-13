//
//  CambionDrift.swift
//  Orokin Collective
//
//  Created by Bradlee King on 12/03/2024.
//

import Foundation

struct CambionCycle: Codable {
    let id: String
    let activation: String
    let expiry: String
    let timeLeft: String
    let state: String
    let active: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case activation = "activation"
        case expiry = "expiry"
        case timeLeft = "timeLeft"
        case state = "state"
        case active = "active"
    }
}

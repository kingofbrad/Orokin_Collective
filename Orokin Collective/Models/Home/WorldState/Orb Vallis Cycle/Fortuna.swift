//
//  Fortuna.swift
//  Orokin Collective
//
//  Created by Bradlee King on 12/03/2024.
//

import Foundation

struct VallisCycle: Codable {
    let id: String
    let expiry: String
    let isWarm: Bool
    let state: String
    let activation: String
    let timeLeft: String
    let shortString: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case expiry = "expiry"
        case isWarm = "isWarm"
        case state = "state"
        case activation = "activation"
        case timeLeft = "timeLeft"
        case shortString = "shortString"
    }
}

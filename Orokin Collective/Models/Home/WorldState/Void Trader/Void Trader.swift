// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let voidTrader = try? JSONDecoder().decode(VoidTrader.self, from: jsonData)

import Foundation

// MARK: - VoidTrader
struct VoidTrader: Codable {
    let id: String
    let activation: String
    let startString: String
    let expiry: String
    let active: Bool
    let character: String
    let location: String
    let inventory: [JSONAny]
    let psId: String
    let endString: String
    let initialStart: String
    let schedule: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case activation = "activation"
        case startString = "startString"
        case expiry = "expiry"
        case active = "active"
        case character = "character"
        case location = "location"
        case inventory = "inventory"
        case psId = "psId"
        case endString = "endString"
        case initialStart = "initialStart"
        case schedule = "schedule"
    }
}


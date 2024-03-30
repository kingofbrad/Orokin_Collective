// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let earthCycle = try? JSONDecoder().decode(EarthCycle.self, from: jsonData)

import Foundation

// MARK: - EarthCycle
struct EarthCycle: Codable {
    let id: String
    let expiry: String
    let activation: String
    let isDay: Bool
    let state: String
    let timeLeft: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case expiry = "expiry"
        case activation = "activation"
        case isDay = "isDay"
        case state = "state"
        case timeLeft = "timeLeft"
    }
}

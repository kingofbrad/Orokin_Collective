//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let steelPath = try? JSONDecoder().decode(SteelPath.self, from: jsonData)
//
//import Foundation
//
//// MARK: - SteelPath
//struct SteelPath: Codable {
//    let currentReward: CurrentReward
//    let activation: String
//    let expiry: String
//    let remaining: String
//    let rotation: [CurrentReward]
//    let evergreens: [CurrentReward]
//    let incursions: Incursions
//
//    enum CodingKeys: String, CodingKey {
//        case currentReward = "currentReward"
//        case activation = "activation"
//        case expiry = "expiry"
//        case remaining = "remaining"
//        case rotation = "rotation"
//        case evergreens = "evergreens"
//        case incursions = "incursions"
//    }
//}
//
//// MARK: - CurrentReward
//struct CurrentReward: Codable {
//    let name: String
//    let cost: Int
//
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case cost = "cost"
//    }
//}
//
//// MARK: - Incursions
//struct Incursions: Codable {
//    let id: String
//    let activation: String
//    let expiry: String
//
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case activation = "activation"
//        case expiry = "expiry"
//    }
//}

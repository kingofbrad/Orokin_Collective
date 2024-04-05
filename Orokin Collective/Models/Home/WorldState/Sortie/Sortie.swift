//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let sortie = try? JSONDecoder().decode(Sortie.self, from: jsonData)
//
//import Foundation
//
//// MARK: - Sortie
//struct Sortie: Codable {
//    let id: String
//    let activation: String
//    let startString: String
//    let expiry: String
//    let active: Bool
//    let rewardPool: String
//    let variants: [Variant]
//    let missions: [JSONAny]
//    let boss: String
//    let faction: String
//    let factionKey: String
//    let expired: Bool
//    let eta: String
//
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case activation = "activation"
//        case startString = "startString"
//        case expiry = "expiry"
//        case active = "active"
//        case rewardPool = "rewardPool"
//        case variants = "variants"
//        case missions = "missions"
//        case boss = "boss"
//        case faction = "faction"
//        case factionKey = "factionKey"
//        case expired = "expired"
//        case eta = "eta"
//    }
//}
//
//// MARK: - Variant
//struct Variant: Codable {
//    let missionType: String
//    let missionTypeKey: String
//    let modifier: String
//    let modifierDescription: String
//    let node: String
//    let nodeKey: String
//
//    enum CodingKeys: String, CodingKey {
//        case missionType = "missionType"
//        case missionTypeKey = "missionTypeKey"
//        case modifier = "modifier"
//        case modifierDescription = "modifierDescription"
//        case node = "node"
//        case nodeKey = "nodeKey"
//    }
//}
//
//
//
//
//

//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let fissures = try? JSONDecoder().decode(Fissures.self, from: jsonData)
//
//import Foundation
//
//// MARK: - Fissure
//struct Fissure: Codable {
//    let id: String
//    let activation: String
//    let startString: String
//    let expiry: String
//    let active: Bool
//    let node: String
//    let missionType: String
//    let missionKey: String
//    let enemy: Enemy
//    let enemyKey: Enemy
//    let nodeKey: String
//    let tier: String
//    let tierNum: Int
//    let expired: Bool
//    let eta: String
//    let isStorm: Bool
//    let isHard: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case activation = "activation"
//        case startString = "startString"
//        case expiry = "expiry"
//        case active = "active"
//        case node = "node"
//        case missionType = "missionType"
//        case missionKey = "missionKey"
//        case enemy = "enemy"
//        case enemyKey = "enemyKey"
//        case nodeKey = "nodeKey"
//        case tier = "tier"
//        case tierNum = "tierNum"
//        case expired = "expired"
//        case eta = "eta"
//        case isStorm = "isStorm"
//        case isHard = "isHard"
//    }
//}
//
//enum Enemy: String, Codable {
//    case corpus = "Corpus"
//    case grineer = "Grineer"
//    case infested = "Infested"
//    case orokin = "Orokin"
//}
//
//typealias Fissures = [Fissure]

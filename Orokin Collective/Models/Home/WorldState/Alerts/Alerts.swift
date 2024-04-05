//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let alerts = try? JSONDecoder().decode(Alerts.self, from: jsonData)
//
//import Foundation
//
//// MARK: - Alert
//struct Alert: Codable, Identifiable {
//    let id: String
//    let activation: String
//    let startString: String
//    let expiry: String
//    let active: Bool
//    let mission: Mission
//    let eta: String
//    let rewardTypes: [String]
//
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case activation = "activation"
//        case startString = "startString"
//        case expiry = "expiry"
//        case active = "active"
//        case mission = "mission"
//        case eta = "eta"
//        case rewardTypes = "rewardTypes"
//    }
//}
//
//// MARK: - Mission
//struct Mission: Codable {
//    let node: String
//    let nodeKey: String
//    let type: String
//    let typeKey: String
//    let faction: String
//    let factionKey: String
//    let reward: Reward
//    let minEnemyLevel: Int
//    let maxEnemyLevel: Int
//    let nightmare: Bool
//    let archwingRequired: Bool
//    let isSharkwing: Bool
//    let levelOverride: String
//    let enemySpec: String
// 
//    
//
//    enum CodingKeys: String, CodingKey {
//        case node = "node"
//        case nodeKey = "nodeKey"
//        case type = "type"
//        case typeKey = "typeKey"
//        case faction = "faction"
//        case factionKey = "factionKey"
//        case reward = "reward"
//        case minEnemyLevel = "minEnemyLevel"
//        case maxEnemyLevel = "maxEnemyLevel"
//        case nightmare = "nightmare"
//        case archwingRequired = "archwingRequired"
//        case isSharkwing = "isSharkwing"
//        case levelOverride = "levelOverride"
//        case enemySpec = "enemySpec"
//    }
//}
//
//// MARK: - Reward
//struct Reward: Codable {
//    let items: [String]
//    let credits: Int
//    let asString: String
//    let itemString: String
//    let thumbnail: String
//    let color: Int
//
//    enum CodingKeys: String, CodingKey {
//        case items = "items"
//        case credits = "credits"
//        case asString = "asString"
//        case itemString = "itemString"
//        case thumbnail = "thumbnail"
//        case color = "color"
//    }
//}
//
//typealias Alerts = [Alert]
//
//// MARK: - Encode/decode helpers
//
//
//
//

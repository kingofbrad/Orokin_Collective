//
//  Warframes.swift
//  Orokin Collective
//
//  Created by Bradlee King on 24/02/2024.
//

import Foundation


struct Warframes: Codable, Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let health: Int
    let shield: Int
    let armor: Int
    let power: Int
    let sprintSpeed: Double
    
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
        case health = "health"
        case shield = "shield"
        case armor = "armor"
        case power = "power"
        case sprintSpeed = "sprintSpeed"
    }
}


typealias Warframe = [Warframes]


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let warframes = try? JSONDecoder().decode(Warframes.self, from: jsonData)

//import Foundation
//
//// MARK: - Warframe
//struct Warframe: Codable {
//    let abilities: [Ability]
//    let armor: Int
//    let buildPrice: Int?
//    let buildQuantity: Int?
//    let buildTime: Int?
//    let category: Category
//    let components: [Component]?
//    let consumeOnBuild: Bool?
//    let description: String
//    let health: Int
//    let imageName: String
//    let isPrime: Bool
//    let masterable: Bool
//    let masteryReq: Int
//    let name: String
//    let patchlogs: [Patchlog]?
//    let power: Int
//    let productCategory: ProductCategory
//    let shield: Int
//    let skipBuildTimePrice: Int?
//    let sprintSpeed: Double
//    let stamina: Int
//    let tradable: Bool
//    let type: WarframeType
//    let uniqueName: String
//    let aura: Aura?
//    let bpCost: Int?
//    let color: Int?
//    let conclave: Bool?
//    let introduced: Introduced?
//    let marketCost: Int?
//    let passiveDescription: String?
//    let polarities: [Aura]?
//    let releaseDate: String?
//    let sex: Sex?
//    let sprint: Double?
//    let wikiaThumbnail: String?
//    let wikiaURL: String?
//    let estimatedVaultDate: String?
//    let vaultDate: String?
//    let vaulted: Bool?
//    let exalted: [String]?
//
//    enum CodingKeys: String, CodingKey {
//        case abilities = "abilities"
//        case armor = "armor"
//        case buildPrice = "buildPrice"
//        case buildQuantity = "buildQuantity"
//        case buildTime = "buildTime"
//        case category = "category"
//        case components = "components"
//        case consumeOnBuild = "consumeOnBuild"
//        case description = "description"
//        case health = "health"
//        case imageName = "imageName"
//        case isPrime = "isPrime"
//        case masterable = "masterable"
//        case masteryReq = "masteryReq"
//        case name = "name"
//        case patchlogs = "patchlogs"
//        case power = "power"
//        case productCategory = "productCategory"
//        case shield = "shield"
//        case skipBuildTimePrice = "skipBuildTimePrice"
//        case sprintSpeed = "sprintSpeed"
//        case stamina = "stamina"
//        case tradable = "tradable"
//        case type = "type"
//        case uniqueName = "uniqueName"
//        case aura = "aura"
//        case bpCost = "bpCost"
//        case color = "color"
//        case conclave = "conclave"
//        case introduced = "introduced"
//        case marketCost = "marketCost"
//        case passiveDescription = "passiveDescription"
//        case polarities = "polarities"
//        case releaseDate = "releaseDate"
//        case sex = "sex"
//        case sprint = "sprint"
//        case wikiaThumbnail = "wikiaThumbnail"
//        case wikiaURL = "wikiaUrl"
//        case estimatedVaultDate = "estimatedVaultDate"
//        case vaultDate = "vaultDate"
//        case vaulted = "vaulted"
//        case exalted = "exalted"
//    }
//}
//
//// MARK: - Ability
//struct Ability: Codable {
//    let uniqueName: String
//    let name: String
//    let description: String
//
//    enum CodingKeys: String, CodingKey {
//        case uniqueName = "uniqueName"
//        case name = "name"
//        case description = "description"
//    }
//}
//
//enum Aura: String, Codable {
//    case aura = "aura"
//    case madurai = "madurai"
//    case naramon = "naramon"
//    case umbra = "umbra"
//    case vazarin = "vazarin"
//    case zenurik = "zenurik"
//}
//
//enum Category: String, Codable {
//    case archwing = "Archwing"
//    case warframes = "Warframes"
//}
//
//// MARK: - Component
//struct Component: Codable {
//    let uniqueName: String
//    let name: String
//    let description: String
//    let itemCount: Int
//    let imageName: String
//    let tradable: Bool
//    let masterable: Bool
//    let drops: [Drop]
//    let type: ComponentType?
//    let primeSellingPrice: Int?
//    let ducats: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case uniqueName = "uniqueName"
//        case name = "name"
//        case description = "description"
//        case itemCount = "itemCount"
//        case imageName = "imageName"
//        case tradable = "tradable"
//        case masterable = "masterable"
//        case drops = "drops"
//        case type = "type"
//        case primeSellingPrice = "primeSellingPrice"
//        case ducats = "ducats"
//    }
//}
//
//// MARK: - Drop
//struct Drop: Codable {
//    let chance: Double
//    let location: String
//    let rarity: Rarity
//    let type: String
//
//    enum CodingKeys: String, CodingKey {
//        case chance = "chance"
//        case location = "location"
//        case rarity = "rarity"
//        case type = "type"
//    }
//}
//
//enum Rarity: String, Codable {
//    case common = "Common"
//    case rare = "Rare"
//    case uncommon = "Uncommon"
//}
//
//enum ComponentType: String, Codable {
//    case resource = "Resource"
//}
//
//// MARK: - Introduced
//struct Introduced: Codable {
//    let name: String
//    let url: String
//    let aliases: [String]
//    let parent: String
//    let date: String
//
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case url = "url"
//        case aliases = "aliases"
//        case parent = "parent"
//        case date = "date"
//    }
//}
//
//// MARK: - Patchlog
//struct Patchlog: Codable {
//    let name: String
//    let date: Date
//    let url: String
//    let additions: String
//    let changes: String
//    let fixes: String
//
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case date = "date"
//        case url = "url"
//        case additions = "additions"
//        case changes = "changes"
//        case fixes = "fixes"
//    }
//}
//
//enum ProductCategory: String, Codable {
//    case mechSuits = "MechSuits"
//    case spaceSuits = "SpaceSuits"
//    case suits = "Suits"
//}
//
//enum Sex: String, Codable {
//    case female = "Female"
//    case male = "Male"
//    case nonBinaryPluriform = "Non-binary (Pluriform)"
//}
//
//enum WarframeType: String, Codable {
//    case archwing = "Archwing"
//    case warframe = "Warframe"
//}
//
//typealias Warframes = [Warframe]

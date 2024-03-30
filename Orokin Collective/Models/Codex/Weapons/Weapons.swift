import Foundation



struct WeaponElement: Codable, Identifiable {
    let id = UUID()
    let name: String
    let wikiaThumbnail: String?
    let description: String
    let category: String
    let accuracy: Double?
    let masteryReq: Int?
    let fireRate: Double?
    let criticalChance: Double?
    let criticalMultiplier: Double?
    let polarities: [String]?
    let isPrime: Bool
    let magazineSize: Int?
    let multishot: Int?
    let noise: String?
    let disposition: Int?
    let reloadTime: Double?
    let trigger: String?
//    let attacks: [Attack]
    
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case wikiaThumbnail = "wikiaThumbnail"
        case description = "description"
        case category = "category"
        case accuracy = "accuracy"
        case masteryReq = "masteryReq"
        case fireRate = "fireRate"
        case criticalChance = "criticalChance"
        case polarities = "polarities"
        case criticalMultiplier = "criticalMultiplier"
        case isPrime = "isPrime"
        case magazineSize = "magazineSize"
        case multishot = "multishot"
        case noise = "noise"
        case disposition = "disposition"
        case reloadTime = "reloadTime"
        case trigger = "trigger"
//        case attacks = "attacks"
        
        
        
    }
    struct Attack: Codable{
        let name: String
        let speed: Int
        let critChance: Int
        let critMult: Int
        let statusChance: Int
        let shotType: String
        let shotSpeed: Int?
        let flight: Int?
        let damage: Damage?
        let falloff: Falloff?
        
        enum CodingKeys: String, CodingKey {
            case name = "name"
            case speed = "speed"
            case critChance = "crit_chance"
            case critMult = "crit_mult"
            case statusChance = "status_chance"
            case shotType = "shot_type"
            case shotSpeed = "shot_speed"
            case flight = "flight"
            case damage = "damage"
            case falloff = "falloff"
        }
        
        struct Damage: Codable {
            let impact: Int?
            let slash: Double?
            let puncture: Double?
            
            enum CodingKeys: String, CodingKey {
                case impact = "impact"
                case slash = "slash"
                case puncture = "puncture"
            }
        }
        
        
        struct Falloff: Codable{
            
            let start: Int
            let end: Int
            let reduction: Double
            
            enum CodingKeys: String, CodingKey {
                case start = "start"
                case end = "end"
                case reduction = "reduction"
            }
        }
    }
    
}

typealias Weapon = [WeaponElement]





// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weapon = try? JSONDecoder().decode(Weapon.self, from: jsonData)

//import Foundation
//
//struct WeaponResponse: Decodable {
//    let results: [WeaponElement]
//}
//
//// MARK: - WeaponElement
//struct WeaponElement: Codable,Identifiable  {
//    let id = UUID()
//    let accuracy: Double
//    let attacks: [Attack]
//    let buildPrice: Int
//    let buildQuantity: Int
//    let buildTime: Int
//    let category: String
//    let components: [Component]
//    let consumeOnBuild: Bool
//    let criticalChance: Double
//    let criticalMultiplier: Int
//    let damage: [String: Double]
//    let damagePerShot: [Double]
//    let description: String
//    let disposition: Int
//    let fireRate: Double
//    let imageName: String
//    let introduced: Introduced
//    let isPrime: Bool
//    let magazineSize: Int
//    let masterable: Bool
//    let masteryReq: Int
//    let multishot: Int
//    let name: String
//    let noise: String
//    let omegaAttenuation: Double
//    let polarities: [String]
//    let procChance: Double
//    let productCategory: String
//    let releaseDate: String
//    let reloadTime: Double
//    let skipBuildTimePrice: Int
//    let slot: Int
//    let tags: [String]
//    let totalDamage: Int
//    let tradable: Bool
//    let trigger: String
//    let type: String
//    let uniqueName: String
//    let vaulted: Bool
//    let wikiaThumbnail: String
//    let wikiaURL: String
//
//    enum CodingKeys: String, CodingKey {
//        case accuracy = "accuracy"
//        case attacks = "attacks"
//        case buildPrice = "buildPrice"
//        case buildQuantity = "buildQuantity"
//        case buildTime = "buildTime"
//        case category = "category"
//        case components = "components"
//        case consumeOnBuild = "consumeOnBuild"
//        case criticalChance = "criticalChance"
//        case criticalMultiplier = "criticalMultiplier"
//        case damage = "damage"
//        case damagePerShot = "damagePerShot"
//        case description = "description"
//        case disposition = "disposition"
//        case fireRate = "fireRate"
//        case imageName = "imageName"
//        case introduced = "introduced"
//        case isPrime = "isPrime"
//        case magazineSize = "magazineSize"
//        case masterable = "masterable"
//        case masteryReq = "masteryReq"
//        case multishot = "multishot"
//        case name = "name"
//        case noise = "noise"
//        case omegaAttenuation = "omegaAttenuation"
//        case polarities = "polarities"
//        case procChance = "procChance"
//        case productCategory = "productCategory"
//        case releaseDate = "releaseDate"
//        case reloadTime = "reloadTime"
//        case skipBuildTimePrice = "skipBuildTimePrice"
//        case slot = "slot"
//        case tags = "tags"
//        case totalDamage = "totalDamage"
//        case tradable = "tradable"
//        case trigger = "trigger"
//        case type = "type"
//        case uniqueName = "uniqueName"
//        case vaulted = "vaulted"
//        case wikiaThumbnail = "wikiaThumbnail"
//        case wikiaURL = "wikiaUrl"
//    }
//}
//
//// MARK: - Attack
//struct Attack: Codable {
//    let name: String
//    let speed: Int
//    let critChance: Int
//    let critMult: Int
//    let statusChance: Int
//    let shotType: String
//    let shotSpeed: Int?
//    let flight: Int?
//    let damage: Damage
//    let falloff: Falloff?
//
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case speed = "speed"
//        case critChance = "crit_chance"
//        case critMult = "crit_mult"
//        case statusChance = "status_chance"
//        case shotType = "shot_type"
//        case shotSpeed = "shot_speed"
//        case flight = "flight"
//        case damage = "damage"
//        case falloff = "falloff"
//    }
//}
//
//// MARK: - Damage
//struct Damage: Codable {
//    let impact: Int?
//    let slash: Double?
//    let puncture: Double?
//
//    enum CodingKeys: String, CodingKey {
//        case impact = "impact"
//        case slash = "slash"
//        case puncture = "puncture"
//    }
//}
//
//// MARK: - Falloff
//struct Falloff: Codable {
//    let start: Int
//    let end: Int
//    let reduction: Double
//
//    enum CodingKeys: String, CodingKey {
//        case start = "start"
//        case end = "end"
//        case reduction = "reduction"
//    }
//}
//
//// MARK: - Component
//struct Component: Codable {
//    let uniqueName: String
//    let name: String
//    let description: String
//    let primeSellingPrice: Int?
//    let itemCount: Int
//    let imageName: String
//    let tradable: Bool
//    let drops: [Drop]
//    let masterable: Bool
//    let ducats: Int?
//    let type: String?
//
//    enum CodingKeys: String, CodingKey {
//        case uniqueName = "uniqueName"
//        case name = "name"
//        case description = "description"
//        case primeSellingPrice = "primeSellingPrice"
//        case itemCount = "itemCount"
//        case imageName = "imageName"
//        case tradable = "tradable"
//        case drops = "drops"
//        case masterable = "masterable"
//        case ducats = "ducats"
//        case type = "type"
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
//    case rare = "Rare"
//    case uncommon = "Uncommon"
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



//typealias Weapon = [WeaponElement]


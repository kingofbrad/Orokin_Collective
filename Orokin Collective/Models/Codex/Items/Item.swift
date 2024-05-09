// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let items = try? JSONDecoder().decode(Items.self, from: jsonData)

import Foundation

// MARK: - ItemElement
struct ItemElement: Codable, Identifiable {
    let id: UUID = UUID()
    let category: String
    let description: String?
    let imageName: String?
    let masterable: Bool?
    let name: String
    let tradable: Bool
    let type: Faction
    let uniqueName: String
    let excludeFromCodex: Bool?
    let health: Int?
    let shield: Int?
    let armor: Int?
    let regionBits: Int?
    let drops: [Drop]?
    let resistances: [Resistance]?
    let factionIndex: Int?
    let masteryReq: Int?
    let maxEnemyLevel: Int?
    let minEnemyLevel: Int?
    let missionIndex: Int?
    let nodeType: Int?
    let systemIndex: Int?
    let systemName: String?
    let baseDrain: Int?
    let compatName: String?
    let fusionLimit: Int?
    let introduced: Introduced?
    let isAugment: Bool?
    let isPrime: Bool?
    let levelStats: [LevelStat]?
    let patchlogs: [Patchlog]?
    let polarity: Aura?
    let rarity: Rarity?
    let releaseDate: String?
    let transmutable: Bool?
    let wikiaThumbnail: String?
    let wikiaUrl: String?
    let accuracy: Double?
    let attacks: [Attack]?
    let buildPrice: Int?
    let buildQuantity: Int?
    let buildTime: Int?
    let components: [Component]?
    let consumeOnBuild: Bool?
    let criticalChance: Double?
    let criticalMultiplier: Double?
    let damage: [String: Double]?
    let damagePerShot: [Double]?
    let disposition: Int?
    let fireRate: Double?
    let magazineSize: Int?
    let marketCost: Int?
    let multishot: Int?
    let noise: Noise?
    let omegaAttenuation: Double?
    let polarities: [Aura]?
    let procChance: Double?
    let productCategory: ProductCategory?
    let reloadTime: Double?
    let skipBuildTimePrice: Int?
    let slot: Int?
    let tags: [String]?
    let totalDamage: Double?
    let trigger: Trigger?
    let vaulted: Bool?
    let hexColours: [HexColour]?
    let blockingAngle: Int?
    let bpCost: Int?
    let comboDuration: Int?
    let followThrough: Double?
    let heavyAttackDamage: Int?
    let heavySlamAttack: Int?
    let heavySlamRadialDamage: Int?
    let heavySlamRadius: Int?
    let range: Double?
    let slamAttack: Int?
    let slamRadialDamage: Int?
    let slamRadius: Int?
    let slideAttack: Int?
    let stancePolarity: Aura?
    let windUp: Double?
    let power: Int?
    let stamina: Int?
    let isUtility: Bool?
    let itemCount: Int?
    let parents: [String]?
    let showInInventory: Bool?
    let modSet: String?
    let probability: Double?
    let rewardName: String?
    let tier: Int?
    let estimatedVaultDate: String?
    let isExilus: Bool?
    let sentinel: Bool?
    let vaultDate: String?
    let fusionPoints: Int?
    let numUpgradesInSet: Int?
    let stats: [String]?
    let abilities: [Ability]?
    let sprintSpeed: Double?
    let availableChallenges: [AvailableChallenge]?
    let upgradeEntries: [UpgradeEntry]?
    let faction: Faction?
    let aura: Aura?
    let color: Int?
    let conclave: Bool?
    let passiveDescription: String?
    let sex: Sex?
    let sprint: Double?
    let locations: [Drop]?
    let marketInfo: MarketInfo?
    let rewards: [ItemReward]?
    let exalted: [String]?
    let primeOmegaAttenuation: Double?
    let binCapacity: Int?
    let binCount: Int?
    let capacityMultiplier: [Int]?
    let durability: Int?
    let fillRate: Double?
    let repairRate: Int?
    let specialities: [JSONAny]?
    let maxLevelCap: Int?
    let buffSet: Bool?
    let modSetValues: [Double]?

    enum CodingKeys: String, CodingKey {
        case category = "category"
        case description = "description"
        case imageName = "imageName"
        case masterable = "masterable"
        case name = "name"
        case tradable = "tradable"
        case type = "type"
        case uniqueName = "uniqueName"
        case excludeFromCodex = "excludeFromCodex"
        case health = "health"
        case shield = "shield"
        case armor = "armor"
        case regionBits = "regionBits"
        case drops = "drops"
        case resistances = "resistances"
        case factionIndex = "factionIndex"
        case masteryReq = "masteryReq"
        case maxEnemyLevel = "maxEnemyLevel"
        case minEnemyLevel = "minEnemyLevel"
        case missionIndex = "missionIndex"
        case nodeType = "nodeType"
        case systemIndex = "systemIndex"
        case systemName = "systemName"
        case baseDrain = "baseDrain"
        case compatName = "compatName"
        case fusionLimit = "fusionLimit"
        case introduced = "introduced"
        case isAugment = "isAugment"
        case isPrime = "isPrime"
        case levelStats = "levelStats"
        case patchlogs = "patchlogs"
        case polarity = "polarity"
        case rarity = "rarity"
        case releaseDate = "releaseDate"
        case transmutable = "transmutable"
        case wikiaThumbnail = "wikiaThumbnail"
        case wikiaUrl = "wikiaUrl"
        case accuracy = "accuracy"
        case attacks = "attacks"
        case buildPrice = "buildPrice"
        case buildQuantity = "buildQuantity"
        case buildTime = "buildTime"
        case components = "components"
        case consumeOnBuild = "consumeOnBuild"
        case criticalChance = "criticalChance"
        case criticalMultiplier = "criticalMultiplier"
        case damage = "damage"
        case damagePerShot = "damagePerShot"
        case disposition = "disposition"
        case fireRate = "fireRate"
        case magazineSize = "magazineSize"
        case marketCost = "marketCost"
        case multishot = "multishot"
        case noise = "noise"
        case omegaAttenuation = "omegaAttenuation"
        case polarities = "polarities"
        case procChance = "procChance"
        case productCategory = "productCategory"
        case reloadTime = "reloadTime"
        case skipBuildTimePrice = "skipBuildTimePrice"
        case slot = "slot"
        case tags = "tags"
        case totalDamage = "totalDamage"
        case trigger = "trigger"
        case vaulted = "vaulted"
        case hexColours = "hexColours"
        case blockingAngle = "blockingAngle"
        case bpCost = "bpCost"
        case comboDuration = "comboDuration"
        case followThrough = "followThrough"
        case heavyAttackDamage = "heavyAttackDamage"
        case heavySlamAttack = "heavySlamAttack"
        case heavySlamRadialDamage = "heavySlamRadialDamage"
        case heavySlamRadius = "heavySlamRadius"
        case range = "range"
        case slamAttack = "slamAttack"
        case slamRadialDamage = "slamRadialDamage"
        case slamRadius = "slamRadius"
        case slideAttack = "slideAttack"
        case stancePolarity = "stancePolarity"
        case windUp = "windUp"
        case power = "power"
        case stamina = "stamina"
        case isUtility = "isUtility"
        case itemCount = "itemCount"
        case parents = "parents"
        case showInInventory = "showInInventory"
        case modSet = "modSet"
        case probability = "probability"
        case rewardName = "rewardName"
        case tier = "tier"
        case estimatedVaultDate = "estimatedVaultDate"
        case isExilus = "isExilus"
        case sentinel = "sentinel"
        case vaultDate = "vaultDate"
        case fusionPoints = "fusionPoints"
        case numUpgradesInSet = "numUpgradesInSet"
        case stats = "stats"
        case abilities = "abilities"
        case sprintSpeed = "sprintSpeed"
        case availableChallenges = "availableChallenges"
        case upgradeEntries = "upgradeEntries"
        case faction = "faction"
        case aura = "aura"
        case color = "color"
        case conclave = "conclave"
        case passiveDescription = "passiveDescription"
        case sex = "sex"
        case sprint = "sprint"
        case locations = "locations"
        case marketInfo = "marketInfo"
        case rewards = "rewards"
        case exalted = "exalted"
        case primeOmegaAttenuation = "primeOmegaAttenuation"
        case binCapacity = "binCapacity"
        case binCount = "binCount"
        case capacityMultiplier = "capacityMultiplier"
        case durability = "durability"
        case fillRate = "fillRate"
        case repairRate = "repairRate"
        case specialities = "specialities"
        case maxLevelCap = "maxLevelCap"
        case buffSet = "buffSet"
        case modSetValues = "modSetValues"
    }
    
//    func hash(into hasher: inout Hasher) {
//            hasher.combine(uniqueName)
//            hasher.combine(name)
//        }
//
//        // Implementing equality operator (==)
//        static func == (lhs: ItemElement, rhs: ItemElement) -> Bool {
//            return lhs.uniqueName == rhs.uniqueName && lhs.name == rhs.name
//        }
}

// MARK: - Ability
struct Ability: Codable {
    let uniqueName: String
    let name: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case uniqueName = "uniqueName"
        case name = "name"
        case description = "description"
    }
}

// MARK: - ItemAttack
struct Attack: Codable {
    let name: String
    let speed: Double?
    let critChance: Double?
    let critMult: Double?
    let statusChance: Double?
    let shotType: ShotType?
    let shotSpeed: Int?
    let flight: Int?
    let damage: [String: Double]
    let falloff: Falloff?
    let slide: String?
    let slam: Slam?
    let chargeTime: Double?

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
        case slide = "slide"
        case slam = "slam"
        case chargeTime = "charge_time"
    }
}

// MARK: - Falloff
struct Falloff: Codable {
    let start: Int
    let end: Double
    let reduction: Double?

    enum CodingKeys: String, CodingKey {
        case start = "start"
        case end = "end"
        case reduction = "reduction"
    }
}

enum ShotType: String, Codable {
    case aoE = "AoE"
    case doT = "DoT"
    case hitScan = "Hit-Scan"
    case hitscan = "Hitscan"
    case projectile = "Projectile"
    case thrown = "Thrown"
}

// MARK: - Slam
struct Slam: Codable {
    let damage: String
    let radial: Radial

    enum CodingKeys: String, CodingKey {
        case damage = "damage"
        case radial = "radial"
    }
}

// MARK: - Radial
struct Radial: Codable {
    let damage: String
    let element: Element?
    let radius: Int

    enum CodingKeys: String, CodingKey {
        case damage = "damage"
        case element = "element"
        case radius = "radius"
    }
}

enum Element: String, Codable {
    case blast = "Blast"
    case cold = "Cold"
    case corrosive = "Corrosive"
    case electricity = "Electricity"
    case gas = "Gas"
    case heat = "Heat"
    case impact = "Impact"
    case magnetic = "Magnetic"
    case none = "None"
    case puncture = "Puncture"
    case radiation = "Radiation"
    case slash = "Slash"
    case toxin = "Toxin"
    case viral = "Viral"
}

enum Aura: String, Codable {
    case aura = "aura"
    case madurai = "madurai"
    case naramon = "naramon"
    case penjaga = "penjaga"
    case umbra = "umbra"
    case unairu = "unairu"
    case universal = "universal"
    case vazarin = "vazarin"
    case zenurik = "zenurik"
}

// MARK: - AvailableChallenge
struct AvailableChallenge: Codable {
    let fullName: String
    let description: String
    let complications: [Complication]

    enum CodingKeys: String, CodingKey {
        case fullName = "fullName"
        case description = "description"
        case complications = "complications"
    }
}

// MARK: - Complication
struct Complication: Codable {
    let fullName: FullName
    let description: Description
    let overrideTag: String?

    enum CodingKeys: String, CodingKey {
        case fullName = "fullName"
        case description = "description"
        case overrideTag = "overrideTag"
    }
}

enum Description: String, Codable {
    case duringAimGlide = "during Aim Glide"
    case inOneDay = "in one day"
    case whileAloneOrInSoloMode = ", while alone or in Solo Mode"
    case whileInvisible = "while invisible"
    case whileSliding = "while sliding"
    case whileUndetected = "while undetected"
    case withABleedingDragonKeyEquipped = "with a Bleeding Dragon Key equipped"
    case withADecayingDragonKeyEquipped = "with a Decaying Dragon Key equipped"
    case withAHobbledDragonKeyEquipped = "with a Hobbled Dragon Key equipped"
    case withAnActivePetPresent = "with an active pet present"
    case withAnActiveSentinelPresent = "with an active sentinel present"
    case withAnExtinguishedDragonKeyEquipped = "with an Extinguished Dragon Key equipped"
    case withoutAnAllyBecomingDowned = "without an ally becoming downed"
    case withoutBeingDisruptedByADtMagneticMagneticDamage = "without being disrupted by a <DT_MAGNETIC>Magnetic Damage"
    case withoutDyingOrBecomingDowned = "without dying or becoming downed"
    case withoutFailingAMission = "without failing a mission"
    case withoutGettingAfflictedByAStatusEffect = "without getting afflicted by a Status Effect"
    case withoutRaisingAnyAlarms = "without raising any alarms"
    case withoutTakingDamage = "without taking damage"
    case withoutUsingAirSupport = "without using air support"
    case withoutUsingAmmoConsumables = "without using ammo consumables"
    case withoutUsingCiphers = "without using ciphers"
    case withoutUsingEnergyConsumables = "without using energy consumables"
    case withoutUsingHealthConsumables = "without using health consumables"
    case withoutUsingShieldRestoringConsumables = "without using shield-restoring consumables"
}

enum FullName: String, Codable {
    case lotusTypesChallengesComplicationsAimGliding = "/Lotus/Types/Challenges/Complications/AimGliding"
    case lotusTypesChallengesComplicationsEquippedDamageDebuffKey = "/Lotus/Types/Challenges/Complications/EquippedDamageDebuffKey"
    case lotusTypesChallengesComplicationsEquippedHealthDebuffKey = "/Lotus/Types/Challenges/Complications/EquippedHealthDebuffKey"
    case lotusTypesChallengesComplicationsEquippedShieldDebuffKey = "/Lotus/Types/Challenges/Complications/EquippedShieldDebuffKey"
    case lotusTypesChallengesComplicationsEquippedSpeedDebuffKey = "/Lotus/Types/Challenges/Complications/EquippedSpeedDebuffKey"
    case lotusTypesChallengesComplicationsInvisible = "/Lotus/Types/Challenges/Complications/Invisible"
    case lotusTypesChallengesComplicationsPetPresent = "/Lotus/Types/Challenges/Complications/PetPresent"
    case lotusTypesChallengesComplicationsResetOnAlarmRaised = "/Lotus/Types/Challenges/Complications/ResetOnAlarmRaised"
    case lotusTypesChallengesComplicationsResetOnAllyDowned = "/Lotus/Types/Challenges/Complications/ResetOnAllyDowned"
    case lotusTypesChallengesComplicationsResetOnDamageTaken = "/Lotus/Types/Challenges/Complications/ResetOnDamageTaken"
    case lotusTypesChallengesComplicationsResetOnDisrupt = "/Lotus/Types/Challenges/Complications/ResetOnDisrupt"
    case lotusTypesChallengesComplicationsResetOnDowned = "/Lotus/Types/Challenges/Complications/ResetOnDowned"
    case lotusTypesChallengesComplicationsResetOnGearAirSupport = "/Lotus/Types/Challenges/Complications/ResetOnGearAirSupport"
    case lotusTypesChallengesComplicationsResetOnGearAmmoRestores = "/Lotus/Types/Challenges/Complications/ResetOnGearAmmoRestores"
    case lotusTypesChallengesComplicationsResetOnGearCipher = "/Lotus/Types/Challenges/Complications/ResetOnGearCipher"
    case lotusTypesChallengesComplicationsResetOnGearEnergyRestores = "/Lotus/Types/Challenges/Complications/ResetOnGearEnergyRestores"
    case lotusTypesChallengesComplicationsResetOnGearHealthRestores = "/Lotus/Types/Challenges/Complications/ResetOnGearHealthRestores"
    case lotusTypesChallengesComplicationsResetOnGearShieldRestores = "/Lotus/Types/Challenges/Complications/ResetOnGearShieldRestores"
    case lotusTypesChallengesComplicationsResetOnMissionFailure = "/Lotus/Types/Challenges/Complications/ResetOnMissionFailure"
    case lotusTypesChallengesComplicationsResetOnNewDay = "/Lotus/Types/Challenges/Complications/ResetOnNewDay"
    case lotusTypesChallengesComplicationsResetOnProc = "/Lotus/Types/Challenges/Complications/ResetOnProc"
    case lotusTypesChallengesComplicationsSentinelPresent = "/Lotus/Types/Challenges/Complications/SentinelPresent"
    case lotusTypesChallengesComplicationsSliding = "/Lotus/Types/Challenges/Complications/Sliding"
    case lotusTypesChallengesComplicationsSoloPlayer = "/Lotus/Types/Challenges/Complications/SoloPlayer"
    case lotusTypesChallengesComplicationsUndetected = "/Lotus/Types/Challenges/Complications/Undetected"
}

enum Category: String, CaseIterable {
    case all = "All"
    case arcanes = "Arcanes"
    case archGun = "Arch-Gun"
    case archMelee = "Arch-Melee"
    case archwing = "Archwing"
    case enemy = "Enemy"
    case fish = "Fish"
    case gear = "Gear"
    case glyphs = "Glyphs"
    case melee = "Melee"
    case misc = "Misc"
    case mods = "Mods"
    case node = "Node"
    case pets = "Pets"
    case primary = "Primary"
    case quests = "Quests"
    case relics = "Relics"
    case resources = "Resources"
    case secondary = "Secondary"
    case sentinels = "Sentinels"
    case sigils = "Sigils"
    case skins = "Skins"
    case warframes = "Warframes"
}

// MARK: - Component
struct Component: Codable {
    let uniqueName: String
    let name: String
    let description: String?
    let itemCount: Int
    let imageName: String
    let tradable: Bool
    let masterable: Bool
    let drops: [Drop]?
    let type: Faction?
    let primeSellingPrice: Int?
    let ducats: Int?
    let damagePerShot: [Double]?
    let totalDamage: Double?
    let criticalChance: Double?
    let criticalMultiplier: Double?
    let procChance: Double?
    let fireRate: Double?
    let masteryReq: Int?
    let productCategory: ProductCategory?
    let slot: Int?
    let accuracy: Double?
    let omegaAttenuation: Double?
    let noise: Noise?
    let trigger: Trigger?
    let magazineSize: Int?
    let reloadTime: Double?
    let multishot: Int?
    let damage: [String: Double]?
    let attacks: [ComponentAttack]?
    let marketCost: Int?
    let bpCost: Int?
    let polarities: [Aura]?
    let tags: [String]?
    let wikiaThumbnail: String?
    let wikiaUrl: String?
    let disposition: Int?
    let introduced: Introduced?
    let releaseDate: String?
    let vaulted: Bool?
    let blockingAngle: Int?
    let comboDuration: Int?
    let followThrough: Double?
    let range: Double?
    let slamAttack: Int?
    let slamRadialDamage: Int?
    let slamRadius: Int?
    let slideAttack: Int?
    let heavyAttackDamage: Int?
    let heavySlamAttack: Int?
    let heavySlamRadialDamage: Int?
    let heavySlamRadius: Int?
    let windUp: Double?
    let stancePolarity: Aura?
    let vaultDate: String?
    let estimatedVaultDate: String?
    let excludeFromCodex: Bool?

    enum CodingKeys: String, CodingKey {
        case uniqueName = "uniqueName"
        case name = "name"
        case description = "description"
        case itemCount = "itemCount"
        case imageName = "imageName"
        case tradable = "tradable"
        case masterable = "masterable"
        case drops = "drops"
        case type = "type"
        case primeSellingPrice = "primeSellingPrice"
        case ducats = "ducats"
        case damagePerShot = "damagePerShot"
        case totalDamage = "totalDamage"
        case criticalChance = "criticalChance"
        case criticalMultiplier = "criticalMultiplier"
        case procChance = "procChance"
        case fireRate = "fireRate"
        case masteryReq = "masteryReq"
        case productCategory = "productCategory"
        case slot = "slot"
        case accuracy = "accuracy"
        case omegaAttenuation = "omegaAttenuation"
        case noise = "noise"
        case trigger = "trigger"
        case magazineSize = "magazineSize"
        case reloadTime = "reloadTime"
        case multishot = "multishot"
        case damage = "damage"
        case attacks = "attacks"
        case marketCost = "marketCost"
        case bpCost = "bpCost"
        case polarities = "polarities"
        case tags = "tags"
        case wikiaThumbnail = "wikiaThumbnail"
        case wikiaUrl = "wikiaUrl"
        case disposition = "disposition"
        case introduced = "introduced"
        case releaseDate = "releaseDate"
        case vaulted = "vaulted"
        case blockingAngle = "blockingAngle"
        case comboDuration = "comboDuration"
        case followThrough = "followThrough"
        case range = "range"
        case slamAttack = "slamAttack"
        case slamRadialDamage = "slamRadialDamage"
        case slamRadius = "slamRadius"
        case slideAttack = "slideAttack"
        case heavyAttackDamage = "heavyAttackDamage"
        case heavySlamAttack = "heavySlamAttack"
        case heavySlamRadialDamage = "heavySlamRadialDamage"
        case heavySlamRadius = "heavySlamRadius"
        case windUp = "windUp"
        case stancePolarity = "stancePolarity"
        case vaultDate = "vaultDate"
        case estimatedVaultDate = "estimatedVaultDate"
        case excludeFromCodex = "excludeFromCodex"
    }
}

// MARK: - ComponentAttack
struct ComponentAttack: Codable {
    let name: Name
    let speed: Double
    let critChance: Double
    let critMult: Double
    let statusChance: Double
    let shotType: ShotType?
    let damage: Damage
    let falloff: Falloff?
    let shotSpeed: Int?
    let flight: Int?
    let slide: String?
    let slam: Slam?
    let chargeTime: Double?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case speed = "speed"
        case critChance = "crit_chance"
        case critMult = "crit_mult"
        case statusChance = "status_chance"
        case shotType = "shot_type"
        case damage = "damage"
        case falloff = "falloff"
        case shotSpeed = "shot_speed"
        case flight = "flight"
        case slide = "slide"
        case slam = "slam"
        case chargeTime = "charge_time"
    }
}

// MARK: - Damage
struct Damage: Codable {
    let impact: Double?
    let slash: Double?
    let puncture: Double?
    let heat: Int?
    let radiation: Int?
    let magnetic: Int?
    let cold: Int?
    let toxin: Int?
    let electricity: Int?
    let blast: Int?

    enum CodingKeys: String, CodingKey {
        case impact = "impact"
        case slash = "slash"
        case puncture = "puncture"
        case heat = "heat"
        case radiation = "radiation"
        case magnetic = "magnetic"
        case cold = "cold"
        case toxin = "toxin"
        case electricity = "electricity"
        case blast = "blast"
    }
}

enum Name: String, Codable {
    case chargedShot = "Charged Shot"
    case fullySpooled = "Fully Spooled"
    case incarnonForm = "Incarnon Form"
    case incarnonFormAoE = "Incarnon Form AoE"
    case incarnonFormRadialAttack = "Incarnon Form Radial Attack"
    case normalAttack = "Normal Attack"
    case singlePellet = "Single Pellet"
    case toxinCloud = "Toxin Cloud"
    case unchargedShot = "Uncharged Shot"
}

// MARK: - Drop
struct Drop: Codable {
    let chance: Double?
    let location: String
    let rarity: Rarity?
    let type: String?
    let rotation: Rotation?

    enum CodingKeys: String, CodingKey {
        case chance = "chance"
        case location = "location"
        case rarity = "rarity"
        case type = "type"
        case rotation = "rotation"
    }
}

enum Rarity: String, Codable {
    case common = "Common"
    case legendary = "Legendary"
    case rare = "Rare"
    case uncommon = "Uncommon"
}

enum Rotation: String, Codable {
    case c = "C"
    case rewards = "rewards"
}

// MARK: - Introduced
struct Introduced: Codable {
    let name: String
    let url: String
    let aliases: [String]
    let parent: String
    let date: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
        case aliases = "aliases"
        case parent = "parent"
        case date = "date"
    }
}

enum Noise: String, Codable {
    case alarming = "Alarming"
    case silent = "Silent"
}

enum ProductCategory: String, Codable {
    case kubrowPets = "KubrowPets"
    case longGuns = "LongGuns"
    case mechSuits = "MechSuits"
    case melee = "Melee"
    case operatorAmps = "OperatorAmps"
    case pistols = "Pistols"
    case sentinelWeapons = "SentinelWeapons"
    case sentinels = "Sentinels"
    case spaceGuns = "SpaceGuns"
    case spaceMelee = "SpaceMelee"
    case spaceSuits = "SpaceSuits"
    case specialItems = "SpecialItems"
    case suits = "Suits"
}

enum Trigger: String, Codable {
    case active = "Active"
    case auto = "Auto"
    case autoBurst = "Auto Burst"
    case burst = "Burst"
    case charge = "Charge"
    case duplex = "Duplex"
    case held = "Held"
    case semi = "Semi"
}

enum Faction: String, Codable {
    case alloy = "Alloy"
    case amp = "Amp"
    case arcadeMinigameUnlock = "Arcade Minigame Unlock"
    case arcane = "Arcane"
    case archGun = "Arch-Gun"
    case archGunMod = "Arch-Gun Mod"
    case archGunRivenMod = "Arch-Gun Riven Mod"
    case archMelee = "Arch-Melee"
    case archMeleeMod = "Arch-Melee Mod"
    case archwing = "Archwing"
    case archwingMod = "Archwing Mod"
    case ayatanSculpture = "Ayatan Sculpture"
    case ayatanStar = "Ayatan Star"
    case boosters = "Boosters"
    case captura = "Captura"
    case colorPalette = "Color Palette"
    case companionMod = "Companion Mod"
    case companionWeapon = "Companion Weapon"
    case companionWeaponRivenMod = "Companion Weapon Riven Mod"
    case conservationPrey = "Conservation Prey"
    case conservationTag = "Conservation Tag"
    case corpus = "Corpus"
    case currency = "Currency"
    case cutGem = "Cut Gem"
    case dualPistols = "Dual Pistols"
    case eidolonShard = "Eidolon Shard"
    case emotes = "Emotes"
    case equipmentAdapter = "Equipment Adapter"
    case exaltedWeapon = "Exalted Weapon"
    case extractor = "Extractor"
    case fish = "Fish"
    case fishBait = "Fish Bait"
    case fishPart = "Fish Part"
    case focusLens = "Focus Lens"
    case focusWay = "Focus Way"
    case furColor = "Fur Color"
    case furPattern = "Fur Pattern"
    case gear = "Gear"
    case gem = "Gem"
    case glyph = "Glyph"
    case grineer = "Grineer"
    case infestation = "Infestation"
    case kDriveComponent = "K-Drive Component"
    case kDriveMod = "K-Drive Mod"
    case key = "Key"
    case kitgunComponent = "Kitgun Component"
    case kitgunRivenMod = "Kitgun Riven Mod"
    case medallion = "Medallion"
    case melee = "Melee"
    case meleeMod = "Melee Mod"
    case meleeRivenMod = "Melee Riven Mod"
    case misc = "Misc"
    case modSetMod = "Mod Set Mod"
    case necramechMod = "Necramech Mod"
    case neutral = "Neutral"
    case node = "Node"
    case notePacks = "Note Packs"
    case orbiter = "Orbiter"
    case orokin = "Orokin"
    case parazonMod = "Parazon Mod"
    case peculiarMod = "Peculiar Mod"
    case petCollar = "Pet Collar"
    case petParts = "Pet Parts"
    case petResource = "Pet Resource"
    case pets = "Pets"
    case pistol = "Pistol"
    case pistolRivenMod = "Pistol Riven Mod"
    case plant = "Plant"
    case plexusMod = "Plexus Mod"
    case predator = "Predator"
    case prey = "Prey"
    case primaryMod = "Primary Mod"
    case railjackMod = "Railjack Mod"
    case relic = "Relic"
    case resource = "Resource"
    case rifle = "Rifle"
    case rifleRivenMod = "Rifle Riven Mod"
    case secondaryMod = "Secondary Mod"
    case sentient = "Sentient"
    case sentinel = "Sentinel"
    case shipDecoration = "Ship Decoration"
    case shipSegment = "Ship Segment"
    case shotgun = "Shotgun"
    case shotgunMod = "Shotgun Mod"
    case shotgunRivenMod = "Shotgun Riven Mod"
    case sigil = "Sigil"
    case simulacrum = "Simulacrum"
    case skin = "Skin"
    case skins = "Skins"
    case specter = "Specter"
    case stalker = "Stalker"
    case stanceMod = "Stance Mod"
    case syandana = "Syandana"
    case tenno = "Tenno"
    case themeBackground = "Theme Background"
    case themeSound = "Theme Sound"
    case themes = "Themes"
    case throwing = "Throwing"
    case transmutationMod = "Transmutation Mod"
    case warframe = "Warframe"
    case warframeMod = "Warframe Mod"
    case zawComponent = "Zaw Component"
    case zawRivenMod = "Zaw Riven Mod"
}

// MARK: - HexColour
struct HexColour: Codable {
    let value: String

    enum CodingKeys: String, CodingKey {
        case value = "value"
    }
}

// MARK: - LevelStat
struct LevelStat: Codable {
    let stats: [String]

    enum CodingKeys: String, CodingKey {
        case stats = "stats"
    }
}

// MARK: - MarketInfo
struct MarketInfo: Codable {
    let id: String
    let urlName: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case urlName = "urlName"
    }
}

// MARK: - Patchlog
struct Patchlog: Codable {
    let name: String
    let date: String
    let url: String
    let additions: String
    let changes: String
    let fixes: String
    let imgUrl: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case date = "date"
        case url = "url"
        case additions = "additions"
        case changes = "changes"
        case fixes = "fixes"
        case imgUrl = "imgUrl"
    }
}

// MARK: - Resistance
struct Resistance: Codable {
    let amount: Int
    let type: TypeEnum
    let affectors: [Affector]

    enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case type = "type"
        case affectors = "affectors"
    }
}

// MARK: - Affector
struct Affector: Codable {
    let element: Element
    let modifier: Double

    enum CodingKeys: String, CodingKey {
        case element = "element"
        case modifier = "modifier"
    }
}

enum TypeEnum: String, Codable {
    case alloyArmor = "Alloy Armor"
    case clonedFlesh = "Cloned Flesh"
    case ferriteArmor = "Ferrite Armor"
    case flesh = "Flesh"
    case fossilized = "Fossilized"
    case infested = "Infested"
    case infestedFlesh = "Infested Flesh"
    case infestedSinew = "Infested Sinew"
    case machinery = "Machinery"
    case none = "None"
    case protoShield = "Proto Shield"
    case robotic = "Robotic"
    case shield = "Shield"
}

// MARK: - Reward
struct ItemReward: Codable {
    let rarity: Rarity
    let chance: Double
    let item: RewardItem

    enum CodingKeys: String, CodingKey {
        case rarity = "rarity"
        case chance = "chance"
        case item = "item"
    }
}

// MARK: - RewardItem
struct RewardItem: Codable {
    let name: String
    let uniqueName: String
    let warframeMarket: MarketInfo?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case uniqueName = "uniqueName"
        case warframeMarket = "warframeMarket"
    }
}

enum Sex: String, Codable {
    case female = "Female"
    case male = "Male"
    case nonBinaryPluriform = "Non-binary (Pluriform)"
}

// MARK: - UpgradeEntry
struct UpgradeEntry: Codable {
    let tag: String
    let prefixTag: String
    let suffixTag: String
    let upgradeValues: [UpgradeValue]

    enum CodingKeys: String, CodingKey {
        case tag = "tag"
        case prefixTag = "prefixTag"
        case suffixTag = "suffixTag"
        case upgradeValues = "upgradeValues"
    }
}

// MARK: - UpgradeValue
struct UpgradeValue: Codable {
    let value: Double
    let locTag: String?
    let reverseValueSymbol: Bool?

    enum CodingKeys: String, CodingKey {
        case value = "value"
        case locTag = "locTag"
        case reverseValueSymbol = "reverseValueSymbol"
    }
}

typealias Item = [ItemElement]


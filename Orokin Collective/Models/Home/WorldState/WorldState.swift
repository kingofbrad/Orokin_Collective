// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let worldState = try? JSONDecoder().decode(WorldState.self, from: jsonData)

import Foundation

// MARK: - WorldState
struct WorldState: Codable, Identifiable {
    let id = UUID()
    let timestamp: String
    let news: [News]
    let events: [Events]
    let alerts: [JSONAny]
    let sortie: ArchonHunt
    let syndicateMissions: [SyndicateMission]
    let globalUpgrades: [GlobalUpgrade]
    let flashSales: [FlashSale]
    let invasions: [Invasion]
    let darkSectors: [JSONAny]
    let voidTraders: [Trader]
    let voidTrader: Trader
    let dailyDeals: [DailyDeal]
    let simaris: Simaris
    let persistentEnemies: [JSONAny]
    let earthCycle: CambionCycleClass
    let cetusCycle: CetusCycleClass
    let cambionCycle: CambionCycleClass
    let zarimanCycle: CetusCycleClass
    let weeklyChallenges: [JSONAny]
    let constructionProgress: ConstructionProgress
    let vallisCycle: CetusCycleClass
    let nightwave: Nightwave
    let kuva: [JSONAny]
    let sentientOutposts: SentientOutposts
    let steelPath: SteelPath
    let vaultTrader: Trader
    let archonHunt: ArchonHunt
    let duviriCycle: DuviriCycle
    let fissures: [Fissure]
//    let arbitration: Arbitration

    enum CodingKeys: String, CodingKey {
        case timestamp = "timestamp"
        case news = "news"
        case events = "events"
        case alerts = "alerts"
        case sortie = "sortie"
        case syndicateMissions = "syndicateMissions"
        case globalUpgrades = "globalUpgrades"
        case flashSales = "flashSales"
        case invasions = "invasions"
        case darkSectors = "darkSectors"
        case voidTraders = "voidTraders"
        case voidTrader = "voidTrader"
        case dailyDeals = "dailyDeals"
        case simaris = "simaris"
        case fissures = "fissures"
        case persistentEnemies = "persistentEnemies"
        case earthCycle = "earthCycle"
        case cetusCycle = "cetusCycle"
        case cambionCycle = "cambionCycle"
        case zarimanCycle = "zarimanCycle"
        case weeklyChallenges = "weeklyChallenges"
        case constructionProgress = "constructionProgress"
        case vallisCycle = "vallisCycle"
        case nightwave = "nightwave"
        case kuva = "kuva"
        case sentientOutposts = "sentientOutposts"
        case steelPath = "steelPath"
        case vaultTrader = "vaultTrader"
        case archonHunt = "archonHunt"
        case duviriCycle = "duviriCycle"
//        case arbitration = "arbitration"
    }
}

//MARK: - Arbitration
//struct Arbitration: Codable {
//    let activation: String
//    let expiry: String
//    let enemy: String
//    let type: String
//    let archwing: Bool
//    let sharkwing: Bool
//    let node: String
//    let nodeKey: String
//    let typeKey: String
//    let id: String
//    let expired: Bool
//    
//
//    enum CodingKeys: String, CodingKey {
//        case activation = "activation"
//        case expiry = "expiry"
//        case enemy = "enemy"
//        case type = "type"
//        case archwing = "archwing"
//        case sharkwing = "sharkwing"
//        case node = "node"
//        case nodeKey = "nodeKey"
//        case typeKey = "typeKey"
//        case id = "id"
//        case expired = "expired"
//        
//    }
//}
// MARK: - ArchonHunt
struct ArchonHunt: Codable {
    let id: String
    let activation: String
    let startString: String
    let expiry: String
    let active: Bool
    let rewardPool: String
    let variants: [Variant]
    let missions: [MissionElement]
    let boss: String
    let faction: String
    let factionKey: String
    let expired: Bool
    let eta: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case activation = "activation"
        case startString = "startString"
        case expiry = "expiry"
        case active = "active"
        case rewardPool = "rewardPool"
        case variants = "variants"
        case missions = "missions"
        case boss = "boss"
        case faction = "faction"
        case factionKey = "factionKey"
        case expired = "expired"
        case eta = "eta"
    }
}

// MARK: - MissionElement
struct MissionElement: Codable {
    let node: String
    let nodeKey: String
    let type: String
    let typeKey: String
    let nightmare: Bool
    let archwingRequired: Bool
    let isSharkwing: Bool
    let advancedSpawners: [JSONAny]
    let requiredItems: [JSONAny]
    let levelAuras: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case node = "node"
        case nodeKey = "nodeKey"
        case type = "type"
        case typeKey = "typeKey"
        case nightmare = "nightmare"
        case archwingRequired = "archwingRequired"
        case isSharkwing = "isSharkwing"
        case advancedSpawners = "advancedSpawners"
        case requiredItems = "requiredItems"
        case levelAuras = "levelAuras"
    }
}

// MARK: - Variant
struct Variant: Codable {
    let missionType: String
    let missionTypeKey: String
    let modifier: String
    let modifierDescription: String
    let node: String
    let nodeKey: String

    enum CodingKeys: String, CodingKey {
        case missionType = "missionType"
        case missionTypeKey = "missionTypeKey"
        case modifier = "modifier"
        case modifierDescription = "modifierDescription"
        case node = "node"
        case nodeKey = "nodeKey"
    }
}

// MARK: - CambionCycleClass
struct CambionCycleClass: Codable {
    let id: String
    let activation: String
    let expiry: String
    let timeLeft: String
    let state: String
    let active: String?
    let isDay: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case activation = "activation"
        case expiry = "expiry"
        case timeLeft = "timeLeft"
        case state = "state"
        case active = "active"
        case isDay = "isDay"
    }
}

// MARK: - CetusCycleClass
struct CetusCycleClass: Codable {
    let id: String
    let expiry: String
    let activation: String
    let isDay: Bool?
    let state: String
    let timeLeft: String
    let isCetus: Bool?
    let shortString: String
    let isWarm: Bool?
    let isCorpus: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case expiry = "expiry"
        case activation = "activation"
        case isDay = "isDay"
        case state = "state"
        case timeLeft = "timeLeft"
        case isCetus = "isCetus"
        case shortString = "shortString"
        case isWarm = "isWarm"
        case isCorpus = "isCorpus"
    }
}

// MARK: - ConclaveChallenge
struct ConclaveChallenge: Codable {
    let id: String
    let expiry: String
    let activation: String
    let amount: Int
    let mode: String
    let category: Category
    let eta: String
    let expired: Bool
    let daily: Bool
    let rootChallenge: Bool
    let endString: String
    let description: String
    let title: String
    let standing: Int
    let asString: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case expiry = "expiry"
        case activation = "activation"
        case amount = "amount"
        case mode = "mode"
        case category = "category"
        case eta = "eta"
        case expired = "expired"
        case daily = "daily"
        case rootChallenge = "rootChallenge"
        case endString = "endString"
        case description = "description"
        case title = "title"
        case standing = "standing"
        case asString = "asString"
    }
}



enum Category: String, Codable {
    case day = "day"
    case week = "week"
    case weekRoot = "week_root"
}





// MARK: - ConstructionProgress
struct ConstructionProgress: Codable {
    let id: String
    let fomorianProgress: String
    let razorbackProgress: String
    let unknownProgress: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case fomorianProgress = "fomorianProgress"
        case razorbackProgress = "razorbackProgress"
        case unknownProgress = "unknownProgress"
    }
}

// MARK: - DailyDeal
struct DailyDeal: Codable {
    let item: String
    let uniqueName: String
    let expiry: String
    let activation: String
    let originalPrice: Int
    let salePrice: Int
    let total: Int
    let sold: Int
    let id: String
    let eta: String
    let discount: Int

    enum CodingKeys: String, CodingKey {
        case item = "item"
        case uniqueName = "uniqueName"
        case expiry = "expiry"
        case activation = "activation"
        case originalPrice = "originalPrice"
        case salePrice = "salePrice"
        case total = "total"
        case sold = "sold"
        case id = "id"
        case eta = "eta"
        case discount = "discount"
    }
}

// MARK: - DuviriCycle
struct DuviriCycle: Codable {
    let id: String
    let activation: String
    let expiry: String
    let state: String
    let choices: [Choice]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case activation = "activation"
        case expiry = "expiry"
        case state = "state"
        case choices = "choices"
    }
}

// MARK: - Choice
struct Choice: Codable, Identifiable {
    let id: UUID = UUID()
    let category: String
    let categoryKey: String
    let choices: [String]

    enum CodingKeys: String, CodingKey {
        case category = "category"
        case categoryKey = "categoryKey"
        case choices = "choices"
    }
}

// MARK: - Event
//struct Events: Codable, Identifiable {
//    let id: String
//    let activation: String
//    let startString: String
//    let expiry: String
//    let active: Bool
//    let maximumScore: Int?
//    let currentScore: Int?
//    let smallInterval: JSONNull?
//    let largeInterval: JSONNull?
//    let description: String
//    let node: String
//    let concurrentNodes: [JSONAny]
//    let rewards: [Reward]
//    let expired: Bool
//    let interimSteps: [JSONAny]
//    let progressSteps: [JSONAny]
//    let isPersonal: Bool
//    let regionDrops: [JSONAny]
//    let archwingDrops: [JSONAny]
//    let asString: String
//    let metadata: Params
//    let completionBonuses: [JSONAny]
//    let altExpiry: String
//    let altActivation: String
//    let nextAlt: NextAlt
//    let victimNode: String
//
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case activation = "activation"
//        case startString = "startString"
//        case expiry = "expiry"
//        case active = "active"
//        case maximumScore = "maximumScore"
//        case currentScore = "currentScore"
//        case smallInterval = "smallInterval"
//        case largeInterval = "largeInterval"
//        case description = "description"
//        case node = "node"
//        case concurrentNodes = "concurrentNodes"
//        case rewards = "rewards"
//        case expired = "expired"
//        case interimSteps = "interimSteps"
//        case progressSteps = "progressSteps"
//        case isPersonal = "isPersonal"
//        case regionDrops = "regionDrops"
//        case archwingDrops = "archwingDrops"
//        case asString = "asString"
//        case metadata = "metadata"
//        case completionBonuses = "completionBonuses"
//        case altExpiry = "altExpiry"
//        case altActivation = "altActivation"
//        case nextAlt = "nextAlt"
//        case victimNode = "victimNode"
//    }
//}
struct Events: Codable {
    let id: String
    let activation: String
    let expiry: String
    let startString: String
    let active: Bool
    let maximumScore: Int?
    let currentScore: Int?
    let smallInterval: JSONNull?
    let largeInterval: JSONNull?
    let description: String
    let tooltip: String?
    let node: String?
    let concurrentNodes: [String]
    let victimNode: String?
    let scoreLocTag: String?
    let rewards: [Reward]
    let health: Double?
    let affiliatedWith: String?
    let jobs: [Job]?
    let interimSteps: [InterimStep]
    let progressSteps: [ProgressStep]
    let isPersonal: Bool?
    let isCommunity: Bool?
    let regionDrops: [String]
    let archwingDrops: [String]
    let asString: String
    let metadata: Params
    let completionBonuses: [Int]
    let scoreVar: String?
    let altExpiry: String
    let altActivation: String
    let nextAlt: NextAlt

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case activation = "activation"
        case expiry = "expiry"
        case startString = "startString"
        case active = "active"
        case maximumScore = "maximumScore"
        case currentScore = "currentScore"
        case smallInterval = "smallInterval"
        case largeInterval = "largeInterval"
        case description = "description"
        case tooltip = "tooltip"
        case node = "node"
        case concurrentNodes = "concurrentNodes"
        case victimNode = "victimNode"
        case scoreLocTag = "scoreLocTag"
        case rewards = "rewards"
        case health = "health"
        case affiliatedWith = "affiliatedWith"
        case jobs = "jobs"
        case interimSteps = "interimSteps"
        case progressSteps = "progressSteps"
        case isPersonal = "isPersonal"
        case isCommunity = "isCommunity"
        case regionDrops = "regionDrops"
        case archwingDrops = "archwingDrops"
        case asString = "asString"
        case metadata = "metadata"
        case completionBonuses = "completionBonuses"
        case scoreVar = "scoreVar"
        case altExpiry = "altExpiry"
        case altActivation = "altActivation"
        case nextAlt = "nextAlt"
    }
}

struct InterimStep: Codable {
    let goal: Int
    let reward: Reward
    let message: Params
   

    enum CodingKeys: String, CodingKey {
        case goal = "goal"
        case reward = "reward"
        case message = "message"
        
    }
}

struct ProgressStep: Codable {
    let type: String
    let progressAmt: Int

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case progressAmt = "progressAmt"
    }
}


typealias Event = [Events]

// MARK: - Params
struct Params: Codable {
}

// MARK: - NextAlt
struct NextAlt: Codable {
    let expiry: String
    let activation: String

    enum CodingKeys: String, CodingKey {
        case expiry = "expiry"
        case activation = "activation"
    }
}

// MARK: - Reward
struct Reward: Codable {
    let items: [String]
    let countedItems: [CountedItem]
    let credits: Int
    let asString: String
    let itemString: String
    let thumbnail: String
    let color: Int

    enum CodingKeys: String, CodingKey {
        case items = "items"
        case countedItems = "countedItems"
        case credits = "credits"
        case asString = "asString"
        case itemString = "itemString"
        case thumbnail = "thumbnail"
        case color = "color"
    }
}

// MARK: - CountedItem
struct CountedItem: Codable {
    let count: Int
    let type: String
    let key: String

    enum CodingKeys: String, CodingKey {
        case count = "count"
        case type = "type"
        case key = "key"
    }
}

// MARK: - Fissure


// MARK: - FlashSale
struct FlashSale: Codable {
    let item: String
    let expiry: String
    let activation: String
    let discount: Int
    let regularOverride: Int?
    let premiumOverride: Int
    let isShownInMarket: Bool
    let id: String
    let expired: Bool
    let eta: String

    enum CodingKeys: String, CodingKey {
        case item = "item"
        case expiry = "expiry"
        case activation = "activation"
        case discount = "discount"
        case regularOverride = "regularOverride"
        case premiumOverride = "premiumOverride"
        case isShownInMarket = "isShownInMarket"
        case id = "id"
        case expired = "expired"
        case eta = "eta"
    }
}

// MARK: - GlobalUpgrade
struct GlobalUpgrade: Codable {
    let start: String
    let end: String
    let upgrade: String
    let operation: String
    let operationSymbol: String
    let upgradeOperationValue: Int
    let expired: Bool
    let eta: String
    let desc: String

    enum CodingKeys: String, CodingKey {
        case start = "start"
        case end = "end"
        case upgrade = "upgrade"
        case operation = "operation"
        case operationSymbol = "operationSymbol"
        case upgradeOperationValue = "upgradeOperationValue"
        case expired = "expired"
        case eta = "eta"
        case desc = "desc"
    }
}

struct Fissure: Codable {
    let id: String
    let activation: String
    let startString: String
    let expiry: String
    let active: Bool
    let node: String
    let missionType: String
    let missionKey: String
    let enemy: String
    let enemyKey: String
    let nodeKey: String
    let tier: String
    let tierNum: Int
    let expired: Bool
    let eta: String
    let isStorm: Bool
    let isHard: Bool

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case activation = "activation"
        case startString = "startString"
        case expiry = "expiry"
        case active = "active"
        case node = "node"
        case missionType = "missionType"
        case missionKey = "missionKey"
        case enemy = "enemy"
        case enemyKey = "enemyKey"
        case nodeKey = "nodeKey"
        case tier = "tier"
        case tierNum = "tierNum"
        case expired = "expired"
        case eta = "eta"
        case isStorm = "isStorm"
        case isHard = "isHard"
    }
}

enum Enemy: String, Codable {
    case corpus = "Corpus"
    case crossfire = "Crossfire"
    case grineer = "Grineer"
    case infested = "Infested"
    case orokin = "Orokin"
    case theMurmur = "The Murmur"
}


// MARK: - Invasion
struct Invasion: Codable {
    let id: String
    let activation: String
    let startString: String
    let node: String
    let nodeKey: String
    let desc: String
    let attackingFaction: Enemy
    let attacker: Attacker
    let defender: Attacker
    let vsInfestation: Bool
    let count: Int
    let requiredRuns: Int
    let completion: Double
    let completed: Bool
    let eta: String
    let rewardTypes: [String]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case activation = "activation"
        case startString = "startString"
        case node = "node"
        case nodeKey = "nodeKey"
        case desc = "desc"
        case attackingFaction = "attackingFaction"
        case attacker = "attacker"
        case defender = "defender"
        case vsInfestation = "vsInfestation"
        case count = "count"
        case requiredRuns = "requiredRuns"
        case completion = "completion"
        case completed = "completed"
        case eta = "eta"
        case rewardTypes = "rewardTypes"
    }
}

// MARK: - Attacker
struct Attacker: Codable {
    let reward: Reward?
    let faction: Enemy
    let factionKey: Enemy

    enum CodingKeys: String, CodingKey {
        case reward = "reward"
        case faction = "faction"
        case factionKey = "factionKey"
    }
}

// MARK: - News
struct News: Codable {
    let id: String
    let message: String
    let link: String
    let imageLink: String
    let priority: Bool
    let date: String
    let eta: String
    let update: Bool
    let primeAccess: Bool
    let stream: Bool
    let translations: Translations
    let asString: String
    let startDate: String?
    let endDate: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case message = "message"
        case link = "link"
        case imageLink = "imageLink"
        case priority = "priority"
        case date = "date"
        case eta = "eta"
        case update = "update"
        case primeAccess = "primeAccess"
        case stream = "stream"
        case translations = "translations"
        case asString = "asString"
        case startDate = "startDate"
        case endDate = "endDate"
    }
}

// MARK: - Translations
struct Translations: Codable {
    let en: String
    let fr: String?
    let it: String?
    let de: String?
    let es: String?
    let pt: String?
    let ru: String?
    let pl: String?
    let uk: String?
    let tr: String?
    let ja: String?
    let zh: String?
    let ko: String?
    let tc: String?

    enum CodingKeys: String, CodingKey {
        case en = "en"
        case fr = "fr"
        case it = "it"
        case de = "de"
        case es = "es"
        case pt = "pt"
        case ru = "ru"
        case pl = "pl"
        case uk = "uk"
        case tr = "tr"
        case ja = "ja"
        case zh = "zh"
        case ko = "ko"
        case tc = "tc"
    }
}

// MARK: - Nightwave
struct Nightwave: Codable {
    let id: String
    let activation: String
    let startString: String
    let expiry: String
    let active: Bool
    let season: Int
    let tag: String
    let phase: Int
    let params: Params
    let possibleChallenges: [JSONAny]
    let activeChallenges: [ActiveChallenge]
    let rewardTypes: [String]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case activation = "activation"
        case startString = "startString"
        case expiry = "expiry"
        case active = "active"
        case season = "season"
        case tag = "tag"
        case phase = "phase"
        case params = "params"
        case possibleChallenges = "possibleChallenges"
        case activeChallenges = "activeChallenges"
        case rewardTypes = "rewardTypes"
    }
}

// MARK: - ActiveChallenge
struct ActiveChallenge: Codable {
    let id: String
    let activation: String
    let startString: String
    let expiry: String
    let active: Bool
    let isDaily: Bool
    let isElite: Bool
    let desc: String
    let title: String
    let reputation: Int
    let isPermanent: Bool

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case activation = "activation"
        case startString = "startString"
        case expiry = "expiry"
        case active = "active"
        case isDaily = "isDaily"
        case isElite = "isElite"
        case desc = "desc"
        case title = "title"
        case reputation = "reputation"
        case isPermanent = "isPermanent"
    }
}

// MARK: - SentientOutposts
struct SentientOutposts: Codable {
    let mission: SentientOutpostsMission
    let activation: String
    let expiry: String
    let active: Bool
    let id: String

    enum CodingKeys: String, CodingKey {
        case mission = "mission"
        case activation = "activation"
        case expiry = "expiry"
        case active = "active"
        case id = "id"
    }
}

// MARK: - SentientOutpostsMission
struct SentientOutpostsMission: Codable {
    let node: String
    let faction: String
    let type: String

    enum CodingKeys: String, CodingKey {
        case node = "node"
        case faction = "faction"
        case type = "type"
    }
}

// MARK: - Simaris
struct Simaris: Codable {
    let target: String
    let isTargetActive: Bool
    let asString: String

    enum CodingKeys: String, CodingKey {
        case target = "target"
        case isTargetActive = "isTargetActive"
        case asString = "asString"
    }
}

// MARK: - SteelPath
struct SteelPath: Codable {
    let currentReward: CurrentReward
    let activation: String
    let expiry: String
    let remaining: String
    let rotation: [CurrentReward]
    let evergreens: [CurrentReward]
    let incursions: Incursions

    enum CodingKeys: String, CodingKey {
        case currentReward = "currentReward"
        case activation = "activation"
        case expiry = "expiry"
        case remaining = "remaining"
        case rotation = "rotation"
        case evergreens = "evergreens"
        case incursions = "incursions"
    }
}

// MARK: - CurrentReward
struct CurrentReward: Codable {
    let name: String
    let cost: Int

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case cost = "cost"
    }
}

// MARK: - Incursions
struct Incursions: Codable {
    let id: String
    let activation: String
    let expiry: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case activation = "activation"
        case expiry = "expiry"
    }
}

// MARK: - SyndicateMission
struct SyndicateMission: Codable {
    let id: String
    let activation: String
    let startString: String
    let expiry: String
    let active: Bool
    let syndicate: String
    let syndicateKey: String
    let nodes: [String]
    let jobs: [Job]
    let eta: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case activation = "activation"
        case startString = "startString"
        case expiry = "expiry"
        case active = "active"
        case syndicate = "syndicate"
        case syndicateKey = "syndicateKey"
        case nodes = "nodes"
        case jobs = "jobs"
        case eta = "eta"
    }
}






// MARK: - Job
struct Job: Codable {
    let id: String
    let rewardPool: [String]
    let type: String
    let enemyLevels: [Int]
    let standingStages: [Int]
    let minMr: Int
    let expiry: String
    let timeBound: Category?
    let isVault: Bool?
    let locationTag: String?
    let timeBoound: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case rewardPool = "rewardPool"
        case type = "type"
        case enemyLevels = "enemyLevels"
        case standingStages = "standingStages"
        case minMr = "minMR"
        case expiry = "expiry"
        case timeBound = "timeBound"
        case isVault = "isVault"
        case locationTag = "locationTag"
        case timeBoound = "timeBoound"
    }
}





// MARK: - Trader
struct Trader: Codable {
    let id: String
    let activation: String
    let startString: String
    let expiry: String
    let active: Bool
    let character: String
    let location: String
    let inventory: [Inventory]
    let psId: String
    let endString: String
    let initialStart: String
    let schedule: [Schedule]

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

// MARK: - Inventory
struct Inventory: Codable {
    let uniqueName: String
    let item: String
    let ducats: Int?
    let credits: Int?

    enum CodingKeys: String, CodingKey {
        case uniqueName = "uniqueName"
        case item = "item"
        case ducats = "ducats"
        case credits = "credits"
    }
}

// MARK: - Schedule
struct Schedule: Codable {
    let expiry: String
    let item: String?

    enum CodingKeys: String, CodingKey {
        case expiry = "expiry"
        case item = "item"
    }
}


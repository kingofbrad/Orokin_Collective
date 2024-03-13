import Foundation

// MARK: - CetusCycle
struct CetusCycle: Codable {
    let id: String
    let expiry: String
    let activation: String
    let isDay: Bool
    let state: String
    let timeLeft: String
    let isCetus: Bool
    let shortString: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case expiry = "expiry"
        case activation = "activation"
        case isDay = "isDay"
        case state = "state"
        case timeLeft = "timeLeft"
        case isCetus = "isCetus"
        case shortString = "shortString"
    }
}

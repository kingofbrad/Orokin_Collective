
import Foundation
import Combine

@MainActor
class NetworkCall: ObservableObject {
    
    @Published var weapon: Weapon = []
    @Published var warframe: Warframe = []
    
    
    
    
    
    
    
    //MARK: - API Endpoint
    let endPoint = "https://api.warframestat.us"
    
    // MARK: - Weapons API Call
    func fetchWeaponsData() async throws {
        let request =  URL(string: "\(endPoint)/weapons")
        let (data, response) = try await URLSession.shared.data(from: request!)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invaildResponse
        }
        let weaponResponse = try JSONDecoder().decode(Weapon.self, from: data)
        weapon = weaponResponse
    }
    
    // MARK: - Warframe API Call
    func fetchWarframesData() async throws {
        let request = URL(string: "\(endPoint)/warframes")
        let (data, response) = try await URLSession.shared.data(from: request!)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invaildResponse
        }
        let warframeResponse = try JSONDecoder().decode(Warframe.self, from: data)
        warframe = warframeResponse
    }
    
    // MARK: - Alerts API CAll
    func fetchAlertsData() async throws {
        
    }
    
    //MARK: - Arbitration API CAll
    
//    func fetchArbitrationData() async throws {
//        let request = URL(string: "\(endPoint)/pc/arbitration")
//        let (data, response) = try await URLSession.shared.data(from: request!)
//        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            throw APIError.invaildResponse
//        }
//        let arbitrationResponse = try JSONDecoder().decode(Arbitration.self, from: data)
//        arbitration = arbitrationResponse
//    }
    
    // MARK: - Cetus DayLight Cycle & Bounties API CAll
    func fetchCetusData() async throws {
        
    }
    
    // MARK: - Fortuna Bounties API Call
    func fetchFortunaData() async throws {
        
    }
    
    // MARK: - Demois Boutines API Call
    func fetchDemoisData() async throws {
        
    }
}

enum APIError: Error {
    case invalidURL
    case invaildResponse
    case invalidData
}

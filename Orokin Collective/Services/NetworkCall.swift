
import Foundation
import Combine

@MainActor
class NetworkCall: ObservableObject {
    @Published var worldState: WorldState?
    @Published var events: Event = []
    @Published var arbitration: Arbitration?
    @Published var showError = false
    
    
    //MARK: - API Endpoint
    var endPoint = "https://api.warframestat.us"
    
    //    MARK: - WorldState API Call
    func fetchWorldState() async throws {
        let request = URL(string: "\(endPoint)/\(APIPlayformPathEndPoint.pc)")
        let (data, response) = try await URLSession.shared.data(from: request!)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invaildResponse
        }
        let worldStateResponse = try JSONDecoder().decode(WorldState.self, from: data)
        worldState = worldStateResponse
    }
    
    
    
    // MARK: - Weapons API Call
    //    func fetchWeaponsData() async throws {
    //        let request =  URL(string: "\(endPoint)/\(APIPathEndPoint.weapons)")
    //        let (data, response) = try await URLSession.shared.data(from: request!)
    //        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
    //            throw APIError.invaildResponse
    //        }
    //        let weaponResponse = try JSONDecoder().decode(Weapon.self, from: data)
    //        weapon = weaponResponse
    //    }
    
    // MARK: - Warframe API Call
    //    func fetchWarframesData() async throws {
    //        let request = URL(string: "\(endPoint)/\(APIPathEndPoint.warframes)")
    //        let (data, response) = try await URLSession.shared.data(from: request!)
    //        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
    //            throw APIError.invaildResponse
    //        }
    //        let warframeResponse = try JSONDecoder().decode(Warframe.self, from: data)
    //        warframe = warframeResponse
    //    }
    func fetchEventsData() async throws {
        let request = URL(string: "\(endPoint)/\(APIPlayformPathEndPoint.pc)/\(APIPathEndPoint.events)")
        let (data, response) = try await URLSession.shared.data(from: request!)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invaildResponse
        }
        let eventsResponse = try JSONDecoder().decode(Event.self, from: data)
        events = eventsResponse
    }
    //    func fetchArbitrationData() async throws {
    //        let request = URL(string: "\(endPoint)/\(APIPlayformPathEndPoint.pc)/\(APIPathEndPoint.arbitration)")
    //        let (data, response) = try await URLSession.shared.data(from: request!)
    //        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
    //            showError = true
    //            throw APIError.invaildResponse
    //
    //        }
    //        let arbitrationResponse = try JSONDecoder().decode(Arbitration.self, from: data)
    //        arbitration = arbitrationResponse
    //    }
    
    func fetchArbitrationData() async throws {
        do {
            let request = URL(string: "\(endPoint)/\(APIPlayformPathEndPoint.pc)/\(APIPathEndPoint.arbitration)")
            let (data, response) = try await URLSession.shared.data(from: request!)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                showError = true
                throw APIError.invaildResponse
            }
            
            if httpResponse.statusCode == 404 {
                showError = true
                return
            }
            
            let arbitrationResponse = try JSONDecoder().decode(Arbitration.self, from: data)
            arbitration = arbitrationResponse
        } catch {
            showError = true
        }
    }
    
    
    
    
    
    
    
}

enum APIError: Error {
    case invalidURL
    case invaildResponse
    case invalidData
}

enum APIPlayformPathEndPoint {
    case pc
    case xbox
    case playstation
    case nintendoSwitch
    
    var path: String {
        switch self {
        case .pc:
            return "pc"
        case .xbox:
            return "xb1"
        case .playstation:
            return "ps4"
        case .nintendoSwitch:
            return "swi"
        }
    }
}


enum APIPathEndPoint {
    case weapons
    case warframes
    case arbitration
    case cetusCycle
    case vallisCycle
    case cambionCycle
    case alerts
    case steelPath
    case events
    
    var path: String {
        switch self {
        case .arbitration:
            return "arbitration"
        case .weapons:
            return "weapons"
        case .warframes:
            return "warframes"
        case.cetusCycle:
            return "cetusCycle"
        case .vallisCycle:
            return "vallisCycle"
        case .cambionCycle:
            return "cambionCycle"
        case .alerts:
            return "alerts"
        case .steelPath:
            return "steelPath"
        case .events:
            return "events"
        }
    }
}

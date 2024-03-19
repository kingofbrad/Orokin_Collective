
import Foundation
import Combine

@MainActor
class NetworkCall: ObservableObject {
    @Published var weapon: Weapon = []
    @Published var warframe: Warframe = []
    @Published var arbitrationData: Arbitration?
    @Published var cetusCycleData: CetusCycle?
    @Published var orbVallisCycleData: VallisCycle?
    @Published var cambionCycleData: CambionCycle?
   
    
    
    
    
    
    
    //MARK: - API Endpoint
    @Published  var endPoint = "https://api.warframestat.us"
    
    // MARK: - Weapons API Call
    func fetchWeaponsData() async throws {
        let request =  URL(string: "\(endPoint)/\(APIPathEndPoint.weapons)")
        let (data, response) = try await URLSession.shared.data(from: request!)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invaildResponse
        }
        let weaponResponse = try JSONDecoder().decode(Weapon.self, from: data)
        weapon = weaponResponse
    }
    
    // MARK: - Warframe API Call
    func fetchWarframesData() async throws {
        let request = URL(string: "\(endPoint)/\(APIPathEndPoint.warframes)")
        let (data, response) = try await URLSession.shared.data(from: request!)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invaildResponse
        }
        let warframeResponse = try JSONDecoder().decode(Warframe.self, from: data)
        warframe = warframeResponse
    }
    
   // MARK: - Alerts API CAll
    
    
    //MARK: - Arbitration API CAll
    
    
    // MARK: - Cetus DayLight Cycle & API CAll
    func fetchCetusCycleData() async throws {
        let request = URL(string:"\(endPoint)/\(APIPlayformPathEndPoint.pc)/\(APIPathEndPoint.cetusCycle)")
        let (data, response) = try await URLSession.shared.data(from: request!)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invaildResponse
        }
        let cetusCycleResponse = try JSONDecoder().decode(CetusCycle.self, from: data)
        cetusCycleData = cetusCycleResponse
    }
    
    // MARK: - Orb Vallis Cycle API CAll
    func fetchOrbVallisCycleData() async throws {
        let request = URL(string:"\(endPoint)/\(APIPlayformPathEndPoint.pc)/\(APIPathEndPoint.vallisCycle)")
        let (data, response) = try await URLSession.shared.data(from: request!)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invaildResponse
        }
        let orbVallisCycleResponse = try JSONDecoder().decode(VallisCycle.self, from: data)
        orbVallisCycleData = orbVallisCycleResponse
    }
   
    
    // MARK: - Cambion Drift Cycle API Call
    func fetchCambionCycleData() async throws {
        let request = URL(string:"\(endPoint)/\(APIPlayformPathEndPoint.pc)/\(APIPathEndPoint.cambionCycle)")
        let (data, response) = try await URLSession.shared.data(from: request!)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invaildResponse
        }
        let cambionCycleResponse = try JSONDecoder().decode(CambionCycle.self, from: data)
        cambionCycleData = cambionCycleResponse
    }
    
    func fetchArbData() {
        guard let url = URL(string: "\(endPoint)/\(APIPlayformPathEndPoint.pc)/\(APIPathEndPoint.arbitration)") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(Arbitration.self, from: data)
                    DispatchQueue.main.async {
                        self.arbitrationData = decodedData
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
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
    case endPoint
    case weapons
    case warframes
    case arbitration
    case cetusCycle
    case vallisCycle
    case cambionCycle
    case alerts
    
    var path: String {
        switch self {
        case .endPoint:
            return "https://api.warframestat.us"
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
        }
    }
}

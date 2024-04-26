
import Foundation
import Combine

@MainActor
class NetworkCall: ObservableObject {
    
    @Published var worldState: WorldState?
    @Published var synthTargets: Synthtargets = []
    @Published var events: Event = []
    @Published var showError = false
    @Published var weapon: Weapon = []
    @Published var warframe: Warframe = []
    @Published var items: Item = []
    @Published var itemSearch: String = ""
    
    @Published var showToast: Bool = false

    
    
    //MARK: - API Endpoint
    var endPoint = "https://api.warframestat.us"
    
    //    MARK: - WorldState API Call
    func fetchWorldState() async throws {
        let request = URL(string: "\(endPoint)/\(APIPlayformPathEndPoint.pc)")
        let (data, response) = try await URLSession.shared.data(from: request!)
        guard let response = response as? HTTPURLResponse else {
            throw APIError.invaildServerResponse
        }
        switch response.statusCode {
        case 400 ..< 500: throw APIError.invaildClientResponse
        case 500 ..< 600: throw APIError.invaildServerResponse
        default: break
        }
        let worldStateResponse = try JSONDecoder().decode(WorldState.self, from: data)
        worldState = worldStateResponse
    }
    
    func fetchItem(searchTerm: String) async throws {
        guard !searchTerm.isEmpty else {
            return
        }
        
        
        do{
            guard let requestURL = URL(string: "\(endPoint)/\(APIPathEndPoint.items)/\(searchTerm)") else {
                throw APIError.invalidURL
            }
            
            let (data, response) = try await URLSession.shared.data(from: requestURL)
            guard let response = response as? HTTPURLResponse else {
                throw APIError.invaildServerResponse
            }
            
            switch response.statusCode{
            case 400..<500: throw APIError.invaildClientResponse
            case 500..<600: throw APIError.invaildServerResponse
            default: break
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let itemResponse = try decoder.decode(Item.self, from: data)
            items = itemResponse
        } catch let DecodingError.typeMismatch(type, context) {
            throw APIError.typeMismatch(expected: type, context: context)
        } catch {
            throw error
        }
    }
    
    //MARK: - synthTargets API Call
    func fetchSynthTargets() async throws {
        let request = URL(string: "\(endPoint)/\(APIPathEndPoint.synthTargets)")
        let (data, response) = try await URLSession.shared.data(from: request!)
        guard let reponse = response as? HTTPURLResponse else {
            throw APIError.invaildServerResponse
        }
        switch reponse.statusCode {
        case 400 ..< 500: throw APIError.invaildClientResponse
        case 500 ..< 600: throw APIError.invaildServerResponse
        default:break
        }
        let synthTargetsResponse = try JSONDecoder().decode(Synthtargets.self, from: data)
        synthTargets = synthTargetsResponse
        
    }
    // MARK: - Weapons API Call
    func fetchWeaponsData() async throws {
        let request =  URL(string: "\(endPoint)/\(APIPathEndPoint.weapons)")
        let (data, response) = try await URLSession.shared.data(from: request!)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invaildServerResponse
        }
        let weaponResponse = try JSONDecoder().decode(Weapon.self, from: data)
        weapon = weaponResponse
    }
    
    //     MARK: - Warframe API Call
    func fetchWarframesData() async throws {
        let request = URL(string: "\(endPoint)/\(APIPathEndPoint.warframes)")
        let (data, response) = try await URLSession.shared.data(from: request!)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invaildServerResponse
        }
        let warframeResponse = try JSONDecoder().decode(Warframe.self, from: data)
        warframe = warframeResponse
    }
    func fetchEventsData() async throws {
        let request = URL(string: "\(endPoint)/\(APIPlayformPathEndPoint.pc)/\(APIPathEndPoint.events)")
        let (data, response) = try await URLSession.shared.data(from: request!)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invaildServerResponse
        }
        let eventsResponse = try JSONDecoder().decode(Event.self, from: data)
        events = eventsResponse
    }
    
}

enum APIError: Error {
    case invalidURL
    case invaildClientResponse
    case invalidData
    case invaildServerResponse
    case typeMismatch(expected: Any.Type, context: DecodingError.Context)
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
    case events
    case synthTargets
    case items
    
    var path: String {
        switch self {
        case .events:
            return "events"
        case.synthTargets:
            return "synthTargets"
        case .weapons:
            return "weapons"
        case .warframes:
            return "warframes"
        case .items:
            return "items"
        }
    
    }
}

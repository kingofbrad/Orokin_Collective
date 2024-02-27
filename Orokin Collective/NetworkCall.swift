//
//  NetworkCall.swift
//  Orokin Collective
//
//  Created by Bradlee King on 23/02/2024.
//

import Foundation
import Combine
@MainActor
class NetworkCall: ObservableObject {
    
    @Published var weapons: [WeaponElement] = []
    
    let endPoint = "https://api.warframestat.us"
    
//    func loadWeaponsData(completion: @escaping ([Weapon]) -> ()) {
//        guard let url = URL(string: "\(endPoint)weapons") else {
//            print("invaild url...")
//            return
//        }
//        URLSession.shared.dataTask(with: url) {data, response, error in
//            let weapons = try JSONDecoder().decode([Weapon].self, from: data!)
//            DispatchQueue.main.async{
//                completion(weapons)
//            }
//        }.resume()
//    }
    
    func fetchWeaponsData() async throws {
        let request =  URL(string: "\(endPoint)/weapons")
        let (data, response) = try await URLSession.shared.data(from: request!)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invaildResponse
        }
        let weaponResponse = try JSONDecoder().decode([WeaponElement].self, from: data)
        weapons = weaponResponse
    }
    
//    func getWeaponData() async throws -> Weapon {
//        guard let url = URL(string: "\(endPoint)/weapons") else {
//            throw APIError.invalidURL
//        }
//        
//        let (data, response) = try await URLSession.shared.data(from: url)
//        
//        
//        do{
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            return try decoder.decode(Weapon.self, from: data)
//        } catch {
//            throw APIError.invalidData
//        }
//        
//    }
   
    
    
   
    
}

enum APIError: Error {
    case invalidURL
    case invaildResponse
    case invalidData
}

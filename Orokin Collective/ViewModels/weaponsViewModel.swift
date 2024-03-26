//
//  weaponsViewModel.swift
//  Orokin Collective
//
//  Created by Bradlee King on 23/02/2024.
//
//
import Foundation

class weaponsViewModel: ObservableObject {
    var endPoint = "https://api.warframestat.us"
  
    @Published var weapon: Weapon = []
    
    // MARK: - Fetch Weapons Function
    func fetchWeaponsData() async throws {
        let request =  URL(string: "\(endPoint)/\(APIPathEndPoint.weapons)")
        let (data, response) = try await URLSession.shared.data(from: request!)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invaildResponse
        }
        let weaponResponse = try JSONDecoder().decode(Weapon.self, from: data)
        weapon = weaponResponse
    }
    
}

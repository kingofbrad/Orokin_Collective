//
//  weaponsViewModel.swift
//  Orokin Collective
//
//  Created by Bradlee King on 23/02/2024.
//
//
//import Foundation
//
//class weaponsViewModel: ObservableObject {
//    @Published var searchTerm: String = "acceltra"
//    @Published var weapons: [Weapons] = [Weapons]()
//    
//    
//    // MARK: - Fetch Weapons Function
//    func fetchWeapons(for searchTerm:String) {
//        guard let url = URL(string: "https://api.warframestat.us/weapons/search/\(searchTerm)") else {
//            print("invaild url...")
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, uRLResponse, error in
//            if let error = error {
//                print("error: \(error.localizedDescription)")
//            } else if let data = data {
//                do {
//                    let result = try JSONDecoder().decode(WeaponsResult.self, from: data)
//                    self.weapons = result.weapons
//                } catch {
//                    print(error)
//                }
//            }
//        }
//        .resume()
//    }
//    
//}

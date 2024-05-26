//
//  UserDefaults.swift
//  Orokin Collective
//
//  Created by Bradlee King on 11/05/2024.
//

import Foundation

extension UserDefaults {
    // Key for storing favorite items
    static let favoriteItemsKey = "FavoriteItems"
    
    // Function to save favorite items
    func saveFavoriteItems(_ items: [ItemElement]) {
        let encodedData = try? JSONEncoder().encode(items)
        set(encodedData, forKey: UserDefaults.favoriteItemsKey)
    }
    
    // Function to load favorite items
    func loadFavoriteItems() -> [ItemElement] {
        guard let savedData = data(forKey: UserDefaults.favoriteItemsKey),
              let items = try? JSONDecoder().decode([ItemElement].self, from: savedData) else {
            return []
        }
        return items
    }
}

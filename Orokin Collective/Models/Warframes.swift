//
//  Warframes.swift
//  Orokin Collective
//
//  Created by Bradlee King on 24/02/2024.
//

import Foundation


struct Warframes: Codable, Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let health: Int
    let shield: Int
    let armor: Int
    let power: Int
    let sprintSpeed: Double
    
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
        case health = "health"
        case shield = "shield"
        case armor = "armor"
        case power = "power"
        case sprintSpeed = "sprintSpeed"
    }
}


typealias Warframe = [Warframes]

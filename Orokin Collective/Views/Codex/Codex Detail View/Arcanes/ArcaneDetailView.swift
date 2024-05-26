//
//  ArcaneDetailView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 10/05/2024.
//

import SwiftUI

struct ArcaneDetailView: View {
    var levelStats: [LevelStat]
    var drop: [Drop]
    
    var body: some View {
        VStack {
            stats
            drops
        }
    }
    
    var stats: some View {
        VStack(alignment: .leading) {
            Text("Level Stats")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.glacier)
            
            ForEach(levelStats.indices, id: \.self) { index in
                VStack(alignment: .leading) {
                    Text("Level \(index + 1)")
                        .foregroundStyle(Color.glacier)
                        .fontWeight(.semibold)
                        .font(.subheadline)
                    ForEach(levelStats[index].stats, id: \.self) { stat in
                        Text(stat)
                            .foregroundStyle(.silverChalice)
                            .font(.body)
                            .fontWeight(.semibold)
                    }
                }
            }
            
            
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blueCharcoal)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    var drops: some View {
        HStack{
            VStack(alignment: .leading) {
                Text("Drops")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.glacier)
                
                ForEach(drop, id: \.location) { drop in
                    dropItem(location: drop.location, rarity: drop.rarity, chance: drop.chance ?? 0.0)
                }
            }
            Spacer()
        }
        .frame(maxWidth: UIScreen.main.bounds.width)
        .padding()
        .background(Color.blueCharcoal)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
        
    }
    
    
    
    
}

#Preview {
    ArcaneDetailView(levelStats: [], drop: [])
}


struct dropItem: View {
    var location: String
    var rarity: Rarity?
    var chance: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Location: \(location)")
                .foregroundStyle(.white)
                .font(.body)
                .fontWeight(.semibold)
            Text("Rarity: \(rarity?.rawValue ?? "Unknown")")
                .foregroundStyle(determineBackgroundColor(for: rarity))
                .font(.body)
                .fontWeight(.semibold)
            Text("Chance: \(String(format: "%.2f", (chance) * 100))%")
                .foregroundStyle(.silverChalice)
                .font(.body)
                .fontWeight(.semibold)
        }
        .padding(.vertical, 5)
    }
    
    func determineBackgroundColor(for rarity: Rarity?) -> Color {
        switch rarity {
        case .common:
            return Color.green // Customize color for common rarity
        case .legendary:
            return Color.orange // Customize color for legendary rarity
        case .rare:
            return Color.yellow // Customize color for rare rarity
        case .uncommon:
            return Color.blue // Customize color for uncommon rarity
        default:
            return Color.silverChalice // Default color for unknown rarity
        }
    }
}

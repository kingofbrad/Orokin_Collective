//
//  FissuresView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 26/03/2024.
//

import SwiftUI

enum FissuresLocation: String, CaseIterable {
    case Earth
    case Venus
    case Mars
    case Pluto
    case Europa
    case Eris
    case Phobos
    case Saturn
    case Kuva_Fortress = "Kuva Fortress"
    case Uranus
    case Void
    case Jupiter
    case Ceres
    case Neptune
    case Zariman
    case Sedna
    case Deimos
    case Lua
    case Veil
    case Derelict
    case Mercury
    
}

enum Relic: String, CaseIterable {
    case Lith
    case Meso
    case Neo
    case Axi
    case Requiem
    case all
}

struct FissureView: View {
    var networkModel: NetworkCall
    var body: some View {
        VStack {
            FissuresList(networkModel: networkModel )
        }
        .foregroundStyle(Color.white)
    }
}

struct RelicImageView: View {
    let relic: Relic
    var body: some View {
        Image(relic.rawValue)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 70, height: 70)
    }
}


struct FissureCard: View {
    let node: String
    let tier: String
    let enemy: String
    let relicImage: String
    let isHard: Bool
    let isStorm: Bool
    let expiry: String
    var body: some View {
        ZStack {
            ForEach(FissuresLocation.allCases, id: \.rawValue) { fissureImage in
                if let planetName = node.components(separatedBy: "(").last?.dropLast() {
                    if fissureImage.rawValue.lowercased() == String(planetName).lowercased() {
                        Image(fissureImage.rawValue)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 100)
                            .overlay {
                                Color.black.opacity(0.4)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            
                    }
                }
            }
            
            HStack {
                VStack(alignment:.leading) {
                    Text(node)
                    Text(tier)
                    Text(enemy)
                    CountdownView(expiryDateString: expiry)
                }
                .padding(.horizontal, 10)
                .frame(maxWidth:.infinity, alignment: .leading)
                Spacer()
                
                RelicImageView(relic: Relic(rawValue: relicImage) ?? .Lith )
                    .padding(.trailing, 20)
            }
            
            if isHard {
                Image("LotusEmblem")
                    .colorMultiply(Color.white.opacity(0.4))
                
            } else if isStorm {
                Image("Archwing")
                    .colorMultiply(Color.white.opacity(0.4))
                
            }
            
            
            
        }
    }
}
struct RadioButton: View {
    var text: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                Text(text)
            }
        }
    }
}



struct FissuresList: View {
    
    var networkModel: NetworkCall
    
    @State private var selectedToggleOption: ToggleOption = .all
    
    enum ToggleOption: String, CaseIterable {
        case all = "All"
        case fissures = "Fissures"
        case voidStorms = "Void Storms"
        case steelPath = "Steel Path"
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(ToggleOption.allCases, id: \.self) { option in
                    
                    Button(action: {
                        selectedToggleOption = option
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(option == selectedToggleOption ? .blueCharcoal : .clear)
                            
                            Text(option.rawValue)
                                .font(.system(size: 12, weight: .semibold))
                                .padding(2)
                                .foregroundColor(option == selectedToggleOption ? .white : .white)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .frame(maxWidth: .infinity)
                        }
                        .frame(height: 40)
                        
                    }
                    
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            
            ScrollView{
                ForEach(filteredFissures, id: \.id) { fissure in
                    if !fissure.expired {
                        FissureCard(node: fissure.node, tier: fissure.tier, enemy: fissure.enemy, relicImage: fissure.tier, isHard: fissure.isHard, isStorm: fissure.isStorm, expiry: fissure.expiry)
                    }
                    
                }
            }
            
        }
        .frame(maxWidth:.infinity)
        .padding(.top, 50)
        .padding(.horizontal, 10)
        
    }
    
    @MainActor
    var filteredFissures: [Fissure] {
        guard let worldState = networkModel.worldState else {
            return []
        }
        
        var filteredFissures: [Fissure] = worldState.fissures
        
        switch selectedToggleOption {
        case .fissures:
            filteredFissures = filteredFissures.filter { !$0.isHard && !$0.isStorm }
        case .voidStorms:
            filteredFissures = filteredFissures.filter { $0.isStorm }
        case .steelPath:
            filteredFissures = filteredFissures.filter { $0.isHard }
        default:
            break
        }
        
        return filteredFissures.sorted(by: { $0.tierNum < $1.tierNum })
    }
}

#Preview {
    FissuresList(networkModel: NetworkCall())
}

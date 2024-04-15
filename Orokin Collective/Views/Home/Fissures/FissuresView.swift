//
//  FissuresView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 26/03/2024.
//

import SwiftUI

private enum FissuresLocation: String, CaseIterable {
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

struct FissureView: View {
    var networkModel: NetworkCall
    var body: some View {
        VStack {
            FissuresList(networkModel: networkModel )
        }
        .foregroundStyle(Color.white)
    }
}


struct FissureCard: View {
    let node: String
    let tier: String
    let enemy: String
    var body: some View {
        ZStack {
                ForEach(FissuresLocation.allCases, id: \.rawValue) { fissureImage in
                    if let planetName = node.components(separatedBy: "(").last?.dropLast() {
                        if fissureImage.rawValue.lowercased() == String(planetName).lowercased() {
                            Image(fissureImage.rawValue)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                
                VStack(alignment:.leading) {
                    Text(node)
                    Text(tier)
                    Text(enemy)
                }
                .padding(.horizontal, 10)
                .frame(maxWidth:.infinity, alignment: .leading)
            
            
            
        }
    }
}


struct FissuresList: View {
    
    var networkModel: NetworkCall
    var body: some View {
        VStack {
            ScrollView{
                ForEach(networkModel.worldState?.fissures.sorted(by: {$0.tierNum < $1.tierNum}) ?? [], id: \.id) { fissure in
                    FissureCard(node: fissure.node, tier: fissure.tier, enemy: fissure.enemy)
                    
                }
            }
            
        }
        .frame(maxWidth:.infinity)
//        .task {
//            do {
//                try await nm.fetchFissures()
//            } catch APIError.invalidURL {
//                print("invalid URL")
//            } catch APIError.invaildResponse {
//                print("invaild Response")
//            } catch APIError.invalidData {
//                print("invaild Data")
//            } catch {
//                print("Unexcepted Error has appeared \(error)")
//            }
//        }
        
        
    }
}

#Preview {
    FissuresList(networkModel: NetworkCall())
}

//
//  InvasionsView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 26/03/2024.
//

import SwiftUI


struct InvasionsView: View {
    var networkModel: NetworkCall
    
    var body: some View {
        VStack {
            InvasionsList(networkModel: networkModel)
        }
    }
}

struct InvasionsList: View {
    var networkModel: NetworkCall
    
    var body: some View {
        ScrollView {
            ConstructionProgressView(networkModel: networkModel)
            ForEach(networkModel.worldState?.invasions ?? [], id: \.id) { invasion in
                if !invasion.completed {
                    InvasionCard(node: invasion.node, desc: invasion.desc, attackerFaction: invasion.attacker.faction.rawValue, defenderFaction: invasion.defender.faction.rawValue, attackerReward: invasion.attacker.reward?.asString ?? "", defenderReward: invasion.defender.reward?.asString ?? "", completion: invasion.completion)
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.top, 50)
    }
}

#Preview {
    InvasionsView(networkModel: NetworkCall())
}



struct InvasionCard: View {
    let node: String
    let desc: String
    let attackerFaction: String
    let defenderFaction: String
    let attackerReward: String
    let defenderReward: String
    let completion: Double
    
    
    var body: some View {
        ZStack {
            ForEach(FissuresLocation.allCases, id: \.rawValue) { fissureImage in
                if let planetName = node.components(separatedBy: "(").last?.dropLast() {
                    if fissureImage.rawValue.lowercased() == String(planetName).lowercased() {
                        Image(fissureImage.rawValue)
                            .resizable()
                            .scaledToFill()
                            .overlay {
                                Color.black.opacity(0.4)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }
                }
            }
            VStack {
                HStack{
                    VStack(alignment: .leading) {
                        Text(node)
                            .fontWeight(.semibold)
                            .font(.system(size: 18))
                        Text(desc)
                            .fontWeight(.semibold)
                            .font(.system(size: 16))
                            .foregroundStyle(.silverChalice)
                    }
                    Spacer()
                    Text("\(attackerFaction) vs \(defenderFaction)")
                        .fontWeight(.semibold)
                    
                        .font(.system(size: 16))
                }
                .padding(.horizontal, 10)
                Spacer()
                
                HStack {
                    Text(attackerReward)
                        .fontWeight(.semibold)
                    Spacer()
                    Text(defenderReward)
                        .fontWeight(.semibold)
                }
                .padding(.horizontal, 10)
                CustomProgressBar(completion: completion)
                    .padding(.horizontal, 10)
                
            }
            .padding(.vertical, 10)
            
            
        }
        .padding(.horizontal, 10)
    }
}



struct ConstructionProgressView: View {
    
var networkModel: NetworkCall
    var body: some View {
        VStack {
            if let constructionData = networkModel.worldState?.constructionProgress {
                VStack(spacing: 10) {
                    Text("Construction Progress")
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                    HStack {
                        VStack {
                            HStack {
                                Text("Grineer")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 18))
                                Image("Grineer")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                            Text("\(constructionData.fomorianProgress)%")
                                .fontWeight(.semibold)
                                .font(.system(size: 18))
                                .foregroundStyle(.silverChalice)
                        }
                        Spacer()
                        VStack {
                            HStack {
                                Text("Corpus")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 18))
                                Image("Corpus")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                            Text("\(constructionData.razorbackProgress)%")
                                .fontWeight(.semibold)
                                .font(.system(size: 18))
                                .foregroundStyle(.silverChalice)
                        }
                    }
                    Text("View the build progress for the Formoion and the Razorback ")
                        .fontWeight(.semibold)
                        .font(.system(size: 10))
                        .foregroundStyle(.silverChalice)
                }
                .padding()
                .background(Color.blueCharcoal)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding(.horizontal, 10)
        .foregroundStyle(.white)
       
    }
}



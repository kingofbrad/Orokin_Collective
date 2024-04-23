//
//  SyndicateBountyView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 18/04/2024.
//

import SwiftUI


struct SyndicateBountyView: View {
    
    @Binding var isPresented: Bool
    
    var faction: String
    var factionColor: Color
    var imageSize: CGSize
    var textColor: Color
    let job: [Job]
    
    var body: some View {
        VStack(alignment: .leading){
            VStack {
                HStack {
                    ForEach(SyndicateSigil.allCases, id:\.rawValue) { image in
                        if image.rawValue == faction {
                            Image(faction)
                                .resizable()
                                .frame(width: imageSize.width, height: imageSize.height)
                        }
                    }
                    
                    
                    Text(faction)
                        .fontWeight(.semibold)
                        .font(.system(size: 25))
                        .foregroundStyle(textColor)
                    
                    Spacer()
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .padding(8)
                            .background(.ultraThinMaterial)
                            .clipShape(Circle())
                        
                    }
                }
                
            }
            .frame(height: 80)
            .padding()
            .background(factionColor.overlay(content: {
                Color.black.opacity(0.2)
            }))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 10)
            Text("Tap to view rewards")
                .fontWeight(.semibold)
                .font(.system(size: 16))
                .foregroundStyle(.silverChalice)
                .padding(.horizontal, 20)
            
            ScrollView {
                ForEach(job, id: \.id) { job in
                    BountieCard(type: job.type, faction: faction, factionColor: factionColor, textColor: textColor, enemyLevel: job.enemyLevels, standingStage: job.standingStages, rewardPool: job.rewardPool)

                }
            }
            .scrollIndicators(.hidden)
            
            
            Spacer()
        }
        .padding(.top, 20)
        .background(factionColor)
    }
}

#Preview {
    SyndicateBountyView(isPresented: .constant(false), faction: "Ostrons", factionColor: .desert, imageSize: CGSize(width: 60, height: 74.44), textColor: .raffia, job: [
        Job(id: "AssassinateBountyCap1713567440810",
            rewardPool: ["Redirection",
                         "100X Oxium",
                         "1,500 Credits Cache",
                         "50 Endo",
                         "15X Iradite",
                         "Gara Chassis Blueprint",
                         "Point Blank",
                         "Streamline",
                         "2X Morphics"],
            type: "Capture the New Grineer Commander",
            enemyLevels: [5, 15],
            standingStages: [400, 400, 400],
            minMr: 0,
            expiry: "2024-04-19T22:57:20.810Z",
            timeBound: nil,
            isVault: false,
            locationTag: "" ?? "",
            timeBoound: "" ?? "")
    ])
}

struct BountieCard: View {
    let type: String
    let faction: String
    let factionColor: Color
    let textColor: Color
    let enemyLevel: [Int]
    let standingStage: [Int]
    let rewardPool: [String]
   
    
    var body: some View {
        VStack {
            CustomAccordion(title: type, faction: faction, factionColor: factionColor, textColor: textColor, enemyLevel: enemyLevel, standingStages: standingStage) {
                AnyView (
                    VStack(alignment: .leading) {
                        HStack {
                            VStack(alignment:.leading, spacing: 10) {
                                ForEach(rewardPool, id: \.self) { item in
                                    if !item.isEmpty {
                                        Text(item)
                                            .foregroundStyle(textColor)
                                            .fontWeight(.semibold)
                                    }
                                }
                                
                            }
                           
                            
                            Spacer()
                        }
                    }
                        .padding()
                        
                )
                
            }
        }
    }
}

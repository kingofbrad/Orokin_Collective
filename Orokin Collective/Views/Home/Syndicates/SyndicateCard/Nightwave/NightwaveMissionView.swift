//
//  NightwaveMissionView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 19/04/2024.
//

import SwiftUI

struct NightwaveMissionView: View {
    @StateObject var networkModel = NetworkCall()
    
    @Binding var isPresented: Bool
    
    var faction: String
    var factionColor: Color
    var imageSize: CGSize
    var textColor: Color
    let activeChallenge: [ActiveChallenge]
    let expiry: String
    
    var body: some View {
        VStack(alignment: .leading) {
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
            Text("Scroll to view missions")
                .fontWeight(.semibold)
                .font(.system(size: 16))
                .foregroundStyle(.silverChalice)
                .padding(.horizontal, 15)
            
            ScrollView {
                ForEach(networkModel.worldState?.nightwave.activeChallenges ?? [], id:\.id) { challenge in
                    
                    if challenge.isDaily {
                        NightwaveMissionElement(title: challenge.title, desc: challenge.desc, reputation: challenge.reputation, image: "daily", imageSize: CGSize(width: 50, height: 30.46), factionColor: .crownOfThorns, textColor: .cornflowerLilac, expiry: challenge.expiry)
                    }
                    if !challenge.isDaily && !challenge.isElite {
                        NightwaveMissionElement(title: challenge.title, desc: challenge.desc, reputation: challenge.reputation, image: "weekly", imageSize: CGSize(width: 50, height: 44.5), factionColor: .crownOfThorns, textColor: .cornflowerLilac, expiry: challenge.expiry)
                    }
                    if challenge.isElite {
                        NightwaveMissionElement(title: challenge.title, desc: challenge.desc, reputation: challenge.reputation, image: "elite", imageSize: CGSize(width: 50, height: 48.5), factionColor: .crownOfThorns, textColor: .cornflowerLilac, expiry: challenge.expiry)
                    }
                    
                    
                    
                    
                }
                
            }
            Spacer()
        }
        .background(factionColor)
        .task {
            do {
                try await networkModel.fetchWorldState()
            } catch {
                print("Something went wrong \(error)")
            }
        }
    }
}

#Preview {
    NightwaveMissionView(isPresented: .constant(false ), faction: "Nightwave", factionColor:.crownOfThorns, imageSize: CGSize(width: 50, height: 50), textColor: .cornflowerLilac, activeChallenge: [], expiry: "")
}


struct NightwaveMissionElement: View {
    let title: String
    let desc: String
    let reputation: Int
    let image: String
    var imageSize: CGSize
    var factionColor: Color
    var textColor: Color
    let expiry: String
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                Image(image)
                    .resizable()
                    .frame(width: imageSize.width, height: imageSize.height)
                
                Text(title)
                    .fontWeight(.semibold)
                    .font(.system(size: 25))
                    .foregroundStyle(textColor)
                Spacer()
                Text(String(reputation))
                    .foregroundStyle(.silverChalice)
                    .fontWeight(.semibold)
                Image("nightwaveStanding")
            }
            HStack {
                Text(desc)
                    .fontWeight(.semibold)
                    .foregroundStyle(.silverChalice)
                Spacer()
               VoidTraderCountDownTimer(expiryDateString: expiry)
                    .fontWeight(.semibold)
                    .foregroundStyle(.silverChalice)
            }
            
        }
        .frame(height: 80)
        .padding()
        .background(factionColor.overlay(content: {
            Color.black.opacity(0.2)
        }))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal, 10)
    }
}

enum NightwaveSigils: String, CaseIterable {
    case daily
    case weekly
    case elite
}



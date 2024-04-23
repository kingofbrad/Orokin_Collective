//
//  EventsView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 01/04/2024.
//

import SwiftUI

struct EventsView: View {
    @ObservedObject var networkModel = NetworkCall()
    @State private var showEvents: Bool = false
    
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(networkModel.worldState?.events ?? [], id:\.id){ events in
                    NavigationLink {
                        EventsRewardsView(node: events.node ?? events.victimNode ?? "", expiry: events.expiry, description: events.description, maximumScore: events.maximumScore ?? 0, rewards: events.rewards, jobs: events.jobs ?? [], interimSteps: events.interimSteps)
                    } label: {
                        VStack {
                            VStack(alignment: .leading, spacing: 2){
                                HStack {
                                    Text(events.description)
                                        .font(.system(size: 14))
                                        .bold()
                                    Text("View Event")
                                        .font(.footnote)
                                        .foregroundStyle(Color.gray)
                                    
                                }
                            }
                            .padding()
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 20)
                    }
                    
                    
                    
                    
                    .frame(height: 50)
                    .padding(.horizontal, 20)
                    .background(Color.blueCharcoal)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
            }
        }
        
    }
}

#Preview {
    EventsView()
        .foregroundStyle(Color.white)
}

#Preview{
    EventsRewardsView(node: "Earth", expiry: "2024-05-04T17:11:10.509Z", description: "Gift of the lotus", maximumScore: 1, rewards: [], jobs: [], interimSteps: [])
}



struct EventsRewardsView: View {
    @ObservedObject private var nm = NetworkCall()
    
    
    
    
    let node: String
    let expiry: String
    let description: String
    let maximumScore: Int
    let rewards: [Reward]
    let jobs: [Job]
    let interimSteps: [InterimStep]
    
    let id: UUID = UUID()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Rectangle()
                .frame(height: 50)
                .foregroundStyle(
                    LinearGradient(colors: [.blueCharcoal, .black], startPoint: .bottom, endPoint: .top)
                ) // Title and Image
            
            VStack {
                ZStack {
                    Image("Ordis")
                        .resizable()
                        .scaledToFill()
                        .frame( height: 200, alignment: .center)
                        .clipped()
                    VStack{
                        Spacer()
                        HStack {
                            Text(description)
                                .font(.system(size: 15))
                                .bold()
                            Spacer()
                        }
                        .padding()
                    }
                    
                }
                .frame( height: 183)
            }
            .frame(maxWidth: .infinity)
            // Information
            VStack(alignment: .leading, spacing: 40){
                VStack(alignment: .leading, spacing: 20) {
                    Text("Event Information")
                    
                    HStack {
                        Text("Node:")
                            .foregroundStyle(Color.silverChalice)
                            .fontWeight(.semibold)
                        Spacer()
                        
                        Text(node)
                            .padding(4)
                            .background(Color.tundora)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                        
                        
                    }
                    HStack {
                        Text("Progress:")
                            .foregroundStyle(Color.silverChalice)
                            .fontWeight(.semibold)
                        Spacer()
                        
                        Text("\(maximumScore).00%")
                            .padding(4)
                            .background(Color.tundora)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                        
                        
                        
                    }
                    HStack {
                        Text("Time Left (ETA):")
                            .foregroundStyle(Color.silverChalice)
                            .fontWeight(.semibold)
                        Spacer()
                        VoidTraderCountDownTimer(expiryDateString: expiry)
                        
                    }
                    
                }
                VStack(alignment: .leading, spacing: 20) {
                    if jobs.isEmpty {
                        Text("Rewards")
                        ForEach(rewards, id:\.itemString) { reward in
                            if !reward.itemString.isEmpty {
                                Text(reward.itemString)
                                    .padding(4)
                                    .background(Color.tundora)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                            }
                        }
                        ScrollView {
                            ForEach(interimSteps, id: \.goal) { step in
                                
                                VStack {
                                       Text("Goal: \(step.goal)")
                                           .fontWeight(.semibold)
                                       
                                       Divider()
                                           .frame(height: 2)
                                           .background(Color.white)
                                           .foregroundColor(Color.white)
                                       
                                       Text("Reward:")
                                           .foregroundStyle(.silverChalice)
                                           .fontWeight(.bold)
                                       
                                       ForEach(step.reward.items, id: \.self) { item in
                                           Text(item)
                                               .padding(4)
                                               .background(Color.tundora)
                                               .clipShape(RoundedRectangle(cornerRadius: 5))
                                               
                                       }
                                   }
                                
                            }
                        }
                    } else {
                        Text("Bounties")
                        ForEach(jobs, id:\.id) { job in
                            VStack {
                                Text(job.type)
                                    .fontWeight(.semibold)
                                
                                    Divider()
                                        .frame(height: 2)
                                        .background(Color.white)
                                        .foregroundColor(Color.white)
                                    
                                    HStack{
                                        Text("Enemy Levels:")
                                            .foregroundStyle(.silverChalice)
                                            .fontWeight(.bold)
                                        
                                        ForEach(job.enemyLevels, id: \.self) { level in
                                            Text("\(level)")
                                                .padding(10)
                                                .foregroundColor(Color.white)
                                                .cornerRadius(5)
                                        }
                                    }
                                }
                            }
                        }
                        
                        
                        
                    }
                }
                .padding(20)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(Color.white)
            .background(Color.blueCharcoal)
            .ignoresSafeArea()
            
            
        }
    }

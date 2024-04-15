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
                        EventsRewardsView(node: events.node ?? events.victimNode ?? "", expiry: events.expiry, description: events.description, maximumScore: events.maximumScore ?? 0)
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
    EventsRewardsView(node: "Earth", expiry: "2024-05-04T17:11:10.509Z", description: "Gift of the lotus", maximumScore: 1)
}



struct EventsRewardsView: View {
    @ObservedObject private var nm = NetworkCall()
    
    
    let node: String
    let expiry: String
    let description: String
    let maximumScore: Int
    let rewards: [Reward] = [
        Reward(items: [], countedItems: [], credits: 0, asString: "", itemString: "", thumbnail: "", color: 0)
    ]
    
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
                            .foregroundStyle(Color.gray)
                            .fontWeight(.semibold)
                        Spacer()

                        Text(node)
                            .padding(4)
                            .background(Color.tundora)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                        

                    }
                    HStack {
                        Text("Progress:")
                            .foregroundStyle(Color.gray)
                            .fontWeight(.semibold)
                        Spacer()
                        
                            Text("\(maximumScore).00%")
                                .padding(4)
                                .background(Color.tundora)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                        
                        
                        
                    }
                    HStack {
                        Text("Time Left (ETA):")
                            .foregroundStyle(Color.gray)
                            .fontWeight(.semibold)
                        Spacer()
                        VoidTraderCountDownTimer(expiryDateString: expiry)
                        
                    }
                    
                }
                VStack(alignment: .leading, spacing: 20) {
                    Text("Rewards")
                    
                    ForEach(rewards, id:\.itemString) { reward in
                        if !reward.itemString.isEmpty {
                            Text(reward.itemString)
                                .padding(4)
                                .background(Color.tundora)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
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

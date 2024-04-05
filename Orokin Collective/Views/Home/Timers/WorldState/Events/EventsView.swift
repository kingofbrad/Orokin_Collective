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
                ForEach(networkModel.events, id:\.id){ events in
                    NavigationLink {
                        VStack(alignment: .leading) {
                            Rectangle()
                                .frame(height: 50)
                                .foregroundStyle(
                                    LinearGradient(colors: [.blueCharcoal, .black], startPoint: .bottom, endPoint: .top)
                                ) // Title and Image
                            ZStack {
                                Image("Ordis")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 393, height: 183, alignment: .center)
                                    .clipped()
                                VStack{
                                    Spacer()
                                    HStack {
                                        Text(events.description)
                                            .font(.system(size: 15))
                                            .bold()
                                        Spacer()
                                    }
                                    .padding()
                                }
                                
                            }
                            .frame(width: 393, height: 183)
                            // Information
                            VStack(alignment: .leading, spacing: 40){
                                VStack {
                                    Text("Description")
                                }
                                
                                
                                
                                VStack(alignment: .leading, spacing: 20) {
                                    Text("Event Information")
                                    
                                    HStack {
                                        Text("Node:")
                                            .foregroundStyle(Color.gray)
                                            .fontWeight(.semibold)
                                        Spacer()
                                        Text(events.node)
                                            .padding(4)
                                            .background(Color.tundora)
                                            .clipShape(RoundedRectangle(cornerRadius: 5))
                                        
                                    }
                                    HStack {
                                        Text("Progress:")
                                            .foregroundStyle(Color.gray)
                                            .fontWeight(.semibold)
                                        Spacer()
                                        Text("\(events.maximumScore).00%")
                                            .padding(4)
                                            .background(Color.tundora)
                                            .clipShape(RoundedRectangle(cornerRadius: 5))
                                        
                                    }
                                    HStack {
                                        Text("Time Left (ETA):")
                                            .foregroundStyle(Color.gray)
                                            .fontWeight(.semibold)
                                        Spacer()
                                        VoidTraderCountDownTimer(expiryDateString: events.expiry)
                                        
                                    }
                                    
                                }
                                VStack(alignment: .leading, spacing: 20) {
                                    Text("Rewards")
                                    
                                    
                                }
                            }
                            .padding(20)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.blueCharcoal)
                        .ignoresSafeArea()
                    } label: {
                        VStack {
                            VStack(alignment: .leading, spacing: 2){
                                HStack {
                                    Text(events.description)
                                        .font(.system(size: 14))
                                        .bold()
                                    Text("View Details")
                                        .font(.footnote)
                                        .foregroundStyle(Color.gray)
                                    
                                }
                            }
                            .padding()
                        }
                    }
                    
                    
                    
                    
                    .scrollDisabled(true)
                    .frame(width: 346, height: 50)
                    .background(Color.blueCharcoal)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
            }
            .task {
                do {
                    try await networkModel.fetchEventsData()
                } catch APIError.invalidURL {
                    print("invalid URL")
                } catch APIError.invaildResponse {
                    print("invaild Response")
                } catch APIError.invalidData {
                    print("invaild Data")
                } catch {
                    print("Unexcepted Error has appeared \(error)")
                }
            }
        }
        
    }
}

#Preview {
    EventsView()
        .foregroundStyle(Color.white)
}

#Preview(body: {
    NavigationStack {
        EventsRewardsView()
            .foregroundStyle(Color.white)
    }
})

struct EventsRewardsView: View {
    @ObservedObject private var nm = NetworkCall()
    
    
    let title: String = "Gift of the Lotus - Stolen!"
    let node: String = "Proxy Rebellion"
    let progress: Int = 1
    let TimeLeft: String = "2024-04-12T15:00:00.000Z"
    
    let id: UUID = UUID()
    
    var body: some View {
        
        
        
        VStack(alignment: .leading) {
            Rectangle()
                .frame(height: 50)
                .foregroundStyle(
                    LinearGradient(colors: [.blueCharcoal, .black], startPoint: .bottom, endPoint: .top)
                ) // Title and Image
            ZStack {
                Image("Ordis")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 393, height: 183, alignment: .center)
                    .clipped()
                VStack{
                    Spacer()
                    HStack {
                        Text(title)
                            .font(.system(size: 15))
                            .bold()
                        Spacer()
                    }
                    .padding()
                }
                
            }
            .frame(width: 393, height: 183)
            // Information
            VStack(alignment: .leading, spacing: 40){
                VStack {
                    Text("Description")
                }
                
                
                
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
                        Text("\(progress).00%")
                            .padding(4)
                            .background(Color.tundora)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                        
                    }
                    HStack {
                        Text("Time Left (ETA):")
                            .foregroundStyle(Color.gray)
                            .fontWeight(.semibold)
                        Spacer()
                        VoidTraderCountDownTimer(expiryDateString: TimeLeft)
                        
                    }
                    
                }
                VStack(alignment: .leading, spacing: 20) {
                    Text("Rewards")
                    
                    
                }
            }
            .padding(20)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blueCharcoal)
        .ignoresSafeArea()
        
    }
}

//
//  ArchonHuntView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 02/04/2024.
//

import SwiftUI

struct ArchonHuntView: View {
    @ObservedObject var networkModel = NetworkCall()
    
    var body: some View {
        VStack {
            if let archonData = networkModel.worldState?.archonHunt {
                VStack(alignment: .leading) {
                    HStack{
                        
                        Image("Narmer")
                            .resizable()
                            .frame(width: 50, height: 39.72)
                            .padding(.trailing, 2)
                        
                        Text("\(archonData.boss)")
                            .bold()
                        Spacer()
                        VoidTraderCountDownTimer(expiryDateString: archonData.expiry)
                            .padding(.trailing, 10)
                    }
                    
                    ForEach(archonData.missions, id:\.nodeKey) { missions in
                        HStack {
                            Text("\(missions.type)")
                            Text("-")
                            Text("\(missions.node)")
                                .foregroundStyle(Color.silverChalice)
                        }
                        
                    }
                    .padding(.horizontal)
                }
                .frame(width: 346, height: 159)
                .background(Color.blueCharcoal)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                Text("Loading...")
            }
        }
        .task {
            do {
                try await networkModel.fetchWorldState()
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

#Preview {
    ArchonHuntView()
        .foregroundStyle(Color.white)
}

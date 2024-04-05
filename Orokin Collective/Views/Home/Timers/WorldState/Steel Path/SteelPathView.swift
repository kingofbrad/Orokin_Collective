//
//  SteelPathView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 31/03/2024.
//

import SwiftUI

struct SteelPathView: View {
    @ObservedObject private var networkModel = NetworkCall()
    
    var body: some View {
        VStack {
            if let steelPathData = networkModel.worldState?.steelPath {
                VStack {
                    HStack{
                    
                        VStack(alignment: .leading, spacing: 2){
                            Text("Steel Path")
                                .font(.system(size: 18))
                                .bold()
                            Text("\(steelPathData.currentReward.name)")
                                .font(.system(size: 14))
                                .foregroundStyle(.silverChalice)
                        }
                        Spacer()
                        VoidTraderCountDownTimer(expiryDateString: steelPathData.expiry)
                    }
                    .padding(.horizontal)
                    
                }
                .frame(width: 346, height: 73)
                .background(Color.blueCharcoal)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                VStack {
                    HStack{
                    
                        VStack(alignment: .leading, spacing: 2){
                            Text("Steel Path")
                                .font(.system(size: 18))
                                .bold()
                            Text("Loading...")
                                .font(.system(size: 14))
                                .foregroundStyle(.silverChalice)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                }
                .frame(width: 346, height: 73)
                .background(Color.blueCharcoal)
                .clipShape(RoundedRectangle(cornerRadius: 10))
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
    SteelPathView()
}

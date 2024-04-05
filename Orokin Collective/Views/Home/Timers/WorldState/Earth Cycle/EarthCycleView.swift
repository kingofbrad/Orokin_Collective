//
//  EarthCycleView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 02/04/2024.
//

import SwiftUI

struct EarthCycleView: View {
    @ObservedObject var networkModel = NetworkCall()
    
    var body: some View {
        VStack {
            if let earthData = networkModel.worldState?.earthCycle {
                VStack {
                    HStack{
                        withAnimation(.easeInOut(duration: 0.1)) {
                            Image(systemName: earthData.isDay ?? true ? "sun.max.fill" : "moon.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding(.trailing, 2)
                        }
                        
                        
                        VStack(alignment: .leading, spacing: 2){
                            Text("Earth")
                                .font(.system(size: 18))
                                .bold()
                            Text("\(earthData.timeLeft)")
                                .font(.system(size: 14))
                                .foregroundStyle(.silverChalice)
                            Text("\(earthData.state.capitalized)")
                                .font(.system(size: 14))
                                .foregroundStyle(.silverChalice)
                        }
                        Spacer()
                        CountdownView(expiryDateString: earthData.expiry)
                    }
                    .padding(.horizontal)
                    
                }
                .frame(width: 346, height: 73)
                .background(Color.blueCharcoal)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                
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
    EarthCycleView()
}

//
//  Baro Ki'Teer View.swift
//  Orokin Collective
//
//  Created by Bradlee King on 28/03/2024.
//

import SwiftUI

struct Baro_Ki_Teer_View: View {
    var location: String = "Strata Relay (Earth)"
    var arrival: String = "Arrives on Friday, April 5, 2024"
    var arrivalTime: String = "2024-04-05T13:00:00.000Z"
    
    @ObservedObject private var nm = NetworkCall()
    var body: some View {
        VStack {
            if let voidTrader = nm.worldState?.voidTrader {
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(voidTrader.character)
                        Text(voidTrader.location)
                            .font(.system(size: 12))
                            .foregroundStyle(.white)
                        Text(arrival)
                            .font(Font.custom("SF Pro Text", size: 11).weight(.semibold))
                            .foregroundColor(.silverChalice)
                        
                        
                    }
                    .padding(.leading, 15)
                    .padding(.bottom,5)
                    
                    Spacer()
                    VStack {
                        Spacer()
                        TimeRemainingTimer_Days_View(activation: voidTrader.activation, expiry: voidTrader.expiry)
                    }
                    
                    
                }
            }
           
            
            
            
        }
        .frame(height: 137)
        
        .background(
            Image("Baro Ki'Teer")
                .resizable()
                .scaledToFill()
                .shadow(radius: 5)
                
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .foregroundStyle(.white)
        .padding(.horizontal, 10)
        .task {
            do {
                try await nm.fetchWorldState()
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
    Baro_Ki_Teer_View()
}

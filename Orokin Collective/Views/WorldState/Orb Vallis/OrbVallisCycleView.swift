//
//  OrbVallisCycleView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 13/03/2024.
//

import SwiftUI

struct OrbVallisCycleView: View {
    @ObservedObject private var networkModel = NetworkCall()
    
    
    var body: some View {
        VStack {
            if let orbVallisCycleData = networkModel.orbVallisCycleData {
                HStack {
                    Text("Orb Vallis")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Spacer()
                    if orbVallisCycleData.isWarm && orbVallisCycleData.state == "warm" {
                        Image(systemName: "sun.max.fill")
                        Text(orbVallisCycleData.state)
                            .textCase(.uppercase)
                            .bold()
                    } else {
                        Image(systemName: "snowflake")
                        Text(orbVallisCycleData.state)
                            .textCase(.uppercase)
                            .bold()
                    }
                    
                }
                .padding(.horizontal, 20)
                Divider()
                
                Text(orbVallisCycleData.shortString)
                    .padding()
                    .font(.title2)
                    .bold()
                
                Spacer()
            } else {
                Text("Loading...")
            }
        }
        .frame(width: 230,height: 100)
        .padding()
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 5, style: .continuous))
        .cornerRadius(10)
        .padding(.horizontal)
        .foregroundStyle(.white)
        .task {
            do {
                try await networkModel.fetchOrbVallisCycleData()
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
    OrbVallisCycleView()
}

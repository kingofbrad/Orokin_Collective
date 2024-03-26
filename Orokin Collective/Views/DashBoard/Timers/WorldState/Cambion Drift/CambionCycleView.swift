//
//  CambionCycleView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 13/03/2024.
//

import SwiftUI

struct CambionCyclePreview: View {
    var body: some View {
        VStack {
            CambionCycleView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

#Preview(body: {
    CambionCyclePreview()
})

struct CambionCycleView: View {
    @ObservedObject private var networkModel = NetworkCall()
    
    
    var body: some View {
        VStack {
            if let cambionCycleData = networkModel.cambionCycleData {
                HStack {
                    Text("Cambion Drift")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Spacer()
                    if cambionCycleData.state == "fass" {
                        Image(systemName: "flame.fill")
                        Text(cambionCycleData.state)
                            .textCase(.uppercase)
                            .bold()
                    } else {
                        Image(systemName: "snowflake")
                        Text(cambionCycleData.state)
                            .textCase(.uppercase)
                            .bold()
                    }
                    
                }
                .padding(.horizontal, 20)
                Divider()
                
                if cambionCycleData.state == "fass" {
                    Text("\(cambionCycleData.timeLeft) till Vome")
                        .padding()
                        .font(.title2)
                        .bold()
                } else {
                    Text("\(cambionCycleData.timeLeft) till Fass")
                        .padding()
                        .font(.title2)
                        .bold()
                }
            
                
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
                try await networkModel.fetchCambionCycleData()
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



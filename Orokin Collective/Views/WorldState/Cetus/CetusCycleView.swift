//
//  CetusCycleDashBoardView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 13/03/2024.
//

import SwiftUI


struct PreviewofItem: View {
    var body: some View {
        VStack {
            CetusCycleView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .ignoresSafeArea()
        
    }
}

struct CetusCycleView: View {
    @ObservedObject private var networkModel = NetworkCall()
    
    var body: some View {
        VStack {
            if let cetusCycleData = networkModel.cetusCycleData {
                HStack {
                    Text("Cetus")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Spacer()
                    if cetusCycleData.isDay && cetusCycleData.state == "day" {
                        Image(systemName: "sun.max.fill")
                        Text(cetusCycleData.state)
                            .textCase(.uppercase)
                            .bold()
                    } else {
                        Image(systemName: "moon.fill")
                        Text(cetusCycleData.state)
                            .textCase(.uppercase)
                            .bold()
                    }
                    
                }
                .padding(.horizontal, 20)
                Divider()
                
                Text(cetusCycleData.shortString)
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
                try await networkModel.fetchCetusCycleData()
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



#Preview(body: {
    PreviewofItem()
})

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
            if let cambionCycleData = networkModel.worldState?.cambionCycle {
                VStack {
                    HStack{
                        withAnimation(.easeInOut(duration: 0.1)) {
                            Image(cambionCycleData.active == "fass" ? "Fass" : "Vome")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding(.trailing, 2)
                        }
                        
                            
                        VStack(alignment: .leading, spacing: 2){
                            Text("Cambion Drift")
                                .font(.system(size: 18))
                                .bold()
                            Text("\(cambionCycleData.timeLeft)")
                                .font(.system(size: 14))
                                .foregroundStyle(.silverChalice)
                            Text("\(cambionCycleData.state.capitalized)")
                                .font(.system(size: 14))
                                .foregroundStyle(.silverChalice)
                        }
                        Spacer()
                        CountdownView(expiryDateString: cambionCycleData.expiry)
                    }
                    .padding(.horizontal)
                    
                }
                .frame(width: 346, height: 73)
                .background(Color.blueCharcoal)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                VStack {
                    HStack{
                        withAnimation(.easeInOut(duration: 0.1)) {
                            ProgressView()
                                .frame(width: 50, height: 50)
                        }
                        
                        
                        VStack(alignment: .leading, spacing: 2){
                            Text("Loading...")
                                .font(.system(size: 18))
                                .bold()
                            Text("??m to ??")
                                .font(.system(size: 14))
                                .foregroundStyle(.silverChalice)
                            Text("??")
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



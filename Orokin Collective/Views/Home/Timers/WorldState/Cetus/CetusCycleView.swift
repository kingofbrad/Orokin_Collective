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
                VStack {
                    HStack{
                        
                        Image(systemName: cetusCycleData.isDay ? "sun.max.fill" : "moon.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(.trailing, 2)
                        VStack(alignment: .leading, spacing: 2){
                            Text("Cetus")
                                .font(.system(size: 18))
                                .bold()
                            Text("\(cetusCycleData.shortString)")
                                .font(.system(size: 14))
                                .foregroundStyle(.silverChalice)
                            Text("\(cetusCycleData.state.capitalized)")
                                .font(.system(size: 14))
                                .foregroundStyle(.silverChalice)
                        }
                        Spacer()
                        CountdownView(expiryDateString: cetusCycleData.expiry)
                    }
                    .padding(.horizontal)
                    
                }
                .frame(width: 346, height: 73)
                .background(Color.blueCharcoal)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                Text("Loading...")
            }
        }
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

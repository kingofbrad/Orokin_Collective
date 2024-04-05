//
//  DuviriView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 02/04/2024.
//

import SwiftUI

struct DuviriView: View {
    @ObservedObject var networkModel = NetworkCall()
    @State private var openChoices: Bool = false
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    
    var body: some View {
        VStack {
            if let duviriData = networkModel.worldState?.duviriCycle {
                VStack {
                    HStack{
                        VStack(alignment: .leading, spacing: 2){
                            Text("Duviri")
                                .font(.system(size: 18))
                                .bold()
                            Text("\(duviriData.state.capitalized) Spiral")
                                .font(.system(size: 14))
                                .foregroundStyle(.silverChalice)
                            Text("Tap to View Circuit Choices")
                                .font(.system(size: 14))
                                .foregroundStyle(.silverChalice)
                        }
                        Spacer()
                        CountdownView(expiryDateString: duviriData.expiry)
                    }
                    .padding(.horizontal)
                    
                }
                .sheet(isPresented: $openChoices, content: {
                    NavigationStack {
                        VStack {
                            HStack {
                                Text("Circuit Choices")
                                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
                                    .padding(.top, 30)
                                    .padding(.leading)
                                Spacer()
                            }
                            ForEach(duviriData.choices, id: \.category) { category in
                                VStack(spacing: 2) {
                                    Text(category.category.capitalized)
                                        .font(.title)
                                    
                                    HStack {
                                        ForEach(category.choices, id: \.self) { choice in
                                          
                                                Text(choice)
                                                    .font(.system(size: 20))
                                            
                                            
                                        }
                                    }
                                    Spacer()
                                }
                                
                                Spacer()}
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.blueCharcoal)
                        
                        
                    }
                    .presentationDetents([.medium])
                })
                
                .frame(width: 346, height: 73)
                .background(Color.blueCharcoal)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                
            }
        }
        .onTapGesture {
            openChoices.toggle()
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
    DuviriView()
        .foregroundStyle(Color.white)
}

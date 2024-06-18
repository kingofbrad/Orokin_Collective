//
//  CircuitChoicesView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 15/04/2024.
//

import SwiftUI

struct CircuitChoicesView: View {
    @State private var openChoices: Bool = false
    @ObservedObject var networkModel = NetworkCall()
    
    var body: some View {
        VStack {
            if let circuit = networkModel.worldState?.duviriCycle {
                VStack(alignment: .center, spacing: 5) {
                    Text("Circuit")
                        .font(.system(size: 18))
                        .bold()
                    Text("View the possible choices")
                        .font(.system(size: 14))
                        .foregroundStyle(.silverChalice)
                    Text("Tap to View")
                        .font(.system(size: 14))
                        .foregroundStyle(.silverChalice)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 89)
                .background(Color.blueCharcoal)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .onTapGesture {
                    openChoices.toggle()
                }
                .sheet(isPresented: $openChoices, content: {
                    VStack(alignment: .leading) {
                        Text("Circuit Choices")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .padding(.top, 30)
                          
                            .padding(.horizontal,20)
                            .padding(.top, 5)
                        
                        // Information
                        VStack(alignment: .leading, spacing: 40){
                            VStack(alignment: .leading, spacing: 20) {
                                if let firstChoice = circuit.choices.first {
                                    HStack {
                                        Text("Mode: -")
                                            .foregroundStyle(Color.gray)
                                            .fontWeight(.semibold)
                                        
                                        Text(firstChoice.category.capitalized)
                                            .fontWeight(.semibold)
                                            .font(.system(size: 16))
                                    }
                                    VStack {
                                        ForEach(firstChoice.choices, id:\.self) { choice in
                                            HStack {
                                                Text("Warframe")
                                                    .fontWeight(.semibold)
                                                    .foregroundStyle(Color.silverChalice)
                                                Spacer()
                                                Text("\(choice)")
                                                    .padding(4)
                                                    .background(Color.tundora)
                                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                                    .font(.system(size: 15))
                                            }
                                        }
                                    }
                                    
                                }
                                if let secondChoice = circuit.choices.last {
                                    HStack {
                                        Text("Mode: -")
                                            .foregroundStyle(Color.gray)
                                            .fontWeight(.semibold)
                                        Text(secondChoice.category.capitalized)
                                            .fontWeight(.semibold)
                                            .font(.system(size: 16))
                                    }
                                    VStack {
                                        ForEach(secondChoice.choices, id:\.self) { choice in
                                            HStack {
                                                Text("Weapon")
                                                    .fontWeight(.semibold)
                                                    .foregroundStyle(Color.silverChalice)
                                                Spacer()
                                                Text("\(choice)")
                                                    .padding(4)
                                                    .background(Color.tundora)
                                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                                    .font(.system(size: 15))
                                            }
                                        }
                                    }
                                    
                                }
                            }
                            Spacer()
                            VStack {
                                Text("Above is the available circuit choices ")
                                Text("Normal is for the warframes")
                                Text("Hard is the steel path route for the incarnnon weapons")
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding(20)
                        Spacer()
                        
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundStyle(Color.white)
                    .background(Color.blueCharcoal)
                    .presentationDetents([.large])
                    
                })
            }
        
            
        }
        .task {
            do {
                try await networkModel.fetchWorldState()
            } catch APIError.invalidURL {
                print("invalid URL")
            } catch APIError.invaildClientResponse {
                print("invaild Client Response")
                networkModel.showError = true
            } catch APIError.invalidData {
                print("invaild Data")
            } catch APIError.invaildServerResponse {
                print("invaild Server Response")
            } catch {
                print("Unexcepted Error has appeared \(error)")
            }
        }
        
        
    }
}

#Preview {
    CircuitChoicesView(networkModel: NetworkCall())
}



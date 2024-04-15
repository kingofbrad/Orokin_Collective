//
//  CyclesView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 15/04/2024.
//

import SwiftUI

struct CyclesCard: View {
    let imageBool: Bool?
    let falseImage: String
    let trueImage: String
    let state: String
    let expiry: String
    let location:String
    
    var body: some View {
        HStack {
            Image(systemName: imageBool ?? false ? falseImage : trueImage)
                .resizable()
                .frame(width: 20, height: 20)
                .padding(.trailing, 2)
            
            Text(location)
                .padding(.leading, 50)
            Divider()
                .frame(width: 2,height: 20)
                .foregroundStyle(Color.white)
                .background(Color.white)
                
            Text(state.capitalized)
                .font(.footnote)
                .foregroundStyle(Color.silverChalice)
            Spacer()
            CountdownView(expiryDateString: expiry)
        }
        .padding(.horizontal, 30)
    }
}
#Preview {
    CyclesCard(imageBool: true, falseImage: "sun.max.fill", trueImage: "moon.fill", state: "day", expiry: "", location: "Earth")
}

struct CyclesView: View {
   @ObservedObject var networkModel = NetworkCall()
    @State private var openChoices: Bool = true

    
    var body: some View {
        VStack(alignment:.center, spacing: 20) {
            if let earthData = networkModel.worldState?.earthCycle {
                CyclesCard(imageBool: earthData.isDay, falseImage: "sun.max.fill", trueImage: "moon.fill", state: earthData.state, expiry: earthData.expiry, location: "Earth")
            }
            if let cetusData = networkModel.worldState?.cetusCycle {
                CyclesCard(imageBool: cetusData.isDay, falseImage: "sun.max.fill", trueImage: "moon.fill", state: cetusData.state, expiry: cetusData.expiry, location: "Cetus")
            }
            if let vallisData = networkModel.worldState?.vallisCycle {
                HStack {
                    Image(systemName: vallisData.isWarm ?? true ? "sun.max.fill" : "snowflake")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing, 2)
                    
                    Text("Orb Vallis")
                        .padding(.leading, 50)
                    Divider()
                        .frame(width: 2,height: 20)
                        .foregroundStyle(Color.white)
                        .background(Color.white)
                        
                    Text(vallisData.state.capitalized)
                        .font(.footnote)
                        .foregroundStyle(Color.silverChalice)
                    Spacer()
                    CountdownView(expiryDateString: vallisData.expiry)
                }
                .padding(.horizontal, 30)
            }
            if let driftData = networkModel.worldState?.cambionCycle {
                HStack {
                    Image(driftData.active == "fass" ? "Fass" : "Vome")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing, 2)
                   
                    Text("Cambion Drift")
                        .padding(.leading, 50)
                    Divider()
                        .frame(width: 2,height: 20)
                        .foregroundStyle(Color.white)
                        .background(Color.white)
                        
                    Text(driftData.state.capitalized)
                        .font(.footnote)
                        .foregroundStyle(Color.silverChalice)
                    Spacer()
                    CountdownView(expiryDateString: driftData.expiry)
                }
                .padding(.horizontal, 30)
            }  
            if let zarimanData = networkModel.worldState?.zarimanCycle {
                HStack {
                    Image(zarimanData.state == "grineer" ? "grineer" : "corpus")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding(.trailing, 2)
                        .foregroundStyle(.white)
                        
                    
                    Text("Zariman")
                        .padding(.leading, 50)
                    Divider()
                        .frame(width: 2,height: 20)
                        .foregroundStyle(Color.white)
                        .background(Color.white)
                        
                    Text(zarimanData.state.capitalized)
                        .font(.footnote)
                        .foregroundStyle(Color.silverChalice)
                    Spacer()
                    CountdownView(expiryDateString: zarimanData.expiry)
                }
                .padding(.horizontal, 30)
            }
            if let duviriData = networkModel.worldState?.duviriCycle {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Duviri")
                            Divider()
                                .frame(width: 2,height: 20)
                                .foregroundStyle(Color.white)
                                .background(Color.white)
                            
                            Text(duviriData.state.capitalized)
                                .font(.footnote)
                                .foregroundStyle(Color.silverChalice)
                        }
                       
                }
                    Spacer()
                    CountdownView(expiryDateString: duviriData.expiry)
                }
                
                .padding(.horizontal, 30)
            }
        }
        .padding(.vertical, 20)
        .background(Color.blueCharcoal)
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
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
    CyclesView(networkModel: NetworkCall())
}

#Preview {
    ContentView()
}


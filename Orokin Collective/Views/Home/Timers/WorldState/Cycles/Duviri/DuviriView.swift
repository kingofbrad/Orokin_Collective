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
    
   
    
    
    var body: some View {
        VStack {
            if let duviriData = networkModel.worldState?.duviriCycle {
                VStack {
                    VStack {
                        NavigationLink {
                            VStack(alignment: .leading) {
                                Rectangle()
                                    .frame(height: 50)
                                    .foregroundStyle(
                                        LinearGradient(colors: [.blueCharcoal, .black], startPoint: .bottom, endPoint: .top)
                                    ) // Title and Image
                                
                                VStack {
                                    ZStack {
                                        Image("Circuit")
                                            .resizable()
                                            .scaledToFill()
                                            .frame( height: 200, alignment: .center)
                                            .clipped()
                                        VStack{
                                            Spacer()
                                            HStack {
                                                Text("Circuit Choices")
                                                    .padding(4)
                                                    .font(.system(size: 20))
                                                    .bold()
                                                
                                                    .background(.ultraThinMaterial)
                                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                                Spacer()
                                            }
                                            .padding()
                                        }
                                        
                                    }
                                    .frame( height: 183)
                                }
                                .frame(maxWidth: .infinity)
                                // Information
                                VStack(alignment: .leading, spacing: 40){
                                    VStack(alignment: .leading, spacing: 20) {
                                        if let firstChoice = duviriData.choices.first {
                                            HStack {
                                                Text("Mode: -")
                                                    .foregroundStyle(Color.gray)
                                                    .fontWeight(.semibold)
                                                Text(firstChoice.category.capitalized)
                                                    .fontWeight(.semibold)
                                                    .font(.system(size: 16))
                                                
                                            }
                                            HStack {
                                                ForEach(firstChoice.choices, id:\.self) { choice in
                                                    Text("\(choice)")
                                                        .padding(4)
                                                        .background(Color.tundora)
                                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                                        .font(.system(size: 15))
                                                }
                                            }
                                            
                                        }
                                        if let secondChoice = duviriData.choices.last {
                                            HStack {
                                                Text("Mode: -")
                                                    .foregroundStyle(Color.gray)
                                                    .fontWeight(.semibold)
                                                Text(secondChoice.category.capitalized)
                                                    .fontWeight(.semibold)
                                                    .font(.system(size: 16))
                                            }
                                            HStack {
                                                ForEach(secondChoice.choices, id:\.self) { choice in
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
                                .padding(20)
                                Spacer()
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundStyle(Color.white)
                            .background(Color.blueCharcoal)
                            .ignoresSafeArea()
                            
                        } label: {
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
                    }
                    
                }
                .frame( height: 73)
                .background(Color.blueCharcoal)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                
            }
        }
        .onTapGesture {
            openChoices.toggle()
        }
        
        
    }
    
}


#Preview {
    NavigationStack {
        DuviriView(networkModel: NetworkCall())
            .foregroundStyle(Color.white)
    }
}

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
    @ObservedObject var networkModel = NetworkCall()
    
    var body: some View {
        VStack {
            if let cetusCycle = networkModel.worldState?.cetusCycle {
                VStack {
                    HStack{
                        withAnimation(.easeInOut(duration: 0.1)) {
                            Image(systemName: cetusCycle.isDay ?? true ? "sun.max.fill" : "moon.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding(.trailing, 2)
                        }
                        
                        
                        VStack(alignment: .leading, spacing: 2){
                            Text("Cetus")
                                .font(.system(size: 18))
                                .bold()
                            Text("\(cetusCycle.timeLeft)")
                                .font(.system(size: 14))
                                .foregroundStyle(.silverChalice)
                            Text("\(cetusCycle.state.capitalized)")
                                .font(.system(size: 14))
                                .foregroundStyle(.silverChalice)
                        }
                        Spacer()
                        CountdownView(expiryDateString: cetusCycle.expiry)
                    }
                    .padding(.horizontal)
                    
                }
                .frame( height: 73)
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
                .frame( height: 73)
                .background(Color.blueCharcoal)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        
        
        
    }
}



#Preview(body: {
    PreviewofItem()
})

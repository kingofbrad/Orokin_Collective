//
//  SteelPathView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 31/03/2024.
//

import SwiftUI

struct SteelPathView: View {
    @ObservedObject var networkModel = NetworkCall()
    
    var body: some View {
        VStack {
            if let steelPathData = networkModel.worldState?.steelPath {
                VStack(alignment: .center, spacing: 5) {
                            Text("Steel Path")
                                .font(.system(size: 18))
                                .bold()
                            Text("\(steelPathData.currentReward.name)")
                                .font(.system(size: 14))
                                .foregroundStyle(.silverChalice)
                    
                    VoidTraderCountDownTimer(expiryDateString: steelPathData.expiry)
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 89)
                .background(Color.blueCharcoal)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}

#Preview {
    SteelPathView()
}

#Preview {
    ContentView()
}

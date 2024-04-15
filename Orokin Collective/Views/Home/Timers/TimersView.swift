//
//  TimersView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 26/03/2024.
//

import SwiftUI

struct WorldStateView: View {
    var networkModel: NetworkCall
    
    var body: some View {
        VStack {
            TimerScrollView(networkModel: networkModel)
        }
        .foregroundStyle(Color.white)
        
    }
}


struct TimerScrollView: View {
    var networkModel: NetworkCall
    
    var body: some View {
        ScrollView() {
            VoidTraderView()
            EventsView(networkModel: networkModel)
            LazyVGrid(columns: [GridItem(.fixed(180)), GridItem(.fixed(180))]) {
                CircuitChoicesView(networkModel: networkModel)

                SteelPathView(networkModel: networkModel)
            }
            CyclesView(networkModel:networkModel)
            ArchonHuntView(networkModel: networkModel)
            Spacer()
        }
        .padding(.top, 60)
        .padding(.horizontal, 10)
            
    }
}

#Preview {
    ContentView()
}



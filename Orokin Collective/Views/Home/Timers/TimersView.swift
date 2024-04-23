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
            VoidTraderView(nm: networkModel)
            EventsView(networkModel: networkModel)
            ArbitrationView(networkModel: networkModel)
                .opacity(networkModel.showError ? 0:1)
            
            LazyVGrid(columns: [GridItem(.flexible(minimum: 180)), GridItem(.flexible(minimum: 180))]) {
                CircuitChoicesView(networkModel: networkModel)
                SteelPathView(networkModel: networkModel)
            }
            DailyDealsView(networkModel: networkModel)
            CyclesView(networkModel:networkModel)
            ArchonHuntView(networkModel: networkModel)
            SortieView(nm: networkModel)
            Spacer()
        }
        .padding(.top, 60)
        .padding(.horizontal, 10)
        .scrollIndicators(.hidden)
        
    }
}

#Preview {
    ContentView()
}



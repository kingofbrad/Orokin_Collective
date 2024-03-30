//
//  TimersView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 26/03/2024.
//

import SwiftUI

struct WorldStateView: View {
    var body: some View {
        VStack {
            TimerScrollView()
        }
        .foregroundStyle(Color.white)
        
    }
}

#Preview {
    WorldStateView()
}


struct TimerScrollView: View {
    var body: some View {
        ScrollView {
            Baro_Ki_Teer_View()
            CetusCycleView()
            Spacer()
        }.padding(.top, 60)
    }
}

#Preview {
   ContentView()
}

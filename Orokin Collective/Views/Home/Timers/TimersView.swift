//
//  TimersView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 26/03/2024.
//

import SwiftUI

struct TimersView: View {
    var body: some View {
        VStack {
            TimerScrollView()
        }
        .foregroundStyle(Color.white)
        
    }
}

#Preview {
    TimersView()
}


struct TimerScrollView: View {
    var body: some View {
        ScrollView {
            Baro_Ki_Teer_View()
            Spacer()
        }.padding(.top, 60)
    }
}

#Preview {
   ContentView()
}

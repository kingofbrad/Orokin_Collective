//
//  MissionScrollView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 19/03/2024.
//

import SwiftUI

struct MissionScrollView: View {
    var body: some View {
        ScrollView{
            Section("Alerts") {
                AlertsView()
            }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    MissionScrollView()
}

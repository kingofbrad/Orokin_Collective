//
//  MissionScrollView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 19/03/2024.
//

import SwiftUI

struct MissionScrollView: View {
    var body: some View {
        VStack {
            ScrollView{
                VStack {
                    Section("Alerts") {
                        
                        ArbitrationView()
                    }
                    Section("Fissures") {
                        CetusCycleView()
                    }
                }
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    MissionScrollView()
}

//
//  AlertsView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 10/03/2024.
//

import SwiftUI

struct AlertsView: View {
    @State private var isPresented: Bool = false
    
    var body: some View {
        Button(action: {isPresented.toggle()}, label: {
            Text("Open Warframe Sheet")
        })
        .fullScreenCover(isPresented: $isPresented, content: {
            WarframeListView()
        })
    }
}

#Preview {
    AlertsView()
}

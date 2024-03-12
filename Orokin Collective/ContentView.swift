//
//  ContentView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 15/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            WarframeListView()
                .tabItem {
                    Label(
                        title: { Text("Warframes") },
                        icon: { Image(systemName: "42.circle") }
                    )
                }
            WeaponsListView()
                .tabItem {
                    Label("Weapons", systemImage: "list.dash")
                }
            
            ArbitrationView()
                .tabItem {
                    Label(
                        title: { Text("World State") },
                        icon: { Image(systemName: "42.circle") }
                    )

                }
           
        }
    }
    
    
    
    
}

#Preview {
    ContentView()
}

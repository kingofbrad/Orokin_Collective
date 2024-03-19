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
            Group {
                
                
                DashBoardView()
                    .tabItem {
                        Label(
                            title: { Text("Dashboard") },
                            icon: { Image(systemName: "list.dash.header.rectangle") }
                        )
                    }
                
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
                
                
                CetusCycleView()
                    .tabItem {
                        Label(
                            title: { Text("World State") },
                            icon: { Image(systemName: "42.circle") }
                        )
                        
                    }
            }
           
            .toolbarColorScheme(.dark, for: .tabBar)
        }
        
    }
    
    
    
    
}

#Preview {
    ContentView()
}

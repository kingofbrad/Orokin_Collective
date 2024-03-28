//
//  ContentView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 15/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        // Place Settings Page here
                    } label: {
                        Image(systemName: "gear")
                            .padding(.horizontal, 30)
                    }
                }
                TabView {
                    Group {
                        DashBoardView()
                            .tabItem {
                                Label(
                                    title: { Text("News") },
                                    icon: { Image(systemName: "house") }
                                )
                            }
                        
                        NewsView()
                            .tabItem {
                                Label(
                                    title: { Text("News") },
                                    icon: { Image(systemName: "note.text") }
                                )
                            }
                        
                        CodexView()
                            .tabItem {
                                Label(
                                    title: {
                                        Text("Codex")
                                        
                                    },
                                    icon: { Image(systemName: "magnifyingglass") }
                                )
                            }
                    }
                    .toolbarBackground(Color.blueCharcoal, for: .tabBar)
                    .toolbarBackground(.visible, for: .tabBar)
                }
                
                
            }
            .background(
                Image("VitruvianLn")
                    
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea(.all)
                
                
            )
        }
        
    }
    
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 15/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
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
                TabView(selection: $selectedTab) {

                    if selectedTab == .house {
                        DashBoardView()
                    } else if selectedTab == .book {
                        NewsView()
                    } else if selectedTab == .text {
                        CodexView()
                    }
                }
                
                CustomTabBar(selectedTab: $selectedTab)
                
                
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

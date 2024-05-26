//
//  ContentView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 15/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .house
    @ObservedObject var networkModel = NetworkCall()
    @State private var openSettings: Bool = false
    @State private var timer: Timer?
    
    init() {
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().barTintColor = UIColor.woodsmoke
        UITabBar.appearance().backgroundColor = UIColor.woodsmoke
    }
    
    var body: some View {
      NavigationStack {
               if !networkModel.isFetchingData  {
                   VStack{
                       TabView(selection: $selectedTab) {
                           DashBoardView(networkModel: networkModel)
                               .tabItem { Label("Home", systemImage: "house")}
                               .tag(Tab.house)
                           NewsView(networkModel: networkModel)
                               .tabItem { Label("News", systemImage: "newspaper")}
                               .tag(Tab.newspaper)
                           CodexView()
                               .tabItem {
                                   Label("Codex", systemImage: selectedTab == .book ? "book" : "book.closed")
                                       .contentTransition(.symbolEffect)
                               }
                               .tag(Tab.book)
                       }
                       
                   }
                   .background(Color.blackPearl)
               } else {
                   SplashScreen()
                       .onAppear {
                           networkModel.fetchData()
                       }
               }
        }
      
        .background(
            Color.blackPearl
        )
//        .refreshable {
//            networkModel.fetchData()
//        }
        .onAppear {
            startTimer()
        }
        .onDisappear {
            timer?.invalidate()
        }
    }
    
    private func startTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 60 , repeats: true) { _ in
            networkModel.fetchData()
        }
    }
    
}

#Preview {
    RootView {
        ContentView()
    }
}

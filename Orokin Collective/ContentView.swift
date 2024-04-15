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
    @State private var isFetchingData: Bool = true
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        Group{
            if isFetchingData {
                SplashScreen()
                    .onAppear {
                        fetchData()
                    }
            } else {
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
                                DashBoardView(networkModel: networkModel)
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

    }
    private func fetchData() {
        Task {
            do {
                try await networkModel.fetchWorldState()
                isFetchingData = false
            } catch APIError.invalidURL {
                print("invalid URL")
            } catch APIError.invaildResponse {
                print("invaild Response")
            } catch APIError.invalidData {
                print("invaild Data")
            } catch {
                print("Unexcepted Error has appeared \(error)")
            }
        }
    }
    
}

#Preview {
    ContentView()
}

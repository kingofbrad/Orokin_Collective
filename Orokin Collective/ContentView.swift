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
    @State private var openSettings: Bool = false
    @State private var timer: Timer?
    
    
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
                        TabView(selection: $selectedTab) {
                            DashBoardView(networkModel: networkModel)
                                .tag(Tab.house)
                            NewsView(networkModel: networkModel)
                                .tag(Tab.newspaper)
                            CodexView()
                                .tag(Tab.book)
                        }
                        
                        
                        CustomTabBar(selectedTab: $selectedTab)
                    }
                    
                    .background(
                        Image("VitruvianLn")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .ignoresSafeArea(.all, edges: .all)
                    )
                }
                .fullScreenCover(isPresented: $openSettings, content: {
                    Button {
                        openSettings.toggle()
                    } label: {
                        Text("Close Settings")
                    }
                })
               
                .onAppear {
                    startTimer()
                }
                .onDisappear {
                    timer?.invalidate()
                }
            }
        }
        .refreshable {
            do {
                try await networkModel.fetchWorldState()
                isFetchingData = false
            } catch APIError.invalidURL {
                print("invalid URL")
            } catch APIError.invaildClientResponse {
                print("invaild Client Response")
                networkModel.showError = true
            } catch APIError.invalidData {
                print("invaild Data")
            } catch APIError.invaildServerResponse {
                print("invaild Server Response")
            } catch {
                print("Unexcepted Error has appeared \(error)")

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
            } catch APIError.invaildClientResponse {
                print("invaild Client Response")
                networkModel.showError = true
            } catch APIError.invalidData {
                print("invaild Data")
            } catch APIError.invaildServerResponse {
                print("invaild Server Response")
            } catch {
                print("Unexcepted Error has appeared \(error)")

            }
        }
    }
    private func startTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 60 , repeats: true) { _ in
            fetchData()
        }
    }
    
}

#Preview {
    
    NavigationStack {
        ContentView()
    }
}

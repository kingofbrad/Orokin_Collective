//
//  DashBoardView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 12/03/2024.
//

import SwiftUI

struct DashBoardView: View {
    
    @ObservedObject var networkModel = NetworkCall()
    
    
    @State private var currentTab: Int = 0
    @State private var openSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: self.$currentTab) {
                    WorldStateView(networkModel: networkModel).tag(0)
                    FissureView(networkModel: networkModel).tag(1)
                    InvasionsView(networkModel: networkModel).tag(2)
                    SyndicatesView(networkModel: networkModel).tag(3)
                    
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .ignoresSafeArea(.all)
                .animation(.easeInOut(duration: 0.3), value: currentTab)
                
            }
        }
        .foregroundStyle(Color.white)
        .background(Color.blackPearl)
        
    }
}

struct tabBarView: View {
    var tabBarOptions: [String] = ["WorldState","Fissures","Invasions","Syndicates"]
    @Binding var currentTab: Int
    @Namespace var namespace
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(Array(zip(self.tabBarOptions.indices,
                                  self.tabBarOptions)),
                        id: \.0)
                { index, name in
                    TabBarItem(currentTab: self.$currentTab, namespace: namespace.self, tabBarItemName: name, tab: index)
                }
            }
            .padding(.horizontal)
        }
        .padding(.top, 10)
        .frame(height: 30)
        .scrollDisabled(true)
    }
}

struct TabBarItem: View {
    @Binding var currentTab: Int
    let namespace: Namespace.ID
    
    var tabBarItemName: String
    var tab: Int
    
    var body: some View {
        Button {
            self.currentTab = tab
        } label: {
            VStack {
                Spacer()
                Text(tabBarItemName)
                    .font(.system(size: 14))
                    .font(.footnote).fontWeight(.semibold)
                    .foregroundStyle(currentTab == tab ? Color.white : Color.gray)
                    
                if currentTab == tab {
                    Color.white
                        .frame(height: 2)
                        .matchedGeometryEffect(id: "underline" , in: namespace, properties: .frame)
                } else {
                    Color.clear.frame(height: 2)
                    
                }
            }
            .padding(.vertical, 10)
            .animation(.spring(), value: self.currentTab)
        }
    }
}

#Preview(body: {
    NavigationStack {
        ContentView()
    }
})

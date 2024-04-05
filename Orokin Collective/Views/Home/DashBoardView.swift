//
//  DashBoardView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 12/03/2024.
//

import SwiftUI

struct DashBoardView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    @State private var currentTab: Int = 0
    @State private var openSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                TabView(selection: self.$currentTab) {
                    WorldStateView().tag(0)
                    FissuresView().tag(1)
                    InvasionsView().tag(2)
                    SyndicatesView().tag(3)
                    
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .ignoresSafeArea(.all)
                .animation(.easeInOut(duration: 0.3), value: currentTab)
                
                
                tabBarView(currentTab: self.$currentTab)
                
            }
            
        }
        
        .foregroundStyle(Color.white)
        .background(
            Image("VitruvianLn")
//                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
        )
        
        
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
        .frame(height: 30)
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
            .animation(.spring(), value: self.currentTab)
        }
    }
}



#Preview(body: {
    NavigationStack {
        ContentView()
    }
})

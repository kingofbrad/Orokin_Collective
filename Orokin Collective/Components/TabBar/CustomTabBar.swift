//
//  CustomTabBar.swift
//  Orokin Collective
//
//  Created by Bradlee King on 31/03/2024.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case newspaper
    case book = "book.closed"
    
}

enum TabName: String, CaseIterable {
    case home
    case news
    case codex
    
}


struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    private var bookAnimation: String {
        selectedTab == .book ? "book.fill" : "book.closed"
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    VStack {
                        Image(systemName: tab == .book ? bookAnimation : (selectedTab == tab ? fillImage : tab.rawValue))
                            .contentTransition(.symbolEffect)
                            .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                            .foregroundStyle(selectedTab == tab ? .husk : .silverChalice)
                            .font(.system(size: 22))
                        
                        Text(tabName(for: tab))
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(selectedTab == tab ? .husk : .silverChalice)
                            .padding(.top, 5)
                    }
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.1)) {
                            selectedTab = tab
                        }
                    }
                    Spacer()
                    
                    
                    
                }
            }
            .frame(height: 80)
            .background(Color.blueCharcoal)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 10)
            
        }
        
    }
    private func tabName(for tab: Tab) -> String {
        switch tab {
        case .house:
            return TabName.home.rawValue
        case .newspaper:
            return TabName.news.rawValue
        case .book:
            return TabName.codex.rawValue
        
        }
    }
}


#Preview {
    CustomTabBar(selectedTab: .constant(.house))
}


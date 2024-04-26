//
//  CodexView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 28/03/2024.
//

import SwiftUI
import AlertToast

struct CodexView: View {
    @State private var searchText: String = ""
    @ObservedObject var networkModel = NetworkCall()
    
    @State private var filteredItems: [ItemElement] = []
    @State private var isSearching: Bool = false
    @State private var openSearch: Bool = false
    @State private var showToast: Bool = false
    
    private func performSearch(keyword: String)  {
        let lowercaseKeyword = keyword.lowercased()
        
        
        if lowercaseKeyword.isEmpty{
            filteredItems = []
        } else {
            isSearching = true
            filteredItems = networkModel.items.filter{$0.name.lowercased().contains(lowercaseKeyword)}
            
            //            let uniqueItemsSet = Set(filteredItems)
            //            filteredItems = Array(uniqueItemsSet)
            Task {
                do {
                    try await networkModel.fetchItem(searchTerm: lowercaseKeyword)
                    isSearching = false
                } catch {
                    showToast = true
                    print("Error fetching item:", error)
                }
            }
        }
    }
    
    private var items: [ItemElement] {
        if !networkModel.itemSearch.isEmpty {
            return filteredItems
        } else {
            return networkModel.items
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                CustomSearchBar(searchText: $searchText, backgroundColor: .blueCharcoal, textColor: .silverChalice, cancelButtonColor: .silverChalice, placeHolderText: "the codex")
                    .onTapGesture {
                        openSearch = true
                    }
                    .onSubmit {
                        performSearch(keyword: searchText)
                    }
                
                    ScrollView{
                        if isSearching {
                            ProgressView("Searching...")
                                .foregroundColor(.marigold)
                        } else {
                            List(filteredItems ,id: \.category) { item in
                                Text(item.name)
                                
                            }
                        }
                    }
             
                
                Spacer()
            }
            .padding(.horizontal)
            .onChange(of: searchText, perform: { newValue in
                performSearch(keyword: newValue)
                networkModel.itemSearch = newValue
            })
            .foregroundStyle(Color.white)
            .background(
                Image("VitruvianLn")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
            )
//            .toast(isPresenting: $showToast) {
//                AlertToast(displayMode: .banner(.slide), type: .regular, title: "Something went wrong")
//            }
        }
        

    }
    
    var warframes: some View {
        VStack {
            ForEach(items.filter{$0.category == "Warframes"}) { frame in
                Text(frame.name)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    CodexView()
}

struct CodexCard: View {
    var body: some View {
        VStack {
            HStack {
                Text("Warframes")
                    .fontWeight(.semibold)
                    .font(.system(size: 30))
                Spacer()
                Image(systemName: "person")
                    .font(.system(size: 30))
            }
            .padding(.horizontal, 20)
        }
        .frame(height: 80)
        .background(Color.blueCharcoal)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

//
//  CodexView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 28/03/2024.
//



import SwiftUI

struct SearchResult: Decodable {
    let items: [ItemElement]  // Assuming ItemElement is your model type
}

struct CodexView: View {
    @State private var searchText: String = ""
    @ObservedObject var networkModel = NetworkCall()
    
    @State private var isSearching: Bool = false
    @State private var openSearch: Bool = false
    @State private var showToast: Bool = false
    @State private var isMenuOpen: Bool = false
    
    @State private var selectedCategory: Category = .all
    let categories: [Category] = Category.allCases
    
    
    private var filteredItems: [ItemElement] {
        if selectedCategory.rawValue == Category.all.rawValue {
            return networkModel.items
        } else {
            return networkModel.items.filter { $0.category.contains(selectedCategory.rawValue) }
        }
    }
    
    
    
    
    private func performSearch() async  {
        do {
            guard !searchText.isEmpty else{
                return
            }
            
            try await networkModel.fetchItem(searchTerm: searchText )
        } catch {
            showToast = true
            print("Error fetching item:", error)
        }
        
    }
    
    private func performItemSearch() async {
        do {
            guard !searchText.isEmpty else {return}
            
             try await networkModel.searchItem(searchTerm: searchText)
            
        } catch {
            showToast = true
            print("Error fetching item:", error)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                CustomSearchBar(searchText: $searchText, backgroundColor: .blueCharcoal, textColor: .silverChalice, cancelButtonColor: .silverChalice, isCategory: true, placeHolderText: "the codex", onCommit: {
                    Task {
                        await performSearch()
                    }
                }) {
                    AnyView(
                        Menu() {
                            ForEach(categories, id: \.self) { category in
                                Button {
                                    selectedCategory = category
                                } label: {
                                    HStack {
                                        if selectedCategory == category {
                                            Image(systemName: "checkmark")
                                        }
                                        Text(category.rawValue)
                                    }
                                }
                                
                            }
                        } label : {
                            if selectedCategory == .all {
                                Image(systemName:"line.3.horizontal.decrease.circle.fill")
                                    .foregroundColor(.silverChalice)
                            } else {
                                Image(systemName:"line.3.horizontal.decrease.circle.fill")
                                    .renderingMode(.original)
                                    .foregroundColor(.red)
                            }
                            
                            
                            
                            
                        }
                    )
                }
                
                ScrollView {
                    VStack{
                        ForEach(filteredItems, id:\.uniqueName) { item in
                            NavigationLink {
                                CodexDetailView(name:item.name, desc: item.description ?? "" ,imageURL: item.imageName ?? "", componentsArray: item.components ?? [], tradable: item.tradable,levelStats: item.levelStats ?? [],drops: item.drops ?? [], category: Category(rawValue: item.category) ?? Category.all)
                            } label: {
                                CodexCard(name: item.name, desc: item.description ?? "", imageURL: item.imageName ?? "")
                                    .scrollTransition(.interactive, axis: .vertical) { view, phase in
                                        view.opacity(phase.value > 0 ? 0 : 1.0)
                                            .offset(x: phase.value < 0 ? 500 : 0)
                                            
                                    }
                                    
                                    
                            }
                        }
                    }
                    .scrollTargetLayout()
                    
                }
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.viewAligned)
                
                
                Spacer()
            }
            .padding(.horizontal)
            .foregroundStyle(Color.white)
            .background(Color.blackPearl)
            .ignoresSafeArea(.keyboard)
        }
        
        
        
    }
}

#Preview {
    CodexView()
}





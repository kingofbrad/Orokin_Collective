//
//  CodexView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 28/03/2024.
//



import SwiftUI



struct CodexView: View {
    @State private var searchText: String = ""
    @ObservedObject var networkModel = NetworkCall()
    
    @State private var showToast: Bool = false
    
    @State private var selectedCategory: Category = .all
    let categories: [Category] = Category.allCases
    
    @State private var favoriteItems: [ItemElement] = []
    @State private var showFavoritesOnly: Bool = false
    
//    @State private var selectedItem: ItemElement
    
    private var filteredItems: [ItemElement] {
        let itemsToShow = showFavoritesOnly ? favoriteItems : networkModel.items
        
        if selectedCategory.rawValue == Category.all.rawValue {
            return itemsToShow
        } else {
            return itemsToShow.filter { $0.category.contains(selectedCategory.rawValue) }
        }
    }
    
    private func performSearch()  {
        Task {
            do {
                guard !searchText.isEmpty else {
                    return
                }
                
                try await networkModel.fetchItem(searchTerm: searchText)
            } catch {
                showToast = true
                print("Error fetching item:", error)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                CustomSearchBar(searchText: $searchText, backgroundColor: .blueCharcoal, textColor: .silverChalice, cancelButtonColor: .silverChalice, isCategory: true, placeHolderText: "the codex", onCommit: { performSearch()})
                
                List(filteredItems, id:\.uniqueName) { item in
                    ZStack{
                        NavigationLink(destination:  CodexDetailView(name: item.name,
                                                                     desc: item.description ?? "",
                                                                     tradable: item.tradable,
                                                                     imageName: item.imageName ?? "",
                                                                     items: networkModel.items,
                                                                     category: Category(rawValue: item.category) ?? Category.all,
                                                                     selectedItem: item)) {EmptyView()}
                            
                            .listRowBackground(Color.clear)
                            .scrollIndicators(.hidden)
                            .listRowSeparator(.hidden)

                        CodexCard(name: item.name, desc: item.description ?? "", imageURL: item.imageName ?? "")
                            .contextMenu {
                                Button(action: {
                                    // Toggle favorite status
                                    if let index = favoriteItems.firstIndex(where: { $0.uniqueName == item.uniqueName }) {
                                        favoriteItems.remove(at: index)
                                    } else {
                                        favoriteItems.append(item)
                                    }
                                }) {
                                    // Display appropriate text based on favorite status
                                    Text(favoriteItems.contains(where: { $0.uniqueName == item.uniqueName }) ? "Remove from Favorites" : "Add to Favorites")
                                    Image(systemName: favoriteItems.contains(where: { $0.uniqueName == item.uniqueName }) ? "star.fill" : "star")
                                }
                            }
                            
                    }
                    
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .searchable(text: $searchText,placement: .navigationBarDrawer(displayMode: .always) ,prompt: "Search for Weapons" )
                
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .foregroundStyle(Color.white)
            .background(Color.blackPearl)
            .ignoresSafeArea(.keyboard)
            .onAppear {
                favoriteItems = UserDefaults.standard.loadFavoriteItems()
            }
            .onDisappear {
                UserDefaults.standard.saveFavoriteItems(favoriteItems)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Section("Favorites") {
                            Button(action: { showFavoritesOnly.toggle() }) {
                                Label("Toogle Favorites", systemImage: showFavoritesOnly ? "heart.fill" : "heart")
                            }
                        }
                        
                        Section(header: Text("Filter")) {
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
                        }
                    }
                label: {
                    Label("Add", systemImage: "line.3.horizontal.decrease.circle")
                }
                }
            }
            
        }
    }
}


#Preview {
    NavigationStack {
        ContentView()
    }
}





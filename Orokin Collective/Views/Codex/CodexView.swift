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
                    ForEach(filteredItems, id:\.uniqueName) { item in
                        NavigationLink {
                            
                        } label: {
                            CodexCard(name: item.name, desc: item.description ?? "", imageURL: item.imageName ?? "")
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .foregroundStyle(Color.white)
            .background(
                Image("VitruvianLn")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
            )
           
        }
        
        
    }
}

#Preview {
    CodexView()
}

struct CodexCard: View {
    let name: String
    let desc: String
    let imageURL: String
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                Spacer()
                Text(desc)
                    .fontWeight(.semibold)
                    .font(.system(size: 15))
            }
            Spacer()
            
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/wfcd/warframe-items/master/data/img/\(imageURL)") ) { image in image.resizable() } placeholder: { Color.gray } .frame(width: 50, height: 50)
                .clipShape(Circle())
                .aspectRatio(contentMode: .fit)
        }
        .frame(height: 50)
        .padding()
        .background(Color.blueCharcoal)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
        
    }
}

#Preview {
    CodexCard(name: "Dante", desc: "Seeker of knowledge. Keeper of history. Daring researcher of Leverian lore. Dante composes arcane tales to support allies and devastate enemies.", imageURL: "dante.png")
}

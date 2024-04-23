//
//  SearchBar.swift
//  Orokin Collective
//
//  Created by Bradlee King on 20/04/2024.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var text: String

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.tintColor = .cafeRoyale // Text color
        searchBar.backgroundColor = .chalky
        searchBar.barTintColor = .chalky// Background color
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}


struct SearchBarView: View {
    @State private var searchText: String = ""
    
    var array: [String] = ["1","2","3","4"]
    @State var filteredItems: [String] = []
    
    private func itemSearch(keyword: String) {
        filteredItems = array.filter { item in
            item.contains(keyword)
        }
    }
    var item: [String] {
        filteredItems.isEmpty ? array : filteredItems
    }
    
    var body: some View {
            NavigationView {
                VStack {
                    SearchBar(text: $searchText)
                       
                    List {
                        ForEach(item, id: \.self) { index in
                            Text("Item \(index)")
                        }
                    }
                    .navigationTitle("Searchable List")
                    .onChange(of: searchText, perform: itemSearch)
                }
            }
        }
}

#Preview {
    SearchBarView()
}

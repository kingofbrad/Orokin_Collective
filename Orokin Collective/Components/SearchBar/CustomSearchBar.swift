//
//  CustomSearchBar.swift
//  Orokin Collective
//
//  Created by Bradlee King on 23/04/2024.
//

import SwiftUI

struct CustomSearchBar: View {
    @Binding var searchText: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("", text: $searchText)
                    .placeholder(when: searchText.isEmpty) {
                        Text("Search for Target")
                    }
                Spacer()
                Button {
                    searchText = ""
                } label: {
                    Image(systemName: "xmark")
                }
            }
            .padding(10)
            .foregroundStyle(.cafeRoyale)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.horizontal,10)
        
        
    }
}

#Preview {
    CustomSearchBar(searchText: .constant("Search"), backgroundColor: .chalky, textColor: .chalky)
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

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
    var cancelButtonColor: Color
    
    @State private var isEditing: Bool = false
    @State var isCategory: Bool
    @State private var isMenuOpen: Bool = false
    
    let placeHolderText: String
    var onCommit: () -> Void
    var content: () -> AnyView
    var body: some View {
        HStack {
            
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("", text: $searchText, onCommit: onCommit)
                    .placeholder(when: searchText.isEmpty) {
                        Text("Search \(placeHolderText)")
                    }
                    .onTapGesture {
                        isEditing = true
                    }
                Spacer()
                
                
                
                if isEditing {
                    Button {
                        searchText = ""
                    } label: {
                        Image(systemName: "xmark")
                    }
                } else {
                    if isCategory {
                        content()
                    }
                }
            }
            .padding(10)
            .foregroundStyle(textColor)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 15))
           
            .animation(.easeInOut, value: isEditing)
            
            if isEditing {
                
                Button(action: {
                    self.isEditing = false
                    self.searchText = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                        .foregroundStyle(cancelButtonColor)
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
                
                
            }
        }
        
    }
}

#Preview {
    CustomSearchBar(searchText: .constant("Search"), backgroundColor: .blueCharcoal, textColor: .silverChalice, cancelButtonColor: .silverChalice, isCategory: true, placeHolderText: "for targets", onCommit: {}, content: {AnyView(EmptyView())})
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

struct CustomSearchBarTest: View {
    @Binding var searchText: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            TextField("Search ...", text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                            .padding(.trailing, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.searchText = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.searchText = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

#Preview {
    CustomSearchBarTest(searchText: .constant(""))
}

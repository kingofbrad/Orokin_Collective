//
//  SimarisTargetView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 23/04/2024.
//

import SwiftUI

struct SimarisTargetView: View {
    @StateObject var networkModel = NetworkCall()
    @Binding var isPresented: Bool
    @State private var searchText: String = ""
    @State private var filteredTargets: [Synthtarget] = []
    
    var faction: String = "Simaris"
    var factionColor: Color = .cafeRoyale
    var imageSize: CGSize = CGSize(width: 50, height: 40.09)
    var textColor: Color = .chalky
    let expiry: String = ""
    
    
    
    private func performSearch(keyword: String) {
        filteredTargets = networkModel.synthTargets.filter { target in
            target.name.contains(keyword)
        }
    }
    private var targets: [Synthtarget] {
        filteredTargets.isEmpty ? networkModel.synthTargets : filteredTargets
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                HStack {
                    ForEach(SyndicateSigil.allCases, id:\.rawValue) { image in
                        if image.rawValue == faction {
                            Image(faction)
                                .resizable()
                                .frame(width: imageSize.width, height: imageSize.height)
                        }
                    }
                    
                    
                    Text(faction)
                        .fontWeight(.semibold)
                        .font(.system(size: 25))
                        .foregroundStyle(textColor)
                    
                    Spacer()
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .padding(8)
                            .background(.ultraThinMaterial)
                            .clipShape(Circle())
                        
                    }
                }
                
            }
            .frame(height: 80)
            .padding()
            .background(factionColor.overlay(content: {
                Color.black.opacity(0.2)
            }))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 10)
            Text("Tap to view target locations")
                .padding(.horizontal, 15)
                .foregroundStyle(textColor)
                .fontWeight(.semibold)
            CustomSearchBar(searchText: $searchText, backgroundColor: textColor, textColor: factionColor, cancelButtonColor: textColor, isCategory: false, placeHolderText: "for targets", onCommit: {}, content: {AnyView(EmptyView())})
            ScrollView {
                ForEach(targets, id: \.name) { target in
                    TargetView(name: target.name, factionColor: factionColor, textColor: textColor) {
                        AnyView (
                            VStack(alignment: .leading) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 10) {
                                        ForEach(target.locations, id:\.planet) { location in
                                            VStack {
                                                HStack {
                                                    Text(location.planet)
                                                        .fontWeight(.semibold)
                                                    Divider()
                                                        .frame(width: 1.5)
                                                        .foregroundStyle(.white)
                                                        .background(.white)
                                                    Text(location.mission)
                                                        .fontWeight(.semibold)
                                                    Spacer()
                                                    Text(location.faction)
                                                        .fontWeight(.semibold)
                                                        .foregroundStyle(textColor)
                                                }
                                                HStack {
                                                    Text(location.type)
                                                        .foregroundStyle(Color.silverChalice)
                                                        .fontWeight(.semibold)
                                                    Divider()
                                                        .frame(width: 1.5)
                                                        .foregroundStyle(.white)
                                                        .background(.white)
                                                    Text(location.spawnRate)
                                                        .foregroundStyle(Color.silverChalice)
                                                        .fontWeight(.semibold)
                                                    Spacer()
                                                    Text("Level: \(location.level)")
                                                        .foregroundStyle(Color.silverChalice)
                                                        .fontWeight(.semibold)
                                                }
                                            }
                                            .foregroundStyle(textColor)
                                        }
                                    }
                                    .padding()
                                }
                            }
                            
                        )
                    }
                }
                .onChange(of: searchText, perform: performSearch)
                
            }
            
            
            
            
        }
        .background(factionColor)
        .task {
            do {
                try await networkModel.fetchSynthTargets()
            } catch {
                print("Something Happened \(error)")
            }
        }
    }
}

#Preview {
    SimarisTargetView(isPresented: .constant(false))
}


struct TargetView: View {
    var name: String
    let factionColor: Color
    let textColor: Color
    @State private var isExpanded: Bool = false
    
    let content: () -> AnyView
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button {
                withAnimation {
                    self.isExpanded.toggle()
                }
            } label: {
                VStack(spacing: 0) {
                    HStack {
                        Text(name)
                            .fontWeight(.semibold)
                            .font(.system(size: 20))
                            .foregroundStyle(textColor)
                        Spacer()
                    }
                    
                }
                .frame(height: 50)
                .padding()
                .background(factionColor.overlay(content: {
                    if isExpanded {
                        Color.black.opacity(0.4)
                    } else {
                        Color.black.opacity(0.2)
                    }
                    
                }))
                .clipShape(isExpanded ? UnevenRoundedRectangle(cornerRadii: .init(topLeading: 10, bottomLeading:0, bottomTrailing: 0, topTrailing: 10)) : UnevenRoundedRectangle(cornerRadii: .init(topLeading: 10, bottomLeading:10, bottomTrailing: 10, topTrailing: 10)))
                .padding(.horizontal, 10)
            }
            if isExpanded {
                content()
                    .transition(.opacity)
                    .background(factionColor.overlay(content: {
                        Color.black.opacity(0.2)
                    }))
                    .frame(maxWidth:.infinity)
                    .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0, bottomLeading: 10, bottomTrailing: 10, topTrailing: 0)))
                    .padding(.horizontal, 10)
            }
        }
    }
}

//
//  WeaponsListView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 24/02/2024.
//

import SwiftUI
import AlertToast

struct WeaponsListView: View {
    @ObservedObject private var networkModel = NetworkCall()
    @State private var textSearch = ""
    @State private var filteredWeapons: [WeaponElement] = []
    @State private var showToast: Bool = false
    
    private func performSearch(keyword: String) {
        filteredWeapons = networkModel.weapon.filter { weapon in
            weapon.name.contains(keyword)
        }
    }
    
    private var weapons: [WeaponElement] {
        filteredWeapons.isEmpty ? networkModel.weapon : filteredWeapons
    }
    
    
    
    var body: some View {
        NavigationStack{
            VStack {
                List(weapons, id: \.name) { weapons in
                    
                    NavigationLink {
                        WeaponView(name: weapons.name,
                                   image: weapons.wikiaThumbnail ?? "" ,
                                   description: weapons.description,
                                   category: weapons.category,
                                   masteryReq: weapons.masteryReq ?? 0,
                                   accuracy: weapons.accuracy ?? 0.0,
                                   fireRate: weapons.fireRate ?? 0.0,
                                   criticalChance: weapons.criticalChance ?? 0.0,
                                   criticalMultiplier: weapons.criticalMultiplier ?? 0,
                                   polarities: weapons.polarities ?? ["",""],
                                   magazineSize: weapons.magazineSize ?? 0,
                                   multishot: weapons.multishot ?? 0,
                                   noise: weapons.noise ?? "",
                                   disposition: weapons.disposition ?? 0,
                                   reload: weapons.reloadTime ?? 0.0,
                                   trigger: weapons.trigger ?? ""
                        )
                    } label: {
                        VStack(alignment:.leading) {
                            Text("\(weapons.name)")
                                .font(.headline)
                            Text("\(weapons.category)")
                                .font(.subheadline)
                        }
                        
                        
                    }
                }.listStyle(.plain)
                    .navigationTitle("Weapons")
                    .toolbar(content: {
                        ToolbarItem {
                            Menu {
                                Text("Item 2")
                                Text("Item 3")
                            } label: {
                                Image(systemName: "line.3.horizontal.decrease.circle")
                            }
                            
                        }
                    })
                    .searchable(text: $textSearch)
                    .onChange(of: textSearch, perform: performSearch )
                    .toast(isPresenting: $showToast) {
                        AlertToast(displayMode:.hud, type: .error(.gray), title: "Invaild Response")
                    }
            }
            .task {
                do {
                    try await networkModel.fetchWeaponsData()
                } catch APIError.invalidURL {
                    print("invalid URL")
                } catch APIError.invaildResponse {
                    print("invaild Response")
                    showToast = true
                } catch APIError.invalidData {
                    print("invaild Data")
                } catch {
                    print("Unexcepted Error has appeared \(error)")
                }
            }
            .refreshable {
                do {
                    try await networkModel.fetchWeaponsData()
                } catch APIError.invalidURL {
                    print("invalid URL")
                } catch APIError.invaildResponse {
                    print("invaild Response")
                } catch APIError.invalidData {
                    print("invaild Data")
                } catch {
                    print("Unexcepted Error has appeared \(error)")
                }
            }
        }
        
    }
    
    
    
}





#Preview {
    WeaponsListView()
}
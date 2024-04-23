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
    //    @ObservedObject private var vm = weaponsViewModel()
    @State private var textSearch = ""
    @State private var filteredWeapons: [WeaponElement] = []
    
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
                Spacer()
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
                        WeaponListViewItem(name: weapons.name, description: weapons.description, category: weapons.category)
                        
                    }
                    .listRowBackground(Color.clear)
                    
                    
                    
                    
                }
                
                .scrollContentBackground(.hidden)
                .toolbarBackground(
                    .hidden, for: .navigationBar
                )
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
                .searchable(text: $textSearch,placement: .navigationBarDrawer(displayMode: .always) ,prompt: "Search for Weapons" )
                .onChange(of: textSearch, perform: performSearch )
                .overlay {
                    if networkModel.weapon.isEmpty {
                        VStack(spacing: 20) {
                            ProgressView()
                            Text("Loading...")
                        }
                        
                    }
                }
            }
            .foregroundStyle(.white)
            .background(
                Image("Vitruvian")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
            )
            .task {
                do {
                    try await networkModel.fetchWeaponsData()
                } catch APIError.invalidURL {
                    print("invalid URL")
                } catch APIError.invaildServerResponse {
                    print("invaild Response")
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
                } catch APIError.invaildServerResponse {
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



struct WeaponListViewItem: View {
    let name: String
    let description: String
    let category: String
    
    
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                
                Text(name)
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(.white)
                
                
                Text(category)
                    .font(.system(size: 14, weight: .bold, design: .default))
                    .foregroundColor(.gray)
                Divider()
                    .background(.white)
                Text(description)
                    .font(.system(size: 14, weight: .bold, design: .default))
                    .foregroundColor(.gray)
                
                
            }
            .padding(.trailing, 20)
            Spacer()
        }
        .padding(10)
        .frame(maxWidth: .infinity,  alignment: .center)
        .background(Color(red: 32/255, green: 36/255, blue: 38/255))
    }
}

//
//  CodexDetailView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 09/05/2024.
//

import SwiftUI


struct CodexDetailView: View {
    var name: String
    var desc: String
    var tradable: Bool
    var imageName: String
    
    
    var items: [ItemElement]
    @State var category: Category
    var selectedItem: ItemElement
    
    
   
    
    var body: some View {
        VStack(spacing: 0){
            ScrollView() {
                detail
                switch category {
                case .all:
                    EmptyView()
                case .arcanes:
                    ArcaneDetailView(levelStats: selectedItem.levelStats ?? [] , drop: selectedItem.drops ?? [])
                case .archGun:
                    
                    weaponsStats
                case .archMelee:
                    
                    weaponsStats
                case .archwing:
                    EmptyView()
                    
                case .enemy:
                    EmptyView()
                case .fish:
                    EmptyView()
                case .gear:
                    EmptyView()
                case .glyphs:
                    EmptyView()
                case .melee:
                    weaponsStats
                case .misc:
                    EmptyView()
                case .mods:
                    EmptyView()
                case .node:
                    EmptyView()
                case .pets:
                    EmptyView()
                case .primary:
                    
                    weaponsStats
                case .quests:
                    EmptyView()
                case .relics:
                    EmptyView()
                case .resources:
                    EmptyView()
                case .secondary:
                    
                    weaponsStats
                case .sentinels:
                    EmptyView()
                case .sigils:
                    EmptyView()
                case .skins:
                    EmptyView()
                case .warframes:
                    
                    WarframeDetailView(
                        shield: selectedItem.shield ?? 0,
                        armor: selectedItem.armor ?? 0,
                        health: selectedItem.health ?? 0,
                        power: selectedItem.power ?? 0,
                        sprintSpeed: selectedItem.sprint ?? 0.0,
                        components: selectedItem.components ?? [],
                        aura: selectedItem.polarities ?? [],
                        ability: selectedItem.abilities ?? [],
                        passive: selectedItem.passiveDescription ?? ""
                    )
                }
                
            }
            .scrollIndicators(.hidden)
            
        }
        .padding()
        .background(
            Color.blackPearl
        )
    }
    
    
    var detail: some View {
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/wfcd/warframe-items/master/data/img/\(imageName)") ) { image in image.resizable() } placeholder: { ProgressView() } .frame(width: 100, height: 100)
                .clipShape(Circle())
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                Text(name)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                Text(desc)
                    .foregroundStyle(.silverChalice)
                    .fontWeight(.semibold)
                
            }
            HStack {
                if tradable {
                    Text("Tradable")
                        .fontWeight(.semibold)
                        .font(.caption)
                        .foregroundStyle(.silverChalice)
                        .padding(10)
                        .background(Color.blackPearl)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blueCharcoal)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
   
    var weaponsStats: some View {
        VStack {
            Text("Weapons Stats")
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.blueCharcoal)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
    }
    
    
}






struct PolarImage: View {
    let polarity: String
    @State private var image: UIImage? = nil
    
    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                .aspectRatio(contentMode: .fit)
        } else {
            ProgressView()
                .onAppear {
                    loadImage()
                }
        }
    }
    
    private func loadImage() {
        guard let url = URL(string: "https://raw.githubusercontent.com/WFCD/genesis-assets/master/img/polarities/\(polarity).png") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let loadedImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = loadedImage
                }
            }
        }.resume()
    }
}

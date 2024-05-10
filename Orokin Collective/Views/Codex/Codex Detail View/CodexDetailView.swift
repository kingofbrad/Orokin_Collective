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
    var imageURL: String
    var componentsArray: [Component]
    var tradable: Bool
    var levelStats: [LevelStat]
    var drops: [Drop]
    
    
    @State var category: Category
    
    var body: some View {
        VStack(spacing: 0){
            ScrollView() {
                detail
                switch category {
                case .all:
                    EmptyView()
                case .arcanes:
                    ArcaneDetailView(levelStats: levelStats, drop: drops)
                case .archGun:
                    components
                    weaponsStats
                case .archMelee:
                    components
                    weaponsStats
                case .archwing:
                    components
                    warframeStats
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
                    components
                    weaponsStats
                case .quests:
                    EmptyView()
                case .relics:
                    EmptyView()
                case .resources:
                    EmptyView()
                case .secondary:
                    components
                    weaponsStats
                case .sentinels:
                    EmptyView()
                case .sigils:
                    EmptyView()
                case .skins:
                    EmptyView()
                case .warframes:
                    components
                    warframeStats
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
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/wfcd/warframe-items/master/data/img/\(imageURL)") ) { image in image.resizable() } placeholder: { ProgressView() } .frame(width: 100, height: 100)
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
    var components: some View {
        VStack(alignment: .leading) {
            Text("Components")
                .foregroundStyle(.silverChalice)
                .fontWeight(.semibold)
                .font(.system(size: 20))
            
            HStack(spacing: 25) {
                ForEach(componentsArray, id: \.name) { component in
                    VStack{
                        AsyncImage(url: URL(string: "https://raw.githubusercontent.com/wfcd/warframe-items/master/data/img/\(component.imageName)") ) { image in image.resizable() } placeholder: { ProgressView() } .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fit)
                        
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blueCharcoal)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    var warframeStats: some View {
        VStack(alignment: .leading) {
            Text("Stats")
            Text("Aura Polarity")
            HStack {
               Text("Preinstalled Polarities")
                Spacer()
                ForEach(componentsArray, id: \.uniqueName) { component in
                    if let polarities = component.polarities {
                        ForEach(polarities, id: \.self){ polarity in
                            PolarImage(polarity: polarity)
                        }
                    }
                }
            }
        }
//        .frame(maxWidth: .infinity)
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

#Preview {
    CodexDetailView(name: "Dante",desc: "Seeker of knowledge. Keeper of history. Daring researcher of Leverian lore. Dante composes arcane tales to support allies and devastate enemies." , imageURL: "dante.png", componentsArray: [], tradable: true, levelStats: [], drops: [], category: .warframes )
}

#Preview {
    CodexView()
}


struct PolarImage: View {
    let polarity: Aura
    
    var body: some View {
        if let url = URL(string: "https://raw.githubusercontent.com/WFCD/genesis-assets/master/img/polarities/\(polarity.rawValue).png") {
            AsyncImage(url: url) { image in image.resizable() } placeholder: { ProgressView() } .frame(width: 100, height: 100)
                .clipShape(Circle())
                .aspectRatio(contentMode: .fit)
        }
    }
}

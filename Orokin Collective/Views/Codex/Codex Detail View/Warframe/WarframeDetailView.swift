//
//  WarframeDetailView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 11/05/2024.
//

import SwiftUI

struct WarframeDetailView: View {
    var shield: Int
    var armor: Int
    var health: Int
    var power: Int
    var sprintSpeed: Double
    var components: [Component]
    var aura: [String]
    
    @ObservedObject var nm = NetworkCall()
    
    var ability: [Ability]
    var passive: String
    
    var body: some View {
        VStack(alignment: .leading){
            
            component
            stats
            abilites
        }
        .foregroundStyle(.white)
    }
    
    var component: some View {
        VStack(alignment: .leading) {
            Text("Components")
                .foregroundStyle(.glacier)
                .fontWeight(.semibold)
                .font(.system(size: 20))
            
            HStack(spacing: 25) {
                ForEach(components, id: \.imageName) { component in
                    AsyncImage(url: URL(string: "https://raw.githubusercontent.com/wfcd/warframe-items/master/data/img/\(component.imageName)") ) { image in image.resizable() } placeholder: { ProgressView() } .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .aspectRatio(contentMode: .fit)
                    
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blueCharcoal)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    
    
    var stats: some View {
        VStack(alignment: .leading) {
            Text("Stats")
                .fontWeight(.semibold)
                .foregroundStyle(.glacier)
                .font(.system(size: 20))
            Text("Aura Polarity")
                .fontWeight(.semibold)
            HStack {
                Text("Preinstalled Polarities")
                    .fontWeight(.semibold)
                Spacer()
                AuraImageView(aura: aura)
            }
            HStack {
                Text("Shield")
                    .fontWeight(.semibold)
                Spacer()
                Text("\(shield)")
                    .fontWeight(.semibold)
                    .foregroundStyle(.silverChalice)
            }
            HStack {
                Text("Armor")
                    .fontWeight(.semibold)
                Spacer()
                Text("\(armor)")
                    .fontWeight(.semibold)
                    .foregroundStyle(.silverChalice)
            }
            HStack {
                Text("Health")
                    .fontWeight(.semibold)
                Spacer()
                Text("\(health)")
                    .fontWeight(.semibold)
                    .foregroundStyle(.silverChalice)
            }
            HStack {
                Text("Power")
                    .fontWeight(.semibold)
                Spacer()
                Text("\(power)")
                    .fontWeight(.semibold)
                    .foregroundStyle(.silverChalice)
            }
            HStack {
                Text("Sprint Speed")
                    .fontWeight(.semibold)
                Spacer()
                Text(String(format: "%.2f", sprintSpeed))
                    .fontWeight(.semibold)
                    .foregroundStyle(.silverChalice)
            }
        }
        //        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blueCharcoal)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    var abilites: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Abilities")
                .fontWeight(.semibold)
                .foregroundStyle(.glacier)
                .font(.system(size: 20))
            Text("Passive")
                .fontWeight(.semibold)
                .foregroundStyle(.glacier)
                .font(.system(size: 18))
            Text(passive)
                .fontWeight(.semibold)
                .foregroundStyle(.silverChalice)
                .font(.system(size: 16))
            ForEach(ability, id: \.uniqueName) { ability in
                Text(ability.name)
                    .fontWeight(.semibold)
                    .foregroundStyle(.glacier)
                    .font(.system(size: 18))
                Text(ability.description)
                    .fontWeight(.semibold)
                    .foregroundStyle(.silverChalice)
                    .font(.system(size: 16))
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blueCharcoal)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    WarframeDetailView(shield: 150, armor: 145, health: 200, power: 300, sprintSpeed: 1.15, components: [Component(uniqueName: "",
                                              name: "",
                                              description: "",
                                              itemCount: 0,
                                              imageName: "",
                                              tradable: false,
                                              masterable: false,
                                              drops: [],
                                              type: .warframe,
                                              primeSellingPrice: 0,
                                              ducats: 0,
                                              damagePerShot: [],
                                              totalDamage: 0,
                                              criticalChance: 0,
                                              criticalMultiplier: 0,
                                              procChance: 0,
                                              fireRate: 0,
                                              masteryReq: 0,
                                              productCategory: .suits,
                                              slot: 0,
                                              accuracy: 0,
                                              omegaAttenuation: 0,
                                              noise: .none,
                                              trigger: .none,
                                              magazineSize: 0,
                                              reloadTime: 0,
                                              multishot: 0,
                                              damage: [:],
                                              attacks: [],
                                              marketCost: 0,
                                              bpCost: 0,
                                              polarities: [.madurai, .naramon],
                                              tags: [],
                                              wikiaThumbnail: "",
                                              wikiaUrl: "",
                                              disposition: 0,
                                              introduced: .none,
                                              releaseDate: "",
                                              vaulted: false,
                                              blockingAngle: 0,
                                              comboDuration: 0,
                                              followThrough: 0,
                                              range: 0,
                                              slamAttack: 0,
                                              slamRadialDamage: 0,
                                              slamRadius: 0,
                                              slideAttack: 0,
                                              heavyAttackDamage: 0,
                                              heavySlamAttack: 0, heavySlamRadialDamage: 0, heavySlamRadius: 0, windUp: 0, stancePolarity: .aura,
                                              vaultDate: "",
                                              estimatedVaultDate: "",   excludeFromCodex: false)], 
                       aura: ["naramon","naramon"],
                       ability: [Ability(uniqueName: "",
                                         name: "Noctus",
                                         description: "Open Noctua, Dante’s Exalted Tome, and unleash a tale of woe upon his enemies.")],
                       passive: "Noctua scans targets, recording information for your Codex. Status Chance increases by |CHANCE|% on fully scanned targets.")
}



struct AuraImageView: View {
    var aura: [String]
    
    var body: some View {
        HStack {
            ForEach(aura, id: \.self) { auraName in
                if let auraCase = Aura(rawValue: auraName) {
                    Image(auraCase.rawValue)
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
        }
    }
}

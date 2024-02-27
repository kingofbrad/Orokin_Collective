//
//  WeaponView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 23/02/2024.
//

import SwiftUI

struct WeaponView: View {
    let name: String
    let image: String
    let description: String
    let category: String
    let masteryReq:Int
    let accuracy: Double
    let fireRate: Double
    let criticalChance: Double
    let criticalMultiplier: Int
    
    @GestureState private var zoom = 1.0
    
    
    var body: some View {
        VStack() {
            AsyncImage(url: URL(string: image) ) { image in image.resizable() } placeholder: { Color.orange } .frame(width: 345, height: 220)
                .aspectRatio(contentMode: .fit)
                .scaleEffect(zoom)
                .gesture(
                    MagnifyGesture()
                        .updating($zoom) {
                            value, gestureState, transaction in
                            gestureState = value.magnification
                        }
                )
            
            Divider()
                .frame(height: 2)
                .overlay(.orange)
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment:.leading){
                    Text("\(description)")
                    
                    Divider()
                        .frame(height: 2)
                        .overlay(.orange)
                    ScrollViewWeapon(statType: masteryReq, statName: "Mastery Reg")
                    Text("\(category)")
                        .bold()
                    ScrollViewWeapon(statType: Int(accuracy), statName: "Accuracy")
                    ScrollViewWeapon(statType: Int(fireRate), statName: "Fire Rate")
                    HStack {
                        Text("Critical Chance")
                        Spacer()
                        Text("\(criticalChance)%")
                    }
                    HStack {
                        Text("Critical Multiplier")
                        Spacer()
                        Text("\(criticalMultiplier)x")
                    }
                    
                    
                }
            }
            
            Spacer()
            
        }
        .padding(.horizontal)
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                Text("\(name)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                    .bold()
                    .font(.title)
                    .textCase(.uppercase)
            }
        }
        
    }
}

struct ScrollViewWeapon: View {
    let statType: Int
    let statName: String
    
    var body: some View {
        HStack {
            Text(statName)
            Spacer()
            Text("\(statType)")
        }
    }
}



#Preview {
    NavigationStack {
        WeaponView(name: "Acceltra Prime", image: "", description: "Engage your enemies with deadly speed. This weapon reloads even faster when its wielder sprints, faster still with Gauss.", category: "", masteryReq: 14, accuracy: 23.53, fireRate: 10.00, criticalChance: 34.00, criticalMultiplier: 3 )
    }
    
}

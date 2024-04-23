//
//  SortieView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 06/04/2024.
//

import SwiftUI

enum SortieFaction: String, CaseIterable {
    case Grineer = "Grineer"
    case Corpus = "Corpus"
    case Murmur = "Murmur"
    case Currupted = "Currupted"
    case Infested = "Infested"
    case Sentient = "Sentient"
}

struct FactionImageView: View {
    let faction: SortieFaction
    var body: some View {
        Image(faction.rawValue)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
    }
}

struct SortieView: View {
    var nm :NetworkCall
    //    @State var image: SortieFaction = .Grineer
    var body: some View {
        VStack {
            if let sortieData = nm.worldState?.sortie {
                VStack(alignment: .leading) {
                    HStack{
                        FactionImageView(faction: SortieFaction(rawValue: sortieData.faction) ?? .Grineer)
                            .frame(width: 50, height: 50)
                        VStack(alignment: .leading) {
                            Text(sortieData.boss)
                                .font(.title)
                                .fontWeight(.semibold)
                            Text(sortieData.faction)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.silverChalice)
                        }
                        Spacer()
                        CountdownView(expiryDateString: sortieData.expiry)
                    }
                    .padding(.bottom, 10)
                    VStack(alignment: .leading ,spacing: 5) {
                        ForEach(sortieData.variants, id:\.node) { variant in
                            Text(variant.missionType)
                                .bold()
                            Text(variant.modifier)
                                .font(.subheadline)
                            Text(variant.node)
                                .font(.footnote)
                                .foregroundStyle(Color.silverChalice)
                        }
                    }
                }
                .padding(.horizontal, 10)
                .background(Color.blueCharcoal)
                
            }
        }
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity)
        .foregroundStyle(.white)
        .background(Color.blueCharcoal)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
        
        
    }
}

#Preview {
    SortieView(nm: NetworkCall())
}

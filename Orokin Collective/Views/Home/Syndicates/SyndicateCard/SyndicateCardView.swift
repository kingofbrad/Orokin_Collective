//
//  SyndicateCardView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 18/04/2024.
//

import SwiftUI

struct SyndicateCard: View {
    var faction: String
    let subHeadline: String
    var factionColor: Color
    var imageSize: CGSize
    var textColor: Color
    let season: Int
    let showTimer: Bool 
    let expiry: String
    let footNote: String
    
    
    var body: some View {
        
        VStack {
            HStack {
                ForEach(SyndicateSigil.allCases, id:\.rawValue) { image in
                    if image.rawValue == faction {
                        Image(faction)
                            .resizable()
                            .frame(width: imageSize.width, height: imageSize.height)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(faction)
                        .fontWeight(.semibold)
                        .font(.system(size: 18))
                        .foregroundStyle(textColor)
                    if !subHeadline.isEmpty {
                        Text(subHeadline)
                            .fontWeight(.semibold)
                            .font(.subheadline)
                            .foregroundStyle(.silverChalice)
                    } else {
                        VStack(alignment: .leading) {
                            Text("Season \(String(season))")
                                .fontWeight(.semibold)
                                .font(.subheadline)
                                .foregroundStyle(.silverChalice)
                            Text("Tap to view missions")
                                .fontWeight(.semibold)
                                .font(.footnote)
                                .foregroundStyle(.silverChalice)
                        }
                    }
                    if !footNote.isEmpty {
                        Text("")
                    }
                    
                }
                Spacer()
                if showTimer {
                    VoidTraderCountDownTimer(expiryDateString: expiry)
                }
               
            }
            
        }
        .frame(height: 80)
        .padding()
        .background(factionColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    
}

#Preview {
    SyndicateCard(faction: "Entrati",subHeadline: "Tap to view bounties", factionColor:.trout, imageSize: CGSize(width: 70, height: 63), textColor: .marigold, season: 11, showTimer: false, expiry: "", footNote: "")
        .foregroundStyle(.white)
}

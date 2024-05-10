//
//  CodexCard.swift
//  Orokin Collective
//
//  Created by Bradlee King on 09/05/2024.
//

import SwiftUI

struct CodexCard: View {
    let name: String
    let desc: String
    let imageURL: String
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                Spacer()
                Text(desc)
                    .fontWeight(.semibold)
                    .font(.system(size: 15))
            }
            Spacer()
            
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/wfcd/warframe-items/master/data/img/\(imageURL)") ) { image in image.resizable() } placeholder: { ProgressView() } .frame(width: 50, height: 50)
                .clipShape(Circle())
                .aspectRatio(contentMode: .fit)
        }
        .frame(height: 50)
        .padding()
        .background(Color.blueCharcoal)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
        
        
    }
}

#Preview {
    CodexCard(name: "Dante", desc: "Seeker of knowledge. Keeper of history. Daring researcher of Leverian lore. Dante composes arcane tales to support allies and devastate enemies.", imageURL: "dante.png")
}

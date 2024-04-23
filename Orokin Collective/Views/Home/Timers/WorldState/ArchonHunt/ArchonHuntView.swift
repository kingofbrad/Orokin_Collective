//
//  ArchonHuntView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 02/04/2024.
//

import SwiftUI

struct ArchonHuntView: View {
    var networkModel: NetworkCall
    
    var body: some View {
        VStack {
            if let archonData = networkModel.worldState?.archonHunt {
                VStack(alignment: .leading, spacing: 3) {
                    HStack{
                        Image("Narmer")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(10)
                        VStack(alignment: .leading) {
                            Text("\(archonData.boss)")
                                .font(.title)
                                .fontWeight(.semibold)
                            Text(archonData.faction)
                                .font(.subheadline)
                                .foregroundStyle(.silverChalice)
                        }
                        Spacer()
                        VoidTraderCountDownTimer(expiryDateString: archonData.expiry)
                            .padding(.trailing, 10)
                    }
                    
                    ForEach(archonData.missions, id:\.nodeKey) { missions in
                        HStack {
                            Text("\(missions.type)")
                                .fontWeight(.semibold)
                            Text("\(missions.node)")
                                .font(.footnote)
                                .foregroundStyle(Color.silverChalice)
                        }
                        
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 10)
                .background(Color.blueCharcoal)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
       
      
    }
}

#Preview {
    ArchonHuntView(networkModel: NetworkCall())
        .foregroundStyle(Color.white)
}

//
//  Baro Ki'Teer View.swift
//  Orokin Collective
//
//  Created by Bradlee King on 28/03/2024.
//

import SwiftUI

struct Baro_Ki_Teer_View: View {
    var body: some View {
        ZStack() {
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 346, height: 137)
            .background(
              Image("Baro Ki'Teer")
                .resizable()
                .scaledToFill()
            )
            .cornerRadius(10)
            .offset(x: 0, y: 0)
          Text("Baro Ki’Teer | Orcus Relay \n(Pluto)")
            .font(Font.custom("SF Pro Text", size: 14).weight(.semibold))
            .lineSpacing(1)
            .foregroundColor(.white)
            .offset(x: -76.50, y: 25.50)
          Text("Departs on Sunday, March 2024")
            .font(Font.custom("SF Pro Text", size: 11).weight(.semibold))
            .lineSpacing(22)
            .foregroundColor(Color(red: 0.65, green: 0.65, blue: 0.65))
            .offset(x: -76.50, y: 57.50)
        }
        .frame(width: 346, height: 137)
        
        
    }
}

#Preview {
    Baro_Ki_Teer_View()
}

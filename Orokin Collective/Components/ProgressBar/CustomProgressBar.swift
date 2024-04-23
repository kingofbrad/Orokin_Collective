//
//  CustomProgressBar.swift
//  Orokin Collective
//
//  Created by Bradlee King on 18/04/2024.
//

import SwiftUI

struct CustomProgressBar: View {
    let completion: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: geometry.size.width, height: 10)
                    .foregroundColor(Color.silverChalice.opacity(0.6))
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: geometry.size.width * CGFloat(completion) / 100, height: 10)
                    .foregroundColor(Color.husk)
            }
        }
        .frame(height: 20)
    }
}

#Preview {
    CustomProgressBar(completion: 30.0)
}

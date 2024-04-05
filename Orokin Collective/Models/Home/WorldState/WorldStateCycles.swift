//
//  WorldStateCycles.swift
//  Orokin Collective
//
//  Created by Bradlee King on 01/04/2024.
//

import SwiftUI

struct WorldStateCycles: View {
    @ObservedObject var networkModel = NetworkCall()
    
    var body: some View {
        
       Text("Fuck this shit")
        
    }
}

#Preview {
    WorldStateCycles()
}


struct WorldStateCyclesCard: View {
    var shortString: String
    var state: String
    var expiry: String
    
    var isStates: Bool
    var trueIcon: String
    var falseIcon: String
    
    var body: some View {
        VStack {
            HStack{
                withAnimation(.easeInOut(duration: 0.1)) {
                    Image(systemName: isStates ? "\(trueIcon)" : "\(falseIcon)")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(.trailing, 2)
                }
                
                    
                VStack(alignment: .leading, spacing: 2){
                    Text("Cetus")
                        .font(.system(size: 18))
                        .bold()
                    Text("\(shortString)")
                        .font(.system(size: 14))
                        .foregroundStyle(.silverChalice)
                    Text("\(state.capitalized)")
                        .font(.system(size: 14))
                        .foregroundStyle(.silverChalice)
                }
                Spacer()
                CountdownView(expiryDateString: expiry)
            }
            .padding(.horizontal)
            
        }
        .frame(width: 346, height: 73)
        .background(Color.blueCharcoal)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

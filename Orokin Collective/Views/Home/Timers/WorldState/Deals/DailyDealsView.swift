//
//  DailyDealsView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 16/04/2024.
//

import SwiftUI

struct DailyDealsView: View {
    var networkModel: NetworkCall
    
    private func calculatePercentage(oldValue: Double, newValue: Double) -> Double {
        guard oldValue != 0 else {
            return 0
        }
        
        return ((newValue - oldValue) / oldValue) * 100
    }
    var body: some View {
        VStack {
            
            Text("Daily Deals")
                .fontWeight(.semibold)
                .font(.system(size: 18))
            ForEach(networkModel.worldState?.dailyDeals ?? [], id: \.id) { item in

                VStack(alignment: .leading) {
                    Divider()
                        .frame(height: 1)
                        .foregroundStyle(.white)
                        .background(.white)
                    HStack {
                        Text(item.item)
                            .fontWeight(.bold)
                        Spacer()
                        
                        Spacer()
                        VoidTraderCountDownTimer(expiryDateString: item.expiry)
                    }
                    HStack {
                        HStack {
                            Text("Original Price:")
                                .fontWeight(.semibold)
                                .font(.system(size: 14))
                            Text("\(item.originalPrice)")
                                .foregroundStyle(.silverChalice)
                                .font(.system(size: 14))
                        }
                        HStack {
                            Text("Sale Price:")
                                .fontWeight(.semibold)
                                .font(.system(size: 14))
                            Text("\(item.salePrice)")
                                .foregroundStyle(.silverChalice)
                                .font(.system(size: 14))
                        }
 
                    }
                    HStack {
                        Text("Only")
                        Text("\(item.total - item.sold)")
                            .foregroundStyle(.silverChalice)
                        Text("Remaining")
                           
                    }
                    .fontWeight(.semibold)
                    .font(.system(size: 14))
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        
        .background(Color.blueCharcoal)
        .clipShape(RoundedRectangle(cornerRadius: 10))
      
    }
}

#Preview {
    DailyDealsView(networkModel: NetworkCall())
}

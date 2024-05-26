//
//  Baro Ki'Teer View.swift
//  Orokin Collective
//
//  Created by Bradlee King on 28/03/2024.
//

import SwiftUI


struct VoidTraderView: View {
    var nm: NetworkCall

    @State private var showInventory: Bool = false
    
    var body: some View {
        NavigationStack {
            if let voidTrader = nm.worldState?.voidTrader  {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Spacer()
                            Text(voidTrader.character)
                                .font(.system(size: 20, weight: .semibold))
                                
                            Text(voidTrader.location)
                                .font(.system(size: 15))
                                .foregroundStyle(.silverChalice)
                               
                            Spacer()
                            TimeRemainingTimer_Days_View(activation: voidTrader.activation, expiry: voidTrader.expiry)
                                .font(Font.custom("SF Pro Text", size: 15).weight(.semibold))
                                .foregroundColor(.silverChalice)
                           
                        }
                        .padding(.leading, 10)
                        .padding(.bottom,5)
                        
                        Spacer()
                    }
                    
                }
                .frame(height: 137)
                .background(
                    Image("Baro Ki'Teer")
                        .resizable()
                        .scaledToFill()
                        .shadow(radius: 5)
                        .overlay {
                            Color.black.opacity(0.3)
                        }
                    
                )
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundStyle(.white)
                .fullScreenCover(isPresented: $showInventory) {
                    NavigationStack {
                        VStack(spacing: 20) {
                            Image("Baro Ki'Teer")
                                .resizable()
                                .scaledToFill()
                               
                                .shadow(radius: 5)
                                .frame(height: 137)
                            
                                .ignoresSafeArea(.all)
                            
                            HStack {
                                VStack{
                                    Text(voidTrader.character)
                                        .font(.system(size: 20, weight: .semibold))
                                      
                                    Text(voidTrader.location)
                                        .font(.system(size: 15))
                                        .foregroundStyle(.silverChalice)
                                       
                                }
                                TimeRemainingTimer_Days_View(activation: voidTrader.activation, expiry: voidTrader.expiry)
                                    .font(Font.custom("SF Pro Text", size: 15).weight(.semibold))
                                    .foregroundColor(.silverChalice)
                                   
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Inventory")
                                    .font(.system(size: 18, weight: .semibold))
                                ScrollView(.vertical) {
                                    ForEach(voidTrader.inventory, id: \.uniqueName) { item in
                                        VStack(alignment: .leading)
                                        {
                                            Text(item.item)
                                            HStack {
                                                HStack {
                                                    Text("Credits |")
                                                        .font(.system(size: 15))
                                                    
                                                    Text("\(item.credits ?? 0)")
                                                        .font(.system(size: 15))
                                                        .foregroundStyle(.silverChalice)
                                                }
                                                HStack {
                                                    Text("Ducats |")
                                                        .font(.system(size: 15))
                                                    
                                                    Text("\(item.ducats ?? 0)")
                                                        .font(.system(size: 15))
                                                        .foregroundStyle(.silverChalice)
                                                }
                                            }
                                            Divider()
                                                .frame(minHeight: 2)
                                                .overlay(Color.blue)
                                                .padding(.horizontal, 20)
                                        }
                                        
                                        .frame(maxWidth:.infinity ,alignment: .leading)
                                    }
                                    Spacer()
                                }
                            }
                            .padding(.horizontal, 10)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(
                            LinearGradient(colors: [.affair, .mirage], startPoint: .top, endPoint: .bottom)
                        )
                        .toolbar {
                            ToolbarItem(placement: .confirmationAction){
                                Button {
                                    showInventory = false
                                } label: {
                                    Image(systemName: "xmark")
                                        .foregroundStyle(Color.white)
                                }
                                
                            }
                        }
                    }
                    
                }
                
            }
        }
        
        .onTapGesture{
            withAnimation{
                if !(nm.worldState?.voidTrader.inventory.isEmpty ?? false) {
                    showInventory = true
                }
            }
            
        }
        
    }
}

#Preview(body: {
    VoidTraderView(nm: NetworkCall())
})


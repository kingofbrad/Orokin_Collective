//
//  Baro Ki'Teer View.swift
//  Orokin Collective
//
//  Created by Bradlee King on 28/03/2024.
//

import SwiftUI


struct VoidTraderView: View {
    @ObservedObject private var nm = NetworkCall()

    @State private var showInventory: Bool = false
    
    var dummyArray: [Inventory] =
    [
        Inventory(uniqueName: "ivara in action glyph", item: "Ivara in Action Glyph", ducats: 75 , credits: 60000),
        Inventory(uniqueName: "voltaic strike", item: "Voltaic Strike", ducats: 300 , credits: 150000),
        Inventory(uniqueName: "primed smite grineer", item: "Primed Smite Grineer", ducats: 350 , credits: 140000),
        Inventory(uniqueName: "thermite rounds", item: "Thermite Rounds", ducats: 300 , credits: 150000),
    ]
    
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
                                    ForEach(dummyArray, id: \.uniqueName) { item in
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
        .task {
            do {
                try await nm.fetchWorldState()
            } catch APIError.invalidURL {
                print("invalid URL")
            } catch APIError.invaildResponse {
                print("invaild Response")
            } catch APIError.invalidData {
                print("invaild Data")
            } catch {
                print("Unexcepted Error has appeared \(error)")
            }
        }
    }
}

#Preview(body: {
    VoidTraderView()
})

struct VoidTraderInventory: View {
    var voidTrader: Trader
    @Namespace var nameSpace
    
    var dummyArray: [Inventory] =
    [
        Inventory(uniqueName: "ivara in action glyph", item: "Ivara in Action Glyph", ducats: 75 , credits: 60000),
        Inventory(uniqueName: "voltaic strike", item: "Voltaic Strike", ducats: 300 , credits: 150000),
        Inventory(uniqueName: "primed smite grineer", item: "Primed Smite Grineer", ducats: 350 , credits: 140000),
        Inventory(uniqueName: "thermite rounds", item: "Thermite Rounds", ducats: 300 , credits: 150000),
    ]
    
    
    var body: some View {
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
                        .matchedGeometryEffect(id: "character", in: nameSpace)
                    Text(voidTrader.location)
                        .font(.system(size: 15))
                        .foregroundStyle(.silverChalice)
                        .matchedGeometryEffect(id: "location", in: nameSpace)
                }
                TimeRemainingTimer_Days_View(activation: voidTrader.activation, expiry: voidTrader.expiry)
                    .font(Font.custom("SF Pro Text", size: 15).weight(.semibold))
                    .foregroundColor(.silverChalice)
            }
            
            VStack(alignment: .leading) {
                Text("Inventory")
                    .font(.system(size: 18, weight: .semibold))
                ScrollView(.vertical) {
                    ForEach(dummyArray, id: \.uniqueName) { item in
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
    }
}




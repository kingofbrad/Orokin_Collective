//
//  DashBoardView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 12/03/2024.
//

import SwiftUI

struct CardView: View, Hashable {
    var name: String
    var expiryDate: String
    var description: String

    var body: some View {
        VStack {
            Text(name)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .padding(.top, 10)
            
            Text("\(expiryDate)")
                .foregroundColor(.gray)
            
            Divider()
            
            Text(description)
                .padding()
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Spacer()
        }
        .frame(height: 100)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
    }
}



struct DashBoardView: View {
    
    @State private var openSheet: Bool = false
    let array =
    [
        CardView(name: "Arbitration", expiryDate: "Corpus", description: "Excavation"),
        CardView(name: "Arbitration", expiryDate: "Corpus", description: "Excavation"),
        CardView(name: "Arbitration", expiryDate: "Corpus", description: "Excavation"),
    ]
    
    let weaponArray = 
    [
        CardView(name: "Acceltra Prime", expiryDate: "Primary", description: "Main primary of Gauss Prime"),
        CardView(name: "Arbitration", expiryDate: "Corpus", description: "Excavation"),
        CardView(name: "Arbitration", expiryDate: "Corpus", description: "Excavation"),
    ]
    
    var body: some View {
        NavigationStack {
            VStack(alignment:.leading) {
                
                Text("Alerts")
                    .bold()
                    .font(.system(size: 20))
                    .padding()
                    
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(array, id:\.self) {array in
                            CardView(name: array.name, expiryDate: array.expiryDate, description: array.description)
                        }
                    }
                    
                    
                }
                HStack {
                    Text("Weapons")
                        .font(.headline)
                    Spacer()
                    Button(action: {openSheet = true}, label: {
                        Text("View All")
                    })
                }
                .padding()
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(weaponArray, id:\.self) {array in
                            CardView(name: array.name, expiryDate: array.expiryDate, description: array.description)
                        }
                    }
                    
                    
                }
                Spacer()
            }
            .sheet(isPresented: $openSheet, content: {
                WeaponsListView()
            })
            .navigationTitle("Dashboard")
          
        }
    }
}

#Preview {
    DashBoardView()
}

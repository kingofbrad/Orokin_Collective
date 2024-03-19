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
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    @State private var openSheet: Bool = false
    
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment:.leading) {
                
                Text("World State")
                    .bold()
                    .font(.system(size: 20))
                    .padding()
                
                ScrollView(.horizontal) {
                    HStack {
                        CetusCycleView()
                        OrbVallisCycleView()
                        CambionCycleView()
                    }
                    
                    
                }
                HStack {
                    Text("Missons")
                        .font(.headline)
                    Spacer()
                    Button(action: {openSheet = true}, label: {
                        Text("View All")
                    })
                }
                .padding()
                MissionScrollView()
                
                
                Spacer()
            }
            .background(
                Image("Vitruvian")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea(.all)
                
            )
            
        }
        
        .navigationTitle("Home")
        .foregroundStyle(Color.white)
        
        
    }
}


#Preview {
    DashBoardView()
}

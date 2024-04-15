//
//  SortieView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 06/04/2024.
//

import SwiftUI

enum SortieFaction: String, CaseIterable {
    case Grineer = "Grineer"
    case Corpus = "Corpus"
    case Murmur = "Murmur"
    case Currupted = "Currupted"
    case Infested = "Infested"
}

struct SortieView: View {
    @ObservedObject private var nm = NetworkCall()
//    @State var image: SortieFaction = .Grineer
    var body: some View {
        VStack {
            if let sortieData = nm.worldState?.sortie {
                ForEach(SortieFaction.allCases, id:\.rawValue) { sortieImage in
                    Image(sortieData.factionKey == sortieImage.rawValue ? sortieImage.rawValue : "")
                }
                VStack(alignment: .leading) {
                    
                }
                .frame(height: 159)
                .background(Color.blueCharcoal)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .background(Color.blueCharcoal)
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

#Preview {
    SortieView()
}

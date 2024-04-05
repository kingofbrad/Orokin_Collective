//
//  TestingFile.swift
//  Orokin Collective
//
//  Created by Bradlee King on 08/03/2024.
//

import SwiftUI










struct TestingFile: View {
    let expiryDate: Date
        
        init() {
            let dateString = "2024-04-07T13:00:00.000Z"
            let dateFormatter = ISO8601DateFormatter()
            if let date = dateFormatter.date(from: dateString) {
                expiryDate = date
            } else {
                // Fallback to current date if conversion fails
                expiryDate = Date()
            }
        }
        
        var body: some View {
            VStack {
                
            }
        }
}

#Preview {
    TestingFile()
}

















enum WarframeFaction: String {
    case naramon = "Naramon"
    case madurai = "Madurai"
    // Add more factions as needed
    
    var imageURL: URL {
        switch self {
        case .naramon:
            return URL(string: "https://static.wikia.nocookie.net/warframe/images/6/60/Naramon_Pol.svg/revision/latest?cb=20220203080356")!
        case .madurai:
            return URL(string: "https://static.wikia.nocookie.net/warframe/images/b/b2/Madurai_Pol.svg/revision/latest?cb=20220203074907")!
        // Add more cases as needed
        }
    }
}

struct WarframeFactionView: View {
    let factionArray = ["Naramon", "Madurai", "AnotherFaction"] // Add more factions as needed
    let factions: [String]
    
    var body: some View {
        VStack {
            ForEach(factions, id: \.self) { factionName in
                HStack {
                    Text(factionName)
                        .padding(.leading, 16)
                    Spacer()
                    if let faction = WarframeFaction(rawValue: factionName) {
                        AsyncImage(url: faction.imageURL) { phase in
                            switch phase {
                            case .empty:
                                Image(systemName: "photo")
                                    .frame(width: 30, height: 30)
                                    .padding(.trailing, 16)
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                    .padding(.trailing, 16)
                            case .failure:
                                Image(systemName: "exclamationmark.triangle")
                                    .frame(width: 30, height: 30)
                                    .padding(.trailing, 16)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }
                }
                .padding(.vertical, 8)
            }
        }
    }
}







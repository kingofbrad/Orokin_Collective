//
//  TestingFile.swift
//  Orokin Collective
//
//  Created by Bradlee King on 08/03/2024.
//

import SwiftUI










struct TestingFile: View {
    @StateObject var networkModel = NetworkCall()
    @State private var isSearching: String = ""
    @State private var filteredTargets: [Synthtarget] = []
    
 
    
    
    var body: some View {
        VStack {
            
        }
    }
}

#Preview {
    TestingFile()
}






struct WarframeUIView: View {
    let attackerReward: Reward
    let defenderReward: Reward
    let completion: Double
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Spacer()
                Text("VS")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Spacer()
            }
            .padding()
            .background(Color("WarframePrimary"))
            .cornerRadius(8)
            
            HStack {
                RewardView(reward: attackerReward)
                Spacer()
                Text("vs")
                    .foregroundColor(Color.white)
                    .padding(.horizontal)
                Spacer()
                RewardView(reward: defenderReward)
            }
            
            ProgressView(value: completion, total: 100)
                .progressViewStyle(WarframeProgressViewStyle())
                .foregroundColor(Color("WarframeAccent"))
            
            Text(String(format: "%.2f%%", completion))
                .foregroundColor(Color("WarframePrimary"))
                .padding(.top, 5)
        }
        .padding()
        .background(Color("WarframeBackground"))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct RewardView: View {
    let reward: Reward
    
    var body: some View {
        VStack {
            if let thumbnailURL = URL(string: reward.thumbnail) {
                AsyncImage(url: thumbnailURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Color.gray
                        .frame(width: 50, height: 50)
                }
            } else {
                Color.gray
                    .frame(width: 50, height: 50)
            }
            Text(reward.asString)
                .font(.caption)
                .foregroundColor(Color.white)
        }
    }
}

struct WarframeProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 10)
                    .foregroundColor(Color.gray.opacity(0.5))
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: (configuration.fractionCompleted ?? 0.0) * UIScreen.main.bounds.width, height: 10)
                    .foregroundColor(Color("WarframeAccent"))
            }
        }
        .frame(height: 10)
    }
}





// Example Usage


















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







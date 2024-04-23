import SwiftUI

enum Standing: String, CaseIterable {
    case ostronsStanding
    case solarisStanding
    case entratiStanding
    case nightwaveStanding
    
}


struct CustomAccordion: View {
    let title: String
    let faction: String
    let factionColor: Color
    let textColor: Color
    let enemyLevel: [Int]
    let standingStages: [Int]
    let content: () -> AnyView // Use AnyView to allow any type of content
    
    
    // MARK: - information
    
    
    
    // MARK: - Colours
    
    
    var totalStanding: Int {
        return standingStages.reduce(0, +)
        
    }
    var enemyLevelString: String {
        return enemyLevel.map { String($0) }.joined(separator: " - ")
    }
    
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button(action: {
                withAnimation {
                    self.isExpanded.toggle()
                }
            }) {
                VStack(spacing: 0) {
                    HStack {
                        VStack(alignment: .leading){
                            Text(title)
                                .fontWeight(.semibold)
                                .font(.system(size: 18))
                                .foregroundStyle(textColor)
                            Text("Level: \(enemyLevelString)")
                                .fontWeight(.semibold)
                                .font(.subheadline)
                                .foregroundStyle(.silverChalice)
                        }
                        Spacer()
                        HStack {
                            Text("\(totalStanding)")
                                .fontWeight(.semibold)
                                .foregroundStyle(.silverChalice)
                            if let standing = SyndicateSigil(rawValue: faction) {
                                switch standing {
                                case .Ostrons:
                                    Image("ostronsStanding")
                                case .Solaris_United:
                                    Image("solarisStanding")
                                case .Entrati:
                                    Image("entratiStanding")
                                case.Nightwave:
                                    Image("nightwaveStanding")
                                case .Simaris:
                                    Image("")
                                }
                            }
                            
                            
                        }
                    }
                }
                .frame(height: 55)
                .padding()
                .background(factionColor.overlay(content: {
                    if isExpanded {
                        Color.black.opacity(0.4)
                    } else {
                        Color.black.opacity(0.2)
                    }
                    
                }))
                .clipShape(isExpanded ? UnevenRoundedRectangle(cornerRadii: .init(topLeading: 10, bottomLeading:0, bottomTrailing: 0, topTrailing: 10)) : UnevenRoundedRectangle(cornerRadii: .init(topLeading: 10, bottomLeading:10, bottomTrailing: 10, topTrailing: 10)))
                .padding(.horizontal, 10)
                
            }
            
            if isExpanded {
                content()
                    .transition(.opacity)
                    .background(factionColor.overlay(content: {
                        Color.black.opacity(0.2)
                    }))
                    .frame(maxWidth:.infinity)
                    .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0, bottomLeading: 10, bottomTrailing: 10, topTrailing: 0)))
                    .padding(.horizontal, 10)
                    
                    
            }
            
        }
    }
}

//
//  ZarimanView().swift
//  Orokin Collective
//
//  Created by Bradlee King on 02/04/2024.
//

import SwiftUI

struct ZarimanView: View {
    @ObservedObject var networkModel = NetworkCall()
    
    var body: some View {
        VStack {
            if let zarimanData = networkModel.worldState?.zarimanCycle {
                VStack {
                    HStack{
                        
                            Image(zarimanData.isCorpus ?? true ? "Corpus" : "Grineer")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding(.trailing, 2)
                        
                        VStack(alignment: .leading, spacing: 2){
                            Text("Zariman")
                                .font(.system(size: 18))
                                .bold()
                            Text("\(zarimanData.timeLeft)")
                                .font(.system(size: 14))
                                .foregroundStyle(.silverChalice)
                            Text("\(zarimanData.state.capitalized)")
                                .font(.system(size: 14))
                                .foregroundStyle(.silverChalice)
                        }
                        Spacer()
                        CountdownView(expiryDateString: zarimanData.expiry)
                    }
                    .padding(.horizontal)
                    
                }
                .frame(width: 346, height: 73)
                .background(Color.blueCharcoal)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                Text("Loading...")
            }
        }
        .task {
            do {
                try await networkModel.fetchWorldState()
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
    ZarimanView()
}

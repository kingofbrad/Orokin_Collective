//
//  AlertsView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 10/03/2024.
//

import SwiftUI

struct AlertsView: View {
    @ObservedObject var vm = AlertsViewModel()
    
    
    
    var body: some View {
        VStack {
            List(vm.alerts) { alerts in
                HStack(alignment: .center) {
                    AsyncImage(url: URL(string: alerts.mission.reward.thumbnail) ) { image in image.resizable() } placeholder: { Color.gray }
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .padding(.all, 20)
                    VStack(alignment: .leading) {
                        Text(alerts.mission.node)
                            .font(.system(size: 16, weight: .bold, design: .default))
                            .foregroundColor(.white)
                        Text(alerts.mission.faction)
                            .font(.system(size: 14, weight: .bold, design: .default))
                            .foregroundColor(.gray)
                    }.padding(.trailing, 20)
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(red: 32/255, green: 36/255, blue: 38/255))
               
                .padding(.all, 10)
            }
            Text("HI")
        }
        .task {
            do {
                try await vm.fetchAlertsData()
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
    AlertsView()
}




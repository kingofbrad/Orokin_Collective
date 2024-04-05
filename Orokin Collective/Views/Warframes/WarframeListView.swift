////
////  WarframeListView.swift
////  Orokin Collective
////
////  Created by Bradlee King on 10/03/2024.
////
//
//import SwiftUI
//
//struct WarframeListView: View {
//    @ObservedObject private var networkModel = NetworkCall()
//    @State private var searchText = ""
//    @State private var filteredWarframes: [Warframes] = []
//    
//    private func performSearch(keyword: String) {
//        filteredWarframes = networkModel.warframe.filter { warframe in
//            warframe.name.contains(keyword)
//        }
//    }
//    
//    private var warframes: [Warframes] {
//        filteredWarframes.isEmpty ? networkModel.warframe : filteredWarframes
//    }
//    
//    
//    var body: some View {
//        NavigationStack {
//            List(warframes, id:\.name) { warframes in
//                NavigationLink {
//                    VStack {
//                        Text(warframes.name)
//                        Text(warframes.description)
//                    }
//                } label: {
//                    Text(warframes.name)
//                }
//            }
//            .listStyle(.plain)
//            .navigationTitle("Warframes")
//            .searchable(text: $searchText)
//            .onChange(of: searchText, perform: performSearch )
//            .overlay {
//                if networkModel.warframe.isEmpty {
//                    Text("Loading...")
//                }
//            }
//        }
//        .task {
//            do {
//                try await networkModel.fetchWarframesData()
//            } catch APIError.invalidURL {
//                print("invalid URL")
//            } catch APIError.invaildResponse {
//                print("invaild Response")
//            } catch APIError.invalidData {
//                print("invaild Data")
//            } catch {
//                print("Unexcepted Error has appeared \(error)")
//            }
//        }
//        .refreshable {
//            do {
//                try await networkModel.fetchWarframesData()
//            } catch APIError.invalidURL {
//                print("invalid URL")
//            } catch APIError.invaildResponse {
//                print("invaild Response")
//            } catch APIError.invalidData {
//                print("invaild Data")
//            } catch {
//                print("Unexcepted Error has appeared \(error)")
//            }
//        }
//    }
//}
//
//#Preview {
//    WarframeListView()
//}

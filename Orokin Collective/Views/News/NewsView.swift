//
//  NewsView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 28/03/2024.
//

import SwiftUI

struct NewsView: View {
    @StateObject var networkModel = NetworkCall()
    @State private var imageOpacity: Double = 0.0 // Declare opacity as a @State property
    var body: some View {
        VStack {
            ScrollView {
                ForEach(networkModel.worldState?.news.reversed() ?? [], id: \.id) { news in
                    Link(destination: URL(string: news.link)!, label: {
                        ZStack {
                            withAnimation(.easeIn(duration:0.5)) { // Wrap AsyncImage in a withAnimation block
                                ZStack {
                                    AsyncImage(url: URL(string: news.imageLink)) { image in
                                        image
                                            .resizable()
                                            .opacity(imageOpacity)
                                            .overlay {
                                                Color.black.opacity(0.5)
                                            }
                                            
                                    } placeholder: {
                                        Image("news-placeholder")
                                            .resizable()
                                            .overlay {
                                                Color.black.opacity(0.5)
                                            }
                                        
                                    }
                                    .frame(height: 180)
                                .opacity(imageOpacity)
                                } // Apply opacity directly to AsyncImage
                            }
                            .onAppear {
                                // Animate opacity to 1 when the image appears
                                withAnimation(.easeIn(duration: 0.5)) {
                                    imageOpacity = 1.0
                                }
                            }
                            
                            HStack {
                                VStack(alignment: .leading){
                                    Spacer()
                                    Text(news.message)
                                    ExpiryDateView(apiDateString: news.date)
                                        .font(.system(size: 15))
                                        .foregroundStyle(Color.silverChalice)
                                }
                                .padding()
                                Spacer()
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                }
            }
            .padding(.horizontal, 10)
        }
        .foregroundStyle(Color.white)
        .background(Color.blackPearl)
        .task {
            do {
                try await networkModel.fetchWorldState()
            } catch APIError.invalidURL {
                print("invalid URL")
            } catch APIError.invaildClientResponse {
                print("invaild Client Response")
                networkModel.showError = true
            } catch APIError.invalidData {
                print("invaild Data")
            } catch APIError.invaildServerResponse {
                print("invaild Server Response")
            } catch {
                print("Unexcepted Error has appeared \(error)")
            }
        }
        .refreshable {
            do {
                try await networkModel.fetchWorldState()
            } catch APIError.invalidURL {
                print("invalid URL")
            } catch APIError.invaildClientResponse {
                print("invaild Client Response")
                networkModel.showError = true
            } catch APIError.invalidData {
                print("invaild Data")
            } catch APIError.invaildServerResponse {
                print("invaild Server Response")
            } catch {
                print("Unexcepted Error has appeared \(error)")
            }
        }
    }
}

#Preview {
    NewsView(networkModel: NetworkCall())
}

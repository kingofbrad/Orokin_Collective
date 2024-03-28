//
//  NewsView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 28/03/2024.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        VStack {
            Text("News Views")
        }
        .foregroundStyle(Color.white)
        .background(
            Image("VitruvianLn")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
        )
    }
}

#Preview {
    NewsView()
}

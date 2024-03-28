//
//  CodexView.swift
//  Orokin Collective
//
//  Created by Bradlee King on 28/03/2024.
//

import SwiftUI

struct CodexView: View {
    var body: some View {
        VStack {
            Text("Codex View")
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
    CodexView()
}

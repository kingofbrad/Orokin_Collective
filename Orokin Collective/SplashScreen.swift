//
//  SplashScreen.swift
//  Orokin Collective
//
//  Created by Bradlee King on 09/04/2024.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
      AnimatedSplashScreen()
    }
}

#Preview {
    SplashScreen()
}

struct LoadingView: View {
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            ForEach(0..<12) { index in
                Capsule()
                    .fill(Color.blue)
                    .frame(width: 15, height: 60)
                    .rotationEffect(.degrees(Double(index) * 30))
                    .offset(y: 75)
                    .opacity(isLoading ? 1 : 0)
                    .animation(Animation.linear(duration: 0.8).repeatForever().delay(Double(index) * 0.1))
            }
        }
        .onAppear {
            self.isLoading = true
        }
    }
}

struct PulsatingStrokes: View {
    @State private var isExpanding = false
    
    var body: some View {
        ZStack {
            ForEach(0..<3) { index in
                let scale: CGFloat = CGFloat(index + 1) * 0.1
                Rectangle()
                    .stroke(Color.blue, lineWidth: 5)
                    .frame(width: 50 * CGFloat(index + 1), height: 50 * CGFloat(index + 1))
                    .rotationEffect(.degrees(self.isExpanding ? 0 : 90))
                    .scaleEffect(self.isExpanding ? 1 : scale)
                    .offset(x: self.isExpanding ? 0 : CGFloat(index - 1) * 30)
            }
        }
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 2)) {
                self.isExpanding.toggle()
            }
        }
    }
}
struct AnimatedSplashScreen: View {
    @State private var animate = false
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            Image(systemName: "person")
                .resizable()
                .foregroundColor(.white)
                .frame(width: animate ? 200 : 100, height: animate ? 200 : 100)
                .scaleEffect(animate ? 1 : 0.5)
                .animation(Animation.easeInOut(duration: 1))
                .onAppear {
                    self.animate.toggle()
                }
        }
    }
}

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

struct AnimatedSplashScreen: View {
    @State private var isAnimating = false
    @State private var animationProgress: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.blackPearl
                    .ignoresSafeArea()
                
                MyIcon()
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 200, height: 200)
                    .animatedShape(sizeFactor: isAnimating ? 2.0 : 1.0, rotationAngle: isAnimating ? 45 : 0)
                    .onAppear {
                        withAnimation(Animation.linear(duration: 2).repeatForever()) {
                            self.isAnimating.toggle()
                        }
                    }
            }
        }
    }
}
    
struct MyIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.00105*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0.49951*width, y: 0.00158*height))
        path.addLine(to: CGPoint(x: 0.99797*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0.49951*width, y: 0.99842*height))
        path.addLine(to: CGPoint(x: 0.00105*width, y: 0.5*height))
        path.move(to: CGPoint(x: 0.2234*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.22368*height))
        path.addLine(to: CGPoint(x: 0.7766*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.77632*height))
        path.addLine(to: CGPoint(x: 0.2234*width, y: 0.5*height))
        path.move(to: CGPoint(x: 0.2234*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.22368*height))
        path.addLine(to: CGPoint(x: 0.7766*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.77632*height))
        path.addLine(to: CGPoint(x: 0.2234*width, y: 0.5*height))
        path.move(to: CGPoint(x: 0.2234*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.22368*height))
        path.addLine(to: CGPoint(x: 0.7766*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.77632*height))
        path.addLine(to: CGPoint(x: 0.2234*width, y: 0.5*height))
        path.move(to: CGPoint(x: 0.00099*width, y: 0.5*height))
        path.addCurve(to: CGPoint(x: 0.31944*width, y: 0.59722*height), control1: CGPoint(x: 0.00099*width, y: 0.5*height), control2: CGPoint(x: 0.04167*width, y: 0.875*height))
        path.addLine(to: CGPoint(x: 0.59722*width, y: 0.31944*height))
        path.addCurve(to: CGPoint(x: 0.99804*width, y: 0.5*height), control1: CGPoint(x: 0.875*width, y: 0.04167*height), control2: CGPoint(x: 0.99804*width, y: 0.5*height))
        path.move(to: CGPoint(x: 0.00099*width, y: 0.5*height))
        path.addCurve(to: CGPoint(x: 0.34722*width, y: 0.625*height), control1: CGPoint(x: 0.00099*width, y: 0.5*height), control2: CGPoint(x: 0.06944*width, y: 0.90278*height))
        path.addLine(to: CGPoint(x: 0.625*width, y: 0.34722*height))
        path.addCurve(to: CGPoint(x: 0.99804*width, y: 0.5*height), control1: CGPoint(x: 0.90278*width, y: 0.06944*height), control2: CGPoint(x: 0.99804*width, y: 0.5*height))
        path.move(to: CGPoint(x: 0.99804*width, y: 0.5*height))
        path.addCurve(to: CGPoint(x: 0.65278*width, y: 0.375*height), control1: CGPoint(x: 0.99804*width, y: 0.5*height), control2: CGPoint(x: 0.93056*width, y: 0.09722*height))
        path.addLine(to: CGPoint(x: 0.375*width, y: 0.65278*height))
        path.addCurve(to: CGPoint(x: 0.00099*width, y: 0.5*height), control1: CGPoint(x: 0.09722*width, y: 0.93056*height), control2: CGPoint(x: 0.00099*width, y: 0.5*height))
        path.move(to: CGPoint(x: 0.99804*width, y: 0.5*height))
        path.addCurve(to: CGPoint(x: 0.68056*width, y: 0.40278*height), control1: CGPoint(x: 0.99804*width, y: 0.5*height), control2: CGPoint(x: 0.95833*width, y: 0.125*height))
        path.addLine(to: CGPoint(x: 0.40278*width, y: 0.68056*height))
        path.addCurve(to: CGPoint(x: 0.00099*width, y: 0.5*height), control1: CGPoint(x: 0.125*width, y: 0.95833*height), control2: CGPoint(x: 0.00099*width, y: 0.5*height))
        return path
    }
}

struct AnimatedShapeModifier: AnimatableModifier {
    var sizeFactor: CGFloat
    var rotationAngle: CGFloat

    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { AnimatablePair(sizeFactor, rotationAngle) }
        set {
            sizeFactor = newValue.first
            rotationAngle = newValue.second
        }
    }

    func body(content: Content) -> some View {
        content
            .scaleEffect(sizeFactor)
            .rotationEffect(Angle(degrees: Double(rotationAngle)))
    }
}

extension View {
    func animatedShape(sizeFactor: CGFloat, rotationAngle: CGFloat) -> some View {
        self.modifier(AnimatedShapeModifier(sizeFactor: sizeFactor, rotationAngle: rotationAngle))
    }
}



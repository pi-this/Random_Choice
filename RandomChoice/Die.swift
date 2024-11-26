//
//  Die.swift
//  RandomChoice
//
//  Created by Wesley Chastain on 11/25/24.
//

import SwiftUI

struct ShakeEffect: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit: CGFloat = 3
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform { ProjectionTransform(CGAffineTransform(translationX: amount * sin(animatableData * .pi * shakesPerUnit), y: 0))
    }
}

struct PointedBubble: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let cornerRadius: CGFloat = 10
        let pointerSize: CGFloat = 20
        
        // Create the main rounded rectangle
        path.addRoundedRect(in: CGRect(x: 0, y: 0, width: rect.width, height: rect.height - pointerSize), cornerSize: CGSize(width: cornerRadius, height: cornerRadius))
        
        // Add the pointer
        path.move(to: CGPoint(x: rect.width / 2 - 3 - pointerSize / 2, y: rect.height - pointerSize + 5))
        path.addLine(to: CGPoint(x: rect.width / 2, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width / 2 + 3 + pointerSize / 2, y: rect.height - pointerSize + 5))
        
        return path
    }
}


struct Die: View {
    @Environment(\.colorScheme) var colorScheme
    @State var number = 0
    @EnvironmentObject var rotation: RotationViewModel
    @State var swipeUp: Int = 0
    @State var numRotate = 0
    @State var hideInstructions: Bool = false
    @State private var shakes: CGFloat = 0
    @State var bounce = false
    
    var body: some View {
        VStack {
            
            
            if !hideInstructions {
                Text("Tap to Roll")
                    .font(.title2)
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                    .padding()
                    .offset(y: -10)
                    .frame(width: 140, height: 70)
                    .background(PointedBubble().fill(Color.blue))
                    .overlay(PointedBubble().stroke(Color.blue, lineWidth: 2))
                    .offset(y: bounce ? 10 : 20)
                    .animation(
                        Animation
                            .easeInOut(duration: 0.5)
                            .repeatForever(autoreverses: true),
                        value: bounce
                    )
                    .onAppear {
                        bounce = true
                    }
                    .onTapGesture {
                        withAnimation {
                            hideInstructions = true
                        }
                    }
            }
            
            
            
            
            
            ZStack {

                VStack {
                    
                    Image(systemName: number == 1 ? "die.face.1" : number == 2 ? "die.face.2" : number == 3 ? "die.face.3" : number == 4 ? "die.face.4" : number == 5 ? "die.face.5" : number == 6 ? "die.face.6" : "r.square")
                        .font(.system(size: 100))
                }
            }
            .onTapGesture {
                hideInstructions = true
                
                withAnimation {
                    self.shakes += CGFloat(Int.random(in: 1...3)) // Trigger the shake animation
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                {
                    withAnimation
                    {
                        number = Int.random(in: 1...6)
                        rotation.rotation += Double(360*Double.random(in: 0.5...2))
                        numRotate += 360*Int.random(in: 1...3)
                    }
                }
            }
            .font(.largeTitle)
            .modifier(ShakeEffect(animatableData: shakes))
            .rotationEffect(Angle(degrees: rotation.rotation))
            .animation(.easeInOut(duration: 1), value: rotation.rotation)
            .padding()
            
        }
        
    }
}

#Preview {
    Die()
        .environmentObject(RotationViewModel())
}

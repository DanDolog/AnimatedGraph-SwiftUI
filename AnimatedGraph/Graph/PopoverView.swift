//
//  PopoverView.swift
//  AnimatedGraph
//
//  Created by Dan Dolog on 14.04.2021.
//

import SwiftUI

struct PopoverView: View {
    @State var animToggle = false
    let title: String
    let color: Color
    let offset: CGFloat
    let delay: Double
    
    var body: some View {
        ZStack(alignment: .center) {
            PopoverShape()
                .fill(color)
                .frame(width: 60, height: 50)
            
            Text(title)
                .font(.system(size: 15, weight: .bold, design: .rounded))
                .offset(x: 0, y: -6)
                .multilineTextAlignment(.center)
        }
        .offset(y: animToggle ? 0 : offset)
        .opacity(animToggle ? 1 : 0)
        .onAppear {
            withAnimation(Animation.interpolatingSpring(mass: 0.1, stiffness: 10, damping: 1.2, initialVelocity: 10).delay(delay)) {
                self.animToggle.toggle()
            }
        }
    }
}

struct PopoverShape: Shape {
    private let heightPoint: CGFloat = 14
    private let widthPoint: CGFloat = 14
    private let cornerRadius: CGFloat = 10
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRoundedRect(
            in: CGRect(x: rect.minX, y: rect.minY, width: rect.width, height: rect.height - heightPoint),
            cornerSize: CGSize(width: cornerRadius, height: cornerRadius),
            style: .continuous
        )
        
        path.move(to: CGPoint(x: (rect.width/2) - (widthPoint/2), y: (rect.height) - heightPoint))
        path.addQuadCurve(
            to: CGPoint(x: (rect.width/2) + (widthPoint/2), y: (rect.height) - heightPoint),
            control: CGPoint(x: rect.width/2, y: rect.height)
        )
        
        return path
    }
}

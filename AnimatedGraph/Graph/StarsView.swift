//
//  StarsView.swift
//  AnimatedGraph
//
//  Created by Dan Dolog on 14.04.2021.
//

import SwiftUI

struct StarsView: View {
    @State var animFirstStarToggle = false
    @State var animSecondStarToggle = false
    @State var animThirdStarToggle = false
    
    var delays: (first: Double, second: Double, third: Double)
    
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: "star.fill")
                .foregroundColor(Color(#colorLiteral(red: 0.9780671, green: 0.7917446494, blue: 0.2799855769, alpha: 1)))
                .font(.system(size: 12, weight: .regular, design: .rounded))
                .rotationEffect(Angle(degrees: -15))
                .offset(y: animFirstStarToggle ? 0 : 20)
                .opacity(animFirstStarToggle ? 1 : 0)
                .onAppear {
                    withAnimation(Animation.interpolatingSpring(mass: 0.1, stiffness: 10,
                                                                damping: 0.8, initialVelocity: 10).delay(delays.first)) {
                        self.animFirstStarToggle.toggle()
                    }
                }
            
            Image(systemName: "star.fill")
                .foregroundColor(Color(#colorLiteral(red: 0.9780671, green: 0.7917446494, blue: 0.2799855769, alpha: 1)))
                .font(.system(size: 14, weight: .regular, design: .rounded))
                .padding(.bottom, 4.5)
                .offset(y: animSecondStarToggle ? 0 : 20)
                .opacity(animSecondStarToggle ? 1 : 0)
                .onAppear {
                    withAnimation(Animation.interpolatingSpring(mass: 0.1, stiffness: 10,
                                                                damping: 0.8, initialVelocity: 10).delay(delays.second)) {
                        self.animSecondStarToggle.toggle()
                    }
                }
            
            Image(systemName: "star.fill")
                .foregroundColor(Color(#colorLiteral(red: 0.9780671, green: 0.7917446494, blue: 0.2799855769, alpha: 1)))
                .font(.system(size: 12, weight: .regular, design: .rounded))
                .rotationEffect(Angle(degrees: 15))
                .offset(y: animThirdStarToggle ? 0 : 20)
                .opacity(animThirdStarToggle ? 1 : 0)
                .onAppear {
                    withAnimation(Animation.interpolatingSpring(mass: 0.1, stiffness: 10,
                                                                damping: 0.8, initialVelocity: 10).delay(delays.third)) {
                        self.animThirdStarToggle.toggle()
                    }
                }
        }
    }
}

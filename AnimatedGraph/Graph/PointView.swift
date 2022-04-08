//
//  PointView.swift
//  AnimatedGraph
//
//  Created by Dan Dolog on 14.04.2021.
//

import SwiftUI

struct PointView: View {
    @State var animToggle = false
    var isAnimated: Bool
    var delay: Double? = nil
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(#colorLiteral(red: 0.9999126792, green: 1, blue: 0.9998814464, alpha: 1)))
            
            Circle()
                .stroke(Color(#colorLiteral(red: 0.08754491061, green: 0.4774006605, blue: 0.9619923234, alpha: 1)), lineWidth: 3.5)
        }
        .frame(width: 14, height: 14)
        .opacity(!isAnimated || animToggle ? 1 : 0)
        .onAppear {
            if isAnimated {
                guard let delay = delay else { return }
                withAnimation(Animation.easeInOut(duration: 0.2).delay(delay)) {
                    self.animToggle.toggle()
                }
            }
        }
        
    }
}

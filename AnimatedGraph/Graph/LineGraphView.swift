//
//  LineGraphView.swift
//  AnimatedGraph
//
//  Created by Dan Dolog on 15.04.2021.
//

import SwiftUI

struct LineGraphView: View {
    @State var animToggle = false
    var delay: Double
    var duration: Double
    
    var body: some View {
        LineGraphShape()
            .trim(to: animToggle ? 1 : 0)
            .stroke(
                Color(#colorLiteral(red: 0.0844778344, green: 0.4779879451, blue: 0.9657506347, alpha: 1)),
                style: StrokeStyle(lineWidth: 7, lineCap: .round)
            )
            .onAppear {
                withAnimation(Animation.easeInOut(duration: duration).delay(delay)) {
                    self.animToggle.toggle()
                }
            }
    }
}

struct LineGraphShape: Shape {
    private var lineRadius: CGFloat = 0.5
    private var dataPoints: [CGFloat] = [0.23, 0.26, 0.5, 0.5, 0.78, 0.8, 1]
    
    func path(in rect: CGRect) -> Path {
        func point(at ix: Int) -> CGPoint {
            let point = dataPoints[ix]
            let x = rect.width * CGFloat(ix) / CGFloat(dataPoints.count - 1)
            let y = (1 - point) * rect.height
            
            return CGPoint(x: x, y: y)
        }
        
        return Path { p in
            let start = dataPoints[0]
            
            p.move(to: CGPoint(x: 0, y: (1 - start) * rect.height))
            var previousPoint = CGPoint(x: 0, y: (1 - start) * rect.height)
            
            for idx in dataPoints.indices {
                let point = dataPoints[idx]
                let x = rect.width * CGFloat(idx) / CGFloat(dataPoints.count - 1)
                let y = (1 - point) * rect.height
                
                let deltaX = x - previousPoint.x
                let curveXOffset = deltaX * self.lineRadius
                
                p.addCurve(to: .init(x: x, y: y),
                           control1: .init(x: previousPoint.x + curveXOffset, y: previousPoint.y - 8),
                           control2: .init(x: x - curveXOffset, y: y + 8))
                
                previousPoint = .init(x: x, y: y)
            }
            
        }
    }
}

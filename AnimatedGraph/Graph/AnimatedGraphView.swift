//
//  AnimatedGraphView.swift
//  AnimatedGraph
//
//  Created by Dan Dolog on 14.04.2021.
//

import SwiftUI

struct AnimatedGraphView: View {
    var body: some View {
        ZStack {
            GraphBackgroundView()
                .padding(.horizontal, 20)
            
            VStack {
                Spacer()
                
                LineGraphView(delay: 0.2, duration: 3.0)
                    .frame(maxHeight: 174)
                    .padding(.horizontal, 30)
                
                Spacer()
                    .frame(height: 30)
            }
            
            VStack {
                Spacer()
                
                HStack {
                    VStack {
                        PopoverView(title: "0%", color: Color(#colorLiteral(red: 0.9485056996, green: 0.9504830241, blue: 0.9704975486, alpha: 1)), offset: 20, delay: 0.1)
                        
                        PointView(isAnimated: false)
                            .padding(.bottom, 65)
                    }
                    Spacer()
                }
            }
            
            VStack {
                HStack {
                    Spacer()
                    
                    VStack {
                        StarsView(delays: (3.2, 3.6, 4.0))
                        
                        PopoverView(title: "100%", color: Color(#colorLiteral(red: 0.9780671, green: 0.7917446494, blue: 0.2799855769, alpha: 1)), offset: 20, delay: 2.9)
                        
                        PointView(isAnimated: true, delay: 2.7)
                            .padding(.top, -5)
                    }
                }
                Spacer()
            }
        }
        .frame(maxWidth: 500, maxHeight: 292)
        .padding(30)
    }
}

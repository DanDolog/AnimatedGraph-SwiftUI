//
//  ContentView.swift
//  AnimatedGraph
//
//  Created by Dan Dolog on 08.04.2022.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State var isGraphShowed = false
    @State var animToggle = false
    @State var circleD: CGFloat = 100
    @State var circleColor: Color = Color(#colorLiteral(red: 0.0844778344, green: 0.4779879451, blue: 0.9657506347, alpha: 1))
    @State var graphOpacity: Double = 0
    
    var body: some View {
        ZStack {
            if !isGraphShowed {
                Circle()
                    .fill(circleColor)
                    .frame(width: circleD, height: circleD)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1)) {
                            circleD = UIScreen.main.bounds.height
                            circleColor = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            isGraphShowed.toggle()
                            
                            withAnimation(.easeInOut(duration: 1)) {
                                graphOpacity = 1
                            }
                        }
                    }
            }
            
            VStack {
                if isGraphShowed {
                    AnimatedGraphView()
                } else {
                    Color(.clear)
                        .frame(height: 292)
                        .padding(30)
                }
                
                Button {
                    circleD = UIScreen.main.bounds.height
                    withAnimation(.easeInOut(duration: 1)) {
                        isGraphShowed = false
                        circleD = 100
                        circleColor = Color(#colorLiteral(red: 0.0844778344, green: 0.4779879451, blue: 0.9657506347, alpha: 1))
                        graphOpacity = 0
                    }
                } label: {
                    Text("Hide")
                        .font(.system(size: 16, weight: .semibold))
                        .opacity(graphOpacity)
                }
                
            }
            .frame(maxWidth: UIScreen.main.bounds.width)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  GraphBackgroundView.swift
//  AnimatedGraph
//
//  Created by Dan Dolog on 15.04.2021.
//

import SwiftUI

struct GraphBackgroundView: View {
    var body: some View {
        VStack {
            ForEach((1...5), id: \.self) { i in
                Spacer(minLength: i == 1 ? 84 : 0)
                Divider()
                    .foregroundColor(Color(#colorLiteral(red: 0.9331806898, green: 0.9336177707, blue: 0.9368166924, alpha: 1)))
            }

            HStack {
                ForEach((1...5), id: \.self) { i in
                    Text("Week \(i)")
                        .font(.system(size: 15, weight: .regular))
                    if i != 5 {
                        Spacer()
                    }
                }
            }
            .foregroundColor(Color(#colorLiteral(red: 0.6936959624, green: 0.6953346729, blue: 0.712028563, alpha: 1)))
        }
    }
}

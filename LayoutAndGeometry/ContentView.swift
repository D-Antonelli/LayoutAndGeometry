//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Derya Antonelli on 23/03/2023.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    let fadeStart: CGFloat = 200

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7])
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .opacity(opacityForView(geo: geo, fullView: fullView))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
    
    
    func opacityForView(geo: GeometryProxy, fullView: GeometryProxy) -> Double {
        let minY = geo.frame(in: .global).minY
        let fullViewMinY = fullView.frame(in: .global).minY

        if minY < fullViewMinY + fadeStart {
            return Double((minY - fullViewMinY) / fadeStart)
        } else {
            return 1.0
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

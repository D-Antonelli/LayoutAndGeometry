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
                            .background(backgroundForView(geo: geo, fullView: fullView))
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .opacity(opacityForView(geo: geo, fullView: fullView))
                            .scaleEffect(scaleForView(geo: geo, fullView: fullView))
                           
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
    
    func scaleForView(geo: GeometryProxy, fullView: GeometryProxy) -> Double {
        let height = geo.frame(in: .global).height

        let fullMinY = fullView.frame(in: .global).minY

        let maxY = geo.frame(in: .global).maxY

        let fullMaxY = fullView.frame(in: .global).maxY

        let diff = fullMaxY - fullMinY

        let increment = 0.5 / (diff / maxY)
        
        return 0.5 + increment
        
    }
    
    func backgroundForView(geo: GeometryProxy, fullView: GeometryProxy) -> Color {
        
        let minY = geo.frame(in: .global).minY
        let fullViewHeight = fullView.size.height
        
        let hue = Double(minY / fullViewHeight)
        
        return Color(hue: hue, saturation: 0.8, brightness: 0.8)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

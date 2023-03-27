//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Derya Antonelli on 23/03/2023.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Text("Hello, world!")
                    .frame(width: geo.size.width * 0.9)
                    .background(.red)
            }
            .background(.green)
            
            Text("More text")
            Text("More text")
            Text("More text")
        }
        
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

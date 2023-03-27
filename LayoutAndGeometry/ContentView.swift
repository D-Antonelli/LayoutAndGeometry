//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Derya Antonelli on 23/03/2023.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .offset(x: 100, y: 100)
            .background(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

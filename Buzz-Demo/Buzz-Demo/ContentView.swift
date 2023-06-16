//
//  ContentView.swift
//  Buzz-Demo
//
//  Created by Jia Chen Yee on 16/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabSelection = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            CircleDemo()
                .tabItem {
                    Label("Circle", systemImage: "circle")
                }
                .tag(0)
            
            HeartbeatDemo(tabSelection: $tabSelection)
                .tabItem {
                    Label("Heartbeat", systemImage: "heart")
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

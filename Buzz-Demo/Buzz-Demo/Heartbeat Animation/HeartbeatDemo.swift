//
//  HeartbeatDemo.swift
//  Buzz-Demo
//
//  Created by Jia Chen Yee on 16/06/23.
//

import SwiftUI

struct HeartbeatDemo: View {
    
    @Binding var tabSelection: Int
    
    @State private var heartScale = 0.8
    
    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .scaleEffect(heartScale)
                .foregroundStyle(.red)
            
            Button("Start Animation") {
                playHeartbeat()
                
                Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { _ in
                    playHeartbeat()
                }
                
            }
        }
    }
    
    func playHeartbeat() {
        guard tabSelection == 1 else { return }
        HeartbeatHaptics().play()
        
        withAnimation(.easeOut(duration: 0.2)) {
            heartScale = 1
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
            withAnimation(.easeIn(duration: 0.2)) {
                heartScale = 0.8
            }
        }
    }
}

struct HeartbeatDemo_Previews: PreviewProvider {
    static var previews: some View {
        HeartbeatDemo(tabSelection: .constant(1))
    }
}

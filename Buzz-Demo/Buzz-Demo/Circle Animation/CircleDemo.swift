//
//  CircleDemo.swift
//  Buzz-Demo
//
//  Created by Jia Chen Yee on 16/06/23.
//

import SwiftUI

struct CircleDemo: View {
    @State private var circleScale = 0.01
    
    var body: some View {
        ZStack {
            Circle()
                .scaleEffect(circleScale)
            
            Button("Play Animation") {
                CircleHaptics().play()
                
                withAnimation(.linear(duration: 1.1)) {
                    circleScale = 1
                }
                
                Timer.scheduledTimer(withTimeInterval: 1.1, repeats: false) { _ in
                    withAnimation(.linear(duration: 0.4)) {
                        circleScale = 0.01
                    }
                }
                
                Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
                    withAnimation(.linear(duration: 0.1)) {
                        circleScale = 0.05
                    }
                }
                
                Timer.scheduledTimer(withTimeInterval: 1.6, repeats: false) { _ in
                    withAnimation(.linear(duration: 0.1)) {
                        circleScale = 0.01
                    }
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .padding()
    }
}

struct CircleDemo_Previews: PreviewProvider {
    static var previews: some View {
        CircleDemo()
    }
}

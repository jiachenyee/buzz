//
//  CircleHaptics.swift
//  Buzz-Demo
//
//  Created by Jia Chen Yee on 16/06/23.
//

import Foundation
import Buzz

struct CircleHaptics: HapticSequence {
    var haptics: HapticEvents {
        for i in 0..<11 {
            let intensity = (Float(i) / 11) * 0.8 + 0.1
            Continuous(duration: 0.1,
                       intensity: intensity,
                       sharpness: Float(i) / 11)
        }
        
        for i in 0..<4 {
            let intensity = 1 - (Float(i) / 4) * 0.8 + 0.1
            Continuous(duration: 0.1,
                       intensity: intensity,
                       sharpness: 1 - (Float(i) / 4))
        }
        
        Transient(intensity: 1, sharpness: 1)
        
        Wait(duration: 0.2)
        
        Transient(intensity: 1, sharpness: 0.5)
    }
}

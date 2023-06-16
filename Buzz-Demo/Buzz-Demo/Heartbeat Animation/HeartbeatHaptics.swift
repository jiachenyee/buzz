//
//  HeartbeatHaptics.swift
//  Buzz-Demo
//
//  Created by Jia Chen Yee on 16/06/23.
//

import Foundation
import Buzz

struct HeartbeatHaptics: HapticSequence {
    var haptics: HapticEvents {
        Wait(duration: 0.2)
        Transient(intensity: 1, sharpness: 1)
        Wait(duration: 0.2)
        Transient(intensity: 1, sharpness: 0.5)
    }
}

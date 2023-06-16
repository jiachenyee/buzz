//
//  HapticEvent+Play.swift
//  
//
//  Created by Jia Chen Yee on 16/06/23.
//

import Foundation
import CoreHaptics
import OSLog

public extension HapticEvent {
    func play(parameterCurves: [CHHapticParameterCurve] = []) {
        do {
            try BuzzManager.shared?.engine.start()
            
            let pattern = try CHHapticPattern(events: toEvents(startTime: 0).sequence, parameterCurves: parameterCurves)
            
            let player = try BuzzManager.shared?.engine.makePlayer(with: pattern)
            
            try player?.start(atTime: CHHapticTimeImmediate)
        } catch {
            if #available(iOS 14.0, *) {
                os_log(.error, "Could not play haptics: \(error.localizedDescription)")
            } else {
                print("Could not play haptics: \(error.localizedDescription)")
            }
        }
    }
}

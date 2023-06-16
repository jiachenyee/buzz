//
//  Transient.swift
//  
//
//  Created by Jia Chen Yee on 16/06/23.
//

import Foundation
import CoreHaptics

public struct Transient: HapticEvent {
    public var intensity: Float = 0.5
    public var sharpness: Float = 0.5
    
    public init(intensity: Float = 0.5, sharpness: Float = 0.5) {
        self.intensity = intensity
        self.sharpness = sharpness
    }
    
    public func toEvents(startTime: TimeInterval) -> SequencePair {
        (
            [
                CHHapticEvent(eventType: .hapticTransient, parameters: [
                    CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity),
                    CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness)
                ], relativeTime: startTime)
            ],
            startTime + 0.01
        )
    }
}

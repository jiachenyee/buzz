//
//  Continuous.swift
//  
//
//  Created by Jia Chen Yee on 16/06/23.
//

import Foundation
import CoreHaptics

public struct Continuous: HapticEvent {
    public var duration: TimeInterval
    public var intensity: Float = 0.5
    public var sharpness: Float = 0.5
    
    public init(duration: TimeInterval, intensity: Float = 0.5, sharpness: Float = 0.5) {
        self.duration = duration
        self.intensity = intensity
        self.sharpness = sharpness
    }
    
    public func toEvents(startTime: TimeInterval) -> SequencePair {
        (
            [
                CHHapticEvent(eventType: .hapticContinuous, parameters: [
                    CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity),
                    CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness)
                ], relativeTime: startTime, duration: duration)
            ],
            startTime + duration
        )
    }
}

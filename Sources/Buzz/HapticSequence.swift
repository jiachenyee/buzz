//
//  HapticSequence.swift
//  
//
//  Created by Jia Chen Yee on 16/06/23.
//

import Foundation
import CoreHaptics

public protocol HapticSequence: HapticEvent {
    typealias HapticEvents = [HapticEvent]
    
    @HapticBuilder var haptics: HapticEvents { get }
}

public extension HapticSequence {
    func toEvents(startTime: TimeInterval) -> SequencePair {
        var sequence: [CHHapticEvent] = []
        
        var relativeStartTime = startTime
        
        for command in haptics {
            let event = command.toEvents(startTime: relativeStartTime)
            
            sequence += event.sequence
            
            relativeStartTime = event.endTime
        }
        
        return (sequence, relativeStartTime)
    }
}

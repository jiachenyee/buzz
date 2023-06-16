//
//  HapticGroup.swift
//  
//
//  Created by Jia Chen Yee on 16/06/23.
//

import Foundation
import CoreHaptics

public struct HapticGroup: HapticEvent {
    public var events: [HapticEvent]
    
    public init(@HapticBuilder events: (() -> [HapticEvent])) {
        self.events = events()
    }
    
    public init(events: [HapticEvent]) {
        self.events = events
    }
    
    public func toEvents(startTime: TimeInterval) -> SequencePair {
        var sequence: [CHHapticEvent] = []
        var relativeStartTime = startTime
        
        for command in events {
            let event = command.toEvents(startTime: relativeStartTime)
            
            sequence += event.sequence
            
            relativeStartTime = event.endTime
        }
        
        return (sequence, relativeStartTime)
    }
}

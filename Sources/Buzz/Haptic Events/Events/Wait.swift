//
//  Wait.swift
//  
//
//  Created by Jia Chen Yee on 16/06/23.
//

import Foundation

public struct Wait: HapticEvent {
    public var duration: Double
    
    public init(duration: Double) {
        self.duration = duration
    }
    
    public func toEvents(startTime: TimeInterval) -> SequencePair {
        (
            [],
            startTime + duration
        )
    }
}

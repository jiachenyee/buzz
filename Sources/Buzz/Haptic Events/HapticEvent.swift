//
//  HapticEvent.swift
//  
//
//  Created by Jia Chen Yee on 16/06/23.
//

import Foundation
import CoreHaptics

public protocol HapticEvent {
    typealias SequencePair = (sequence: [CHHapticEvent], endTime: TimeInterval)
    
    func toEvents(startTime: TimeInterval) -> SequencePair
}

//
//  HapticEvent+Modifiers.swift
//  
//
//  Created by Jia Chen Yee on 16/06/23.
//

import Foundation

public extension HapticEvent {
    func delay(before: TimeInterval) -> HapticGroup {
        delay(before: before, after: 0)
    }
    
    func delay(after: TimeInterval) -> HapticGroup {
        delay(before: 0, after: after)
    }
    
    func delay(before: TimeInterval, after: TimeInterval) -> HapticGroup {
        HapticGroup(events: [
            Wait(duration: before),
            self,
            Wait(duration: after)
        ])
    }
}

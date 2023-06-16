//
//  HapticBuilder.swift
//  
//
//  Created by Jia Chen Yee on 16/06/23.
//

import Foundation

@resultBuilder
public enum HapticBuilder {
    public static func buildBlock(_ component: HapticEvent...) -> [HapticEvent] {
        component
    }
    
    public static func buildArray(_ components: [[HapticEvent]]) -> HapticEvent {
        return HapticGroup(events: components.flatMap { $0 })
    }
    
    public static func buildOptional(_ component: [HapticEvent]?) -> HapticEvent {
        return HapticGroup(events: component ?? [])
    }
    
    public static func buildEither(first component: [HapticEvent]) -> HapticEvent {
        return HapticGroup(events: component)
    }
    
    public static func buildEither(second component: [HapticEvent]) -> HapticEvent {
        return HapticGroup(events: component)
    }
}

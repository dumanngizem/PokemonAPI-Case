//
//  AbilityCellModel.swift
//  UIComponents
//
//  Created by Gizem Duman on 22.03.2023.
//

import Foundation

public protocol AbilityCellDataSource: AnyObject {
    var abilityName: String? { get set }
}

public protocol AbilityCellEventSource: AnyObject {
    
}

public protocol AbilityCellProtocol: AbilityCellDataSource, AbilityCellEventSource {
    
}

public final class AbilityCellModel: AbilityCellProtocol {
    
    public var abilityName: String?
    
    public init(abilityName: String?) {
        self.abilityName = abilityName
    }
}

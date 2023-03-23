//
//  AbilityViewModel.swift
//  UIComponents
//
//  Created by Gizem Duman on 22.03.2023.
//

import UIKit

public protocol AbilityViewDataSource: AnyObject {
    
    var numberOfItemsInSection: Int? { get }
    
    func cellForItemAt(indexPath: IndexPath) -> AbilityCellProtocol?
}

public protocol AbilityViewEventSource: AnyObject {
    
}

public protocol AbilityViewProtocol: AbilityViewDataSource, AbilityViewEventSource {
    var minimumLineSpacingForSectionAt: CGFloat { get }
    var minimumInteritemSpacingForSectionAt: CGFloat { get }
    var insetForSectionAt: UIEdgeInsets { get }
}

public final class AbilityViewModel: AbilityViewProtocol {
    
    private var cellItems: [AbilityCellProtocol]?

    
    public init(cellItems: [AbilityCellProtocol]?) {
        self.cellItems = cellItems
    }
    
    public var minimumLineSpacingForSectionAt: CGFloat {
        return .zero
    }
    
    public var minimumInteritemSpacingForSectionAt: CGFloat {
        return .zero
    }
    
    public var insetForSectionAt: UIEdgeInsets {
        return .init(top: 0, left: 8, bottom: 0, right: 8)
    }
}

// MARK: - DataSource
extension AbilityViewModel {
    
    public var numberOfItemsInSection: Int? {
        return cellItems?.count
    }
    
    public func cellForItemAt(indexPath: IndexPath) -> AbilityCellProtocol? {
        return cellItems?[indexPath.row]
    }
}

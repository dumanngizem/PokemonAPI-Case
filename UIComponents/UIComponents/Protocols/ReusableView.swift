//
//  ReusableView.swift
//  UIComponents
//
//  Created by Gizem Duman on 21.03.2023.
//

import UIKit

public class ReusableViewModel {
    public init() {
        
    }
}

public protocol ReusableView: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

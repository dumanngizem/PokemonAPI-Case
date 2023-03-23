//
//  Transition.swift
//  PokemonAPI-Case
//
//  Created by Gizem Duman on 21.03.2023.
//

import UIKit

protocol Transition: AnyObject {
    var viewController: UIViewController? { get set }

    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController)
}

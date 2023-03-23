//
//  PopToViewController.swift
//  PokemonAPI-Case
//
//  Created by Gizem Duman on 21.03.2023.
//

import UIKit

protocol PopToViewController {
    func popToViewController<T: UIViewController>(typeClass: T.Type, isAnimated: Bool)
}
extension PopToViewController where Self: RouterProtocol {
    
    func popToViewController<T: UIViewController>(typeClass: T.Type, isAnimated: Bool = true) {
        guard let navigationController = self.viewController?.navigationController else {
            return
        }
        if let viewController = navigationController.viewControllers.first(where: { $0 is T }) {
            navigationController.popToViewController(viewController, animated: isAnimated)
        } else {
            navigationController.popToRootViewController(animated: isAnimated)
        }
    }
}

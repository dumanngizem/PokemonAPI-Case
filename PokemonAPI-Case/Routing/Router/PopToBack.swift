//
//  PopToBack.swift
//  PokemonAPI-Case
//
//  Created by Gizem Duman on 21.03.2023.
//

import Foundation

protocol PopToBackRoute {
    func popToBack(isAnimated: Bool)
}

extension PopToBackRoute where Self: RouterProtocol {
    
    func popToBack(isAnimated: Bool = true) {
        guard let navigationController = self.viewController?.navigationController else {
            return
        }
        navigationController.popViewController(animated: isAnimated)
    }
}

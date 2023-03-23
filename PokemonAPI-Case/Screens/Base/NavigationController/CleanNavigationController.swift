//
//  CleanNavigationController.swift
//  PokemonAPI-Case
//
//  Created by Gizem Duman on 21.03.2023.
//

import UIKit
import UIComponents

class CleanNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        interactivePopGestureRecognizer?.delegate = nil
    }
    
    private func configureContents() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).tintColor = .red
    }
}

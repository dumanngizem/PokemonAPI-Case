//
//  AppRouter.swift
//  PokemonAPI-Case
//
//  Created by Gizem Duman on 21.03.2023.
//

import UIKit

final class AppRouter: Router, AppRouter.Routes {
    
    typealias Routes = SplashRoute
    
    weak var window: UIWindow?
    
    func topViewController() -> UIViewController? {
        return UIApplication.topViewController()
    }
    
    static let shared = AppRouter()

    override func open(_ viewController: UIViewController, transition: Transition) {
        self.viewController = topViewController()
        super.open(viewController, transition: transition)
    }
    
    func startApp() {
        AppRouter.shared.pushSplash()
    }
}

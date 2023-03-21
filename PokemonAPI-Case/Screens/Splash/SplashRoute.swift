//
//  SplashRoute.swift
//  PokemonAPI-Case
//
//  Created by Gizem Duman on 21.03.2023.
//

protocol SplashRoute {
    func pushSplash()
}

extension SplashRoute where Self: RouterProtocol {
    
    func pushSplash() {
        let router = SplashRouter()
        let viewModel = SplashViewModel(router: router)
        let viewController = SplashViewController(viewModel: viewModel)
        let navigationController = BaseNavigationController(rootViewController: viewController)
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}

//
//  PokemonDetailsRoute.swift
//  PokemonAPI-Case
//
//  Created by Gizem Duman on 21.03.2023.
//

protocol PokemonDetailsRoute {
    func pushPokemonDetails()
}

extension PokemonDetailsRoute where Self: RouterProtocol {
    
    func pushPokemonDetails() {
        let router = PokemonDetailsRouter()
        let viewModel = PokemonDetailsViewModel(router: router)
        let viewController = PokemonDetailsViewController(viewModel: viewModel)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}

//
//  PokemonDetailsRoute.swift
//  PokemonAPI-Case
//
//  Created by Gizem Duman on 21.03.2023.
//

protocol PokemonDetailsRoute {
    func pushPokemonDetails(pokemonName: String?, pokemonIndex: Int?)
}

extension PokemonDetailsRoute where Self: RouterProtocol {
    
    func pushPokemonDetails(pokemonName: String?, pokemonIndex: Int?) {
        let router = PokemonDetailsRouter()
        let viewModel = PokemonDetailsViewModel(router: router, pokemonName: pokemonName, pokemonIndex: pokemonIndex)
        let viewController = PokemonDetailsViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}

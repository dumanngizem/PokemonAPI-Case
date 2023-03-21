//
//  PokemonDetailsViewModel.swift
//  PokemonAPI-Case
//
//  Created by Gizem Duman on 21.03.2023.
//

import Foundation

protocol PokemonDetailsViewDataSource {
    var index: Int? { get }
    var title: String? { get }
}

protocol PokemonDetailsViewEventSource {}

protocol PokemonDetailsViewProtocol: PokemonDetailsViewDataSource, PokemonDetailsViewEventSource {}

final class PokemonDetailsViewModel: BaseViewModel<PokemonDetailsRouter>, PokemonDetailsViewProtocol {
    
    private var pokemonName: String?
    private var pokemonIndex: Int?
    
    public init(router: PokemonDetailsRouter, pokemonName: String?, pokemonIndex: Int?) {
        super.init(router: router)
        self.pokemonName = pokemonName
        self.pokemonIndex = pokemonIndex
    }
}

// MARK: - DataSources
extension PokemonDetailsViewModel {
    
    var index: Int? {
        return pokemonIndex
    }
    
    var title: String? {
        return pokemonName?.firstUppercased
    }
}

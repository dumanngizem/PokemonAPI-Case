//
//  PokemonDetailsViewModel.swift
//  PokemonAPI-Case
//
//  Created by Gizem Duman on 21.03.2023.
//

import Foundation

protocol PokemonDetailsViewDataSource {}

protocol PokemonDetailsViewEventSource {}

protocol PokemonDetailsViewProtocol: PokemonDetailsViewDataSource, PokemonDetailsViewEventSource {}

final class PokemonDetailsViewModel: BaseViewModel<PokemonDetailsRouter>, PokemonDetailsViewProtocol {
    
}

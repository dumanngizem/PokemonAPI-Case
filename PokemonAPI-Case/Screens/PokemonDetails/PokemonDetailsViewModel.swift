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

protocol PokemonDetailsViewEventSource {
    var setAbilityViewModel: AnyClosure<AbilityViewProtocol?>? { get set }
    var showAbilityLoading: BoolClosure? { get set }
}

protocol PokemonDetailsViewProtocol: PokemonDetailsViewDataSource, PokemonDetailsViewEventSource {
     func viewDidLoad()
}

final class PokemonDetailsViewModel: BaseViewModel<PokemonDetailsRouter>, PokemonDetailsViewProtocol {
    
    private var pokemonName: String?
    private var pokemonIndex: Int?
    
    var setAbilityViewModel: AnyClosure<AbilityViewProtocol?>?
    var showAbilityLoading: BoolClosure?
    
    private var abilityViewModel: AbilityViewProtocol?
    
    public init(router: PokemonDetailsRouter, pokemonName: String?, pokemonIndex: Int?) {
        super.init(router: router)
        self.pokemonName = pokemonName
        self.pokemonIndex = pokemonIndex
    }
}

// MARK: - LyfeCycle
extension PokemonDetailsViewModel {
    
    func viewDidLoad() {
        fetchPokemonDetail()
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

// MARK: - ConfigureContents
extension PokemonDetailsViewModel {
    
    private func configureAbilityView(data: [PokemonAbilities]?) {
        guard let data = data else { return }
        let cellItems = data.map({ AbilityCellModel(abilityName: $0.ability?.name )})
        abilityViewModel = AbilityViewModel(cellItems: cellItems)
        setAbilityViewModel?(abilityViewModel)
        showAbilityLoading?(false)
    }
}

// MARK: - Requests
extension PokemonDetailsViewModel {
    
    private func fetchPokemonDetail() {
        guard let name = pokemonName else { return }
        showAbilityLoading?(true)
        let request = PokemonDetailRequest(name: name)
        dataProvider?.request(for: request, result: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.configureAbilityView(data: response.abilities)
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            }
        })
    }
}

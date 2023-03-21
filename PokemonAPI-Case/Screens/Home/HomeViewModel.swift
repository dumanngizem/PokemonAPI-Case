//
//  HomeViewModel.swift
//  PokemonAPI-Case
//
//  Created by Gizem Duman on 21.03.2023.
//

import Foundation

protocol HomeViewDataSource {
    var numberOfRowsInSection: Int { get }
    
    func cellForRowAt(_ indexPath: IndexPath) -> PokemonCellProtocol?
}

protocol HomeViewEventSource {
    var reloadData: VoidClosure? { get set }
    var emptyViewState: BoolClosure? { get set }
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {
    func viewDidLoad()
    func didSelectRowAt(indexPath: IndexPath)
}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    
    private var cellItems: [PokemonCellProtocol]?
    
    var reloadData: VoidClosure?
    var emptyViewState: BoolClosure?
}

// MARK: - LyfeCycle
extension HomeViewModel {
    
    func viewDidLoad() {
       fetchPokemon()
    }
}

// MARK: - DataSources
extension HomeViewModel {
    
    func cellForRowAt(_ indexPath: IndexPath) -> PokemonCellProtocol? {
        return cellItems?[indexPath.row]
    }
    
    var numberOfRowsInSection: Int {
        return cellItems?.count ?? 0
    }
}

// MARK: - ConfigureContents
extension HomeViewModel {
    
    private func configureCellItems(_ data: [PokemonItem]?) {
        guard let data = data else { return }
        let items = data.enumerated().map { (index, element) in
            return PokemonCellModel(index: index, title: element.name)
        }
        cellItems = items
    }
}

// MARK: - Requests
extension HomeViewModel {
    
    private func fetchPokemon() {
        showLoading?()
        let request = PokemonRequest()
        dataProvider?.request(for: request, result: { [weak self] result in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                self.configureCellItems(response.results)
                self.emptyViewState?(response.results?.isEmpty ?? true)
                self.reloadData?()
            case .failure(let error):
                print("Error")
            }
        })
    }
}

// MARK: - Routes
extension HomeViewModel {
    
    func didSelectRowAt(indexPath: IndexPath) {
        let name = cellItems?[indexPath.row].title
        router.pushPokemonDetails(pokemonName: name, pokemonIndex: indexPath.row)
    }
}

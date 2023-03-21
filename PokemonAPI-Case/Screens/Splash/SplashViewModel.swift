//
//  SplashViewModel.swift
//  PokemonAPI-Case
//
//  Created by Gizem Duman on 21.03.2023.
//

import Foundation

protocol SplashViewDataSource {}

protocol SplashViewEventSource {}

protocol SplashViewProtocol: SplashViewDataSource, SplashViewEventSource {}

final class SplashViewModel: BaseViewModel<SplashRouter>, SplashViewProtocol {
    
}

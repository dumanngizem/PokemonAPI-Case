//
//  SplashViewModel.swift
//  PokemonAPI-Case
//
//  Created by Gizem Duman on 21.03.2023.
//

import Foundation

protocol SplashViewDataSource {}

protocol SplashViewEventSource {}

protocol SplashViewProtocol: SplashViewDataSource, SplashViewEventSource {
    func pushHome()
    func viewDidLoad()
}

final class SplashViewModel: BaseViewModel<SplashRouter>, SplashViewProtocol {
 
}

// MARK: - LyfeCyle
extension SplashViewModel {
    
    func viewDidLoad() {
        pushHome()
    }
}

// MARK: - Routes
extension SplashViewModel {
  
    func pushHome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.router.pushHome()
        }
    }
}

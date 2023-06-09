//
//  BaseViewModel.swift
//  PokemonAPI-Case
//
//  Created by Gizem Duman on 21.03.2023.
//

import UIKit
import UIComponents
import TinyConstraints

class BaseViewController<V: BaseViewModelProtocol>: UIViewController {
    
    private var animatedPopController = true
    
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        subscribeLoading()
    }
    
    private func configureContents() {
        self.tabBarController?.tabBar.isTranslucent = true
        view.backgroundColor = .white
    }
    
    @objc
    func tryAgainButtonTapped() {
        viewModel.tryAgainButtonTapped()
    }
    
    @objc
    private func popController() {
        navigationController?.popViewController(animated: animatedPopController)
    }
    
#if DEBUG || DEVELOP
    deinit {
        debugPrint("deinit \(self)")
    }
#endif
}

// MARK: - Loading
extension BaseViewController {
    
    private func subscribeLoading() {
        viewModel.showLoading = {
            let window = UIApplication.shared.windows.first
            window?.showPACLoaderView()
        }
        viewModel.hideLoading = {
            let window = UIApplication.shared.windows.first
            window?.hidePACLoaderView()
        }
    }
}

//
//  SplashViewController.swift
//  PokemonAPI-Case
//
//  Created by Gizem Duman on 21.03.2023.
//

import UIKit

final class SplashViewController: BaseViewController<SplashViewModel> {
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = FontFamily.Inter.bold.font(size: 16)
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        configureLocalize()
        viewModel.viewDidLoad()
    }
}

// MARK: - UILayout
extension SplashViewController {
    
    private func addSubViews() {
        addImageView()
        addTitleLabel()
    }
    
    private func addImageView() {
        view.addSubview(imageView)
        imageView.centerInSuperview()
        imageView.size(.init(width: 200, height:250))
    }
    
    private func addTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.topToBottom(of: imageView)
        titleLabel.centerX(to: imageView)
    }
}

// MARK: - ConfigureContents
extension SplashViewController {
    
    private func configureContents() {
        configureImageView()
    }
    
    private func configureImageView() {
        imageView.image = .imgSplash
    }
}

// MARK: - ConfigureLocalize
extension SplashViewController {
    
    private func configureLocalize() {
        titleLabel.text = L10n.Splash.titleLabelText
    }
}

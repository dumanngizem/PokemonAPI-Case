//
//  PokemonDetailsViewController.swift
//  PokemonAPI-Case
//
//  Created by Gizem Duman on 21.03.2023.
//

import UIKit

final class PokemonDetailsViewController: BaseViewController<PokemonDetailsViewModel> {
    
    private let imageContainer: UIView = {
       let view = UIView()
        view.backgroundColor = .orange.withAlphaComponent(0.4)
        return view
    }()
    
    private let imageView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = FontFamily.Inter.bold.font(size: 16)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(.imgClose, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        addTargets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
}

// MARK: - UILayout
extension PokemonDetailsViewController {
    
    private func addSubViews() {
        addImageContainer()
        addImageView()
        addTitleLabel()
        addCloseButton()
    }
    
    private func addImageContainer() {
        view.addSubview(imageContainer)
        imageContainer.topToSuperview()
        imageContainer.horizontalToSuperview()
        imageContainer.height(screenSize.height * 0.50)
    }
    
    private func addImageView() {
        imageContainer.addSubview(imageView)
        imageView.centerInSuperview()
        imageView.size(.init(width: 200, height: 200))
    }
    
    private func addTitleLabel() {
        imageContainer.addSubview(titleLabel)
        titleLabel.topToBottom(of: imageView, offset: 8)
        titleLabel.bottomToSuperview(offset: -4, relation: .equalOrLess)
        titleLabel.horizontalToSuperview(insets: .horizontal(16))
    }
    
    private func addCloseButton() {
        imageContainer.addSubview(closeButton)
        closeButton.topToSuperview(offset: 46)
        closeButton.trailingToSuperview(offset: 24)
        closeButton.size(.init(width: 24, height: 24))
    }
}

// MARK: - ConfigureContents
extension PokemonDetailsViewController {
    
    private func configureContents() {
        configureImageView()
        configureTitleLabel()
    }
    
    private func configureImageView() {
        guard let index = viewModel.index else { return }
        imageView.setKFPokemonImage(index: index)
    }
    
    private func configureTitleLabel() {
        guard let title = viewModel.title else { return }
        titleLabel.text = title
    }
    
    private func configureNavigationBar() {
        navigationController?.isNavigationBarHidden = true
    }
}

// MARK: - Targets
extension PokemonDetailsViewController {
    
    private func addTargets() {
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension PokemonDetailsViewController {
    
    @objc
    private func closeButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

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
    
    private let abilityTitleLabel: UILabel = {
       let label = UILabel()
        label.font = FontFamily.Inter.bold.font(size: 24)
        label.textColor = .black
        return label
    }()
    
    private let abilityView: AbilityView = {
       let view = AbilityView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        configureLocalize()
        addTargets()
        subscribeViewModel()
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar(isNavigationBarHidden: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        configureNavigationBar(isNavigationBarHidden: false)
    }
}

// MARK: - UILayout
extension PokemonDetailsViewController {
    
    private func addSubViews() {
        addImageContainer()
        addImageView()
        addTitleLabel()
        addCloseButton()
        addAbilityTitleLabel()
        addAbilityView()
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
    
    private func addAbilityTitleLabel() {
        view.addSubview(abilityTitleLabel)
        abilityTitleLabel.horizontalToSuperview(insets: .horizontal(16))
        abilityTitleLabel.topToBottom(of: imageContainer, offset: 16)
    }
    
    private func addAbilityView() {
        view.addSubview(abilityView)
        abilityView.edgesToSuperview(excluding: [.top, .bottom])
        abilityView.topToBottom(of: abilityTitleLabel)
        abilityView.height(60)
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
    
    private func configureNavigationBar(isNavigationBarHidden: Bool) {
        navigationController?.isNavigationBarHidden = isNavigationBarHidden
    }
}

// MARK: - ConfigureLocalize
extension PokemonDetailsViewController {
    
    private func configureLocalize() {
        abilityTitleLabel.text = L10n.PokemonDetails.Abilites.titleText
    }
}

// MARK: - SubscribeViewModel
extension PokemonDetailsViewController {
    
    private func subscribeViewModel() {
        subscribeSetAbilityViewModel()
        subscribeShowAbilityLoading()
    }
    
    private func subscribeSetAbilityViewModel() {
        viewModel.setAbilityViewModel = { [weak self] viewModel in
            guard let self = self else { return }
            self.abilityView.set(viewModel: viewModel)
        }
    }
    
    private func subscribeShowAbilityLoading() {
        viewModel.showAbilityLoading = { [weak self] isShow in
            guard let self = self else { return }
            self.abilityView.setLoadingIndicator(isShow: isShow)
        }
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

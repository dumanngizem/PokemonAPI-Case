//
//  EmptyView.swift
//  UIComponents
//
//  Created by Gizem Duman on 21.03.2023.
//

import UIKit
import Lottie

public protocol EmptyViewDelegate: AnyObject {
    func tryAgainButtonTappedEmptyView()
}

public class EmptyView: UIView {
    
    private var animationView: LottieAnimationView = LottieAnimationView()
    
    private var tryAgainButton: UIButton = {
       let button = UIButton()
        button.layer.cornerRadius = 8
        button.backgroundColor = .clear
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 2
        button.setTitle("Try Again", for: .normal)
        button.titleLabel?.font = FontFamily.Inter.medium.font(size: 12)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private var screenSize = UIScreen.main.bounds
    
    public weak var delegate: EmptyViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
        addTargets()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
}

// MARK: - UI Layout
extension EmptyView {
    
    private func addSubViews() {
        addAnimationView()
        addTryAgainButton()
    }
    
    private func addAnimationView() {
        addSubview(animationView)
        animationView.centerInSuperview()
        animationView.size(.init(width: screenSize.width * 0.80, height: screenSize.height * 0.60))
    }
    
    private func addTryAgainButton() {
        addSubview(tryAgainButton)
        tryAgainButton.horizontalToSuperview(insets: .horizontal(32))
        tryAgainButton.bottomToSuperview(offset: -40, usingSafeArea: true)
        tryAgainButton.height(52)
    }
}

// MARK: - Configure
extension EmptyView {
    
    private func configureContents() {
        configureAnimationView()
        backgroundColor = .clear
    }
    
    private func configureAnimationView() {
        animationView.animation = LottieAnimation.named("empty")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.75
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.play()
    }
}

// MARK: - AddTargets
extension EmptyView {
    
    private func addTargets() {
        tryAgainButton.addTarget(self, action: #selector(tryAgainButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension EmptyView {
    
    @objc
    private func tryAgainButtonTapped() {
        delegate?.tryAgainButtonTappedEmptyView()
    }
}

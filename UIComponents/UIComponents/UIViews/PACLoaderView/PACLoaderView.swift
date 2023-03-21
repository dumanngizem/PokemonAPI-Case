//
//  PACLoaderView.swift
//  UIComponents
//
//  Created by Gizem Duman on 21.03.2023.
//

import TinyConstraints
import Lottie


public class PACLoaderView: UIView {
    
    private var animationView: LottieAnimationView = LottieAnimationView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI Layout
extension PACLoaderView {
    
    private func addSubViews() {
        addAnimationView()
    }
    
    private func addAnimationView() {
        addSubview(animationView)
        animationView.centerInSuperview()
        animationView.size(.init(width: 100, height: 100))
    }
}

// MARK: - Configure
extension PACLoaderView {
    
    private func configureContents() {
        backgroundColor = .gray.withAlphaComponent(0.25)
        configureAnimationView()
    }
    
    private func configureAnimationView() {
        animationView.animation = LottieAnimation.named("pac-loading")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.75
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.play()
    }
}

public extension UIWindow {
    
    func showPACLoaderView() {
        guard !subviews.contains(where: { $0 is PACLoaderView }) else { return }
        
        let activityIndicator = PACLoaderView()
        activityIndicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        activityIndicator.frame = bounds
        
        UIView.transition(
            with: self,
            duration: 0,
            options: .transitionCrossDissolve,
            animations: {
                self.addSubview(activityIndicator)
            }
        )
    }
    
    func hidePACLoaderView() {
        subviews.filter({ $0 is PACLoaderView }).forEach({ $0.removeFromSuperview() })
    }
}

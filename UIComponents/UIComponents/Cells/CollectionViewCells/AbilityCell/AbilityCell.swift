//
//  AbilityCell.swift
//  UIComponents
//
//  Created by Gizem Duman on 22.03.2023.
//

import UIKit

public class AbilityCell: UICollectionViewCell, ReusableView {
    
    private let titleContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.layer.cornerRadius = 4
        return view
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .white
        label.font = FontFamily.Inter.medium.font(size: 12)
        return label
    }()
    
    weak var viewModel: AbilityCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }

    public func set(viewModel: AbilityCellProtocol) {
        self.viewModel = viewModel
        configureContents()
    }
}

// MARK: - UILayout
extension AbilityCell {
    
    private func addSubViews() {
        addTitleContainerView()
        addTitleLabel()
    }
    
    private func addTitleContainerView() {
        contentView.addSubview(titleContainerView)
        titleContainerView.edgesToSuperview(insets: .horizontal(8))
    }
    
    private func addTitleLabel() {
        titleContainerView.addSubview(titleLabel)
        titleLabel.centerInSuperview()
        titleLabel.horizontalToSuperview(insets: .horizontal(4))
    }
}

// MARK: - ConfigureContents
extension AbilityCell {
    
    private func configureContents() {
        configureTitleLabel()
    }
    
    private func configureTitleLabel() {
        guard let name = viewModel?.abilityName else { return }
        titleLabel.text = name
    }
}

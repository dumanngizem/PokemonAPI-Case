//
//  AbilityView.swift
//  UIComponents
//
//  Created by Gizem Duman on 22.03.2023.
//

import UIKit

public class AbilityView: UIView {
    
    weak var viewModel: AbilityViewProtocol? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.register(AbilityCell.self)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
        configureDelegates()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    public func set(viewModel: AbilityViewProtocol?) {
        self.viewModel = viewModel
        configureContents()
    }
    
    public func setLoadingIndicator(isShow: Bool) {
        if isShow {
            self.collectionView.loadingView()
        } else {
            self.collectionView.restore()
        }
    }
}

// MARK: - UILayout
extension AbilityView {
    
    private func addSubViews() {
        addCollectionView()
    }
    
    private func addCollectionView() {
        addSubview(collectionView)
        collectionView.edgesToSuperview()
    }
}

// MARK: - ConfigureDelegates
extension AbilityView {
    
    private func configureDelegates() {
        configureCollectionViewDelegate()
    }
    
    private func configureCollectionViewDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - ConfigureContents
extension AbilityView {
    
    private func configureContents() {

    }
}

// MARK: - UICollectionViewDelegate
extension AbilityView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension AbilityView: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfItemsInSection ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AbilityCell = collectionView.dequeueReusableCell(for: indexPath)
        if let viewModel = viewModel?.cellForItemAt(indexPath: indexPath) {
            cell.set(viewModel: viewModel)
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension AbilityView: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        guard let viewModel = viewModel else { return .zero }
        return viewModel.minimumLineSpacingForSectionAt
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        guard let viewModel = viewModel else { return .zero }
        return viewModel.minimumInteritemSpacingForSectionAt
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        guard let viewModel = viewModel else { return .zero }
        return viewModel.insetForSectionAt
    }
}

//
//  PokemonCellsCell.swift
//  UIComponents
//
//  Created by Gizem Duman on 21.03.2023.
//

import UIKit
import TinyConstraints
import Kingfisher

public class PokemonCell: UITableViewCell, ReusableView {
    
    public let pokemonImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.font = FontFamily.Inter.bold.font(size: 14)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    public let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgChevronRight.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .gray
        return imageView
    }()
    
    weak var viewModel: PokemonCellProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    public func set(viewModel: PokemonCellProtocol?) {
        self.viewModel = viewModel
        configureContents()
    }
}

// MARK: - UILayout
extension PokemonCell {
    
    private func addSubViews() {
        addPokemonImageView()
        addTitleLabel()
        addChevronImageView()
    }
    
    private func addPokemonImageView() {
        contentView.addSubview(pokemonImageView)
        pokemonImageView.leadingToSuperview(offset: 16)
        pokemonImageView.verticalToSuperview(insets: .vertical(16))
        pokemonImageView.size(.init(width: 80, height: 80))
    }
    
    private func addTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.leadingToTrailing(of: pokemonImageView, offset: 8)
        titleLabel.centerY(to: pokemonImageView)
    }
    
    private func addChevronImageView() {
        contentView.addSubview(chevronImageView)
        chevronImageView.leadingToTrailing(of: titleLabel, offset: 4)
        chevronImageView.trailingToSuperview(offset: 16)
        chevronImageView.centerYToSuperview()
        chevronImageView.size(.init(width: 16, height: 16))
    }
}

// MARK: - ConfigureContents
extension PokemonCell {
    
    private func configureContents() {
        configureCell()
        configurePokemonImageView()
        configureTitleLabel()
    }
    
    private func configureCell() {
        selectionStyle = .none
    }
    
    private func configurePokemonImageView() {
        guard let index = viewModel?.index else { return }
        let indexIncrease = index + 1
        let imageString = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(indexIncrease).png"
        pokemonImageView.setKFImage(imageString)
    }
    
    private func configureTitleLabel() {
        guard let title = viewModel?.title else { return }
        titleLabel.text = title
    }
}

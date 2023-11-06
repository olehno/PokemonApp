//
//  PokemonTableViewCell.swift
//  PokemonApp
//
//  Created by Артур Олехно on 06/11/2023.
//

import UIKit
import SDWebImage

class PokemonTableViewCell: UITableViewCell {
    
    static let identifier = "PokemonTableViewCell"
    
    private let pokemonUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 1
        return label
    }()
    
    private let pokemonSubtypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(pokemonUIImageView)
        contentView.addSubview(pokemonNameLabel)
        contentView.addSubview(pokemonSubtypeLabel)
        
        applyConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func applyConstrains() {
        let pokemonUIImageViewConstrain = [
            pokemonUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            pokemonUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            pokemonUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            pokemonUIImageView.widthAnchor.constraint(equalToConstant: 125),
        ]
        let pokemonNameLabelConstrain = [
            pokemonNameLabel.leadingAnchor.constraint(equalTo: pokemonUIImageView.trailingAnchor, constant: 10),
            pokemonNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -15),
            pokemonNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ]
        let pokemonSubtypeLabelConstrain = [
            pokemonSubtypeLabel.leadingAnchor.constraint(equalTo: pokemonUIImageView.trailingAnchor, constant: 10),
            pokemonSubtypeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 15),
            pokemonSubtypeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
            
        ]
        
        NSLayoutConstraint.activate(pokemonUIImageViewConstrain)
        NSLayoutConstraint.activate(pokemonNameLabelConstrain)
        NSLayoutConstraint.activate(pokemonSubtypeLabelConstrain)
    }
    
    public func configure(imageURL: String, name: String, subtype: String) {
        guard let url = URL(string: imageURL) else {return}
        pokemonUIImageView.sd_setImage(with: url, completed: nil)
        pokemonNameLabel.text = name
        pokemonSubtypeLabel.text = subtype
    }
}

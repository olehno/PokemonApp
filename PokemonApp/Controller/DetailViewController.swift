//
//  DetailViewController.swift
//  PokemonApp
//
//  Created by Артур Олехно on 10/11/2023.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    private let imageUIView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.text = "Test1"
        return label
    }()
    
    private let subtypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.text = "Test2"
        return label
    }()
    
    private let hpLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.text = "Test3"
        return label
    }()
    
    private let         evolvesFromLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.text = "Test4"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.tintColor = .label
        
        view.addSubview(imageUIView)
        view.addSubview(nameLabel)
        view.addSubview(subtypeLabel)
        view.addSubview(hpLabel)
        view.addSubview(evolvesFromLabel)
        
        applyConstraints()
    }
    
    private func applyConstraints() {
        let webViewConstraints = [
            imageUIView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageUIView.heightAnchor.constraint(equalToConstant: 300)
        ]
        let nameLabelConstraints = [
            nameLabel.topAnchor.constraint(equalTo: imageUIView.bottomAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ]
        let locationLabelConstraints = [
            subtypeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            subtypeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ]
        let sinceLabelConstraints = [
            hpLabel.topAnchor.constraint(equalTo: subtypeLabel.bottomAnchor, constant: 10),
            hpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ]
        NSLayoutConstraint.activate(webViewConstraints)
        NSLayoutConstraint.activate(nameLabelConstraints)
        NSLayoutConstraint.activate(locationLabelConstraints)
        NSLayoutConstraint.activate(sinceLabelConstraints)
        
    }
    
    public func configure(image: String, name: String, subt: String, hp: String, evo: String) {
        guard let url = URL(string: image) else {return}
        imageUIView.sd_setImage(with: url)
        nameLabel.text = name
        subtypeLabel.text = "📍Subtype: \(subt)"
        hpLabel.text = "HP: \(hp)"
        evolvesFromLabel.text = "Evolves From: \(evo)"
    }
}

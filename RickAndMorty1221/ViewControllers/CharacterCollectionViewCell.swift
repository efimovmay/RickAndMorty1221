//
//  CharacterCollectionViewCell.swift
//  RickAndMorty1221
//
//  Created by Aleksey Efimov on 21.08.2023.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    let imageCharacter = UIImageView()
    let nameCharacter = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageCharacter)
        configureImage()
        
        addSubview(nameCharacter)
        configureName()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImage() {
        imageCharacter.layer.masksToBounds = true
        imageCharacter.layer.cornerRadius = 10
        
        imageCharacter.translatesAutoresizingMaskIntoConstraints = false
        imageCharacter.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageCharacter.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
        imageCharacter.heightAnchor.constraint(equalTo: imageCharacter.widthAnchor).isActive = true
        imageCharacter.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func configureName() {
        nameCharacter.numberOfLines = 0
        nameCharacter.textColor = .white
        nameCharacter.textAlignment = .center
        
        nameCharacter.translatesAutoresizingMaskIntoConstraints = false
        nameCharacter.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameCharacter.centerYAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        nameCharacter.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
    }
    
    func configure(whith character: Character) {
        nameCharacter.text = character.name ?? ""
        NetworkManger.shared.fetchImage(from: character.image) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.imageCharacter.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}

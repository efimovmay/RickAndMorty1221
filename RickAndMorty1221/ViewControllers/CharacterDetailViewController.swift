//
//  CraracterDetailViewController.swift
//  RickAndMorty1221
//
//  Created by Aleksey Efimov on 21.08.2023.
//

import Foundation
import UIKit

final class CharacterDetailViewController: UIViewController {
    
//    @IBOutlet var nameLabel: UILabel!
//    @IBOutlet var infoLabel: UILabel!
//
//    @IBOutlet var characterImage: UIImageView!
    
    var character: Character?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .red
//        guard let infoCharacter = character else { return }
//
//        nameLabel.text = infoCharacter.name
//        infoLabel.text = character?.description
//        characterImage.layer.cornerRadius = 10
//        NetworkManger.shared.fetchImage(from: infoCharacter.image) { [weak self] Result in
//            switch Result {
//            case .success(let imageData):
//                self?.characterImage.image = UIImage(data: imageData)
//            case .failure(let error):
//                print(error)
//            }
        }
    }


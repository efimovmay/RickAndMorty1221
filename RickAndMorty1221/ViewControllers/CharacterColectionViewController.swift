//
//  ViewController.swift
//  RickAndMorty1221
//
//  Created by Aleksey Efimov on 21.08.2023.
//

import UIKit

final class CharacterColectionViewController: UIViewController {
    
    private var allCharacter: AllCharacter?

    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 4/256, green: 12/256, blue: 30/256, alpha: 1)
        setupNavigationBar()
        setupCollectionView()
        fetchCharacter(from: link.allCharacter.rawValue)
    }
    
    // MARK: - Navigation
    @objc
    private func goToDetailViewController() {
        let detailVC = CharacterDetailViewController()
        present(detailVC, animated: true)
    }
    
    // MARK: - SetupUI
    private func setupCollectionView() {

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        collectionView.backgroundColor = UIColor(red: 4/256, green: 12/256, blue: 30/256, alpha: 1)
        
        collectionView.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupNavigationBar() {
        title = "Characters"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

    // MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension CharacterColectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allCharacter?.results.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CharacterCollectionViewCell
        else { return UICollectionViewCell() }
        
        guard let character = allCharacter?.results[indexPath.row] else { return UICollectionViewCell() }
        cell.backgroundColor = UIColor(red: 38/256, green: 42/256, blue: 56/256, alpha: 1)
        cell.layer.cornerRadius = 20
        cell.configure(whith: character)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = CharacterDetailViewController()
        detailVC.character = allCharacter?.results[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CharacterColectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberCellInRow: CGFloat = 2
        let padingWidht = 20 * ( numberCellInRow )
        let availableWidht = collectionView.frame.width - padingWidht
        let cellWidht = availableWidht/numberCellInRow
        let cellHight = cellWidht * 1.3
        return CGSize(width: cellWidht, height: cellHight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 30, left: 10, bottom: 0, right: 10)
    }
}

// MARK: - Networking

extension CharacterColectionViewController {
    func fetchCharacter(from link: String) {
        NetworkManger.shared.fetch(dataType: AllCharacter.self, from: link) { [weak self] result in
            switch result {
            case .success(let allCharacter):
                self?.allCharacter = allCharacter
                self?.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

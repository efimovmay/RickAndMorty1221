//
//  CustomNavigationController.swift
//  RickAndMorty1221
//
//  Created by Aleksey Efimov on 24.08.2023.
//

import UIKit

class navigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    
    override func viewDidLoad() {
        setupBackButton()
    }
    
    func setupBackButton() {
        let backBarButton = UIBarButtonItem(title: "",
                                            style: .plain,
                                            target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backBarButton
    }
}

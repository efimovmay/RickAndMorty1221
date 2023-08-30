//
//  Colors.swift
//  RickAndMorty1221
//
//  Created by Aleksey Efimov on 30.08.2023.
//

import UIKit

enum Colors {
    case backgroundColor
    case navBarColor
    case viewsColor
    case grayTextColor
    case greenTextColor
    
    func getColor() -> UIColor {
        switch self {
        case .backgroundColor:
            return UIColor(red: 4/256,
                           green: 12/256,
                           blue: 30/256,
                           alpha: 1)
        case .navBarColor:
            return UIColor(red: 21/255,
                           green: 32/255,
                           blue: 66/255,
                           alpha: 0.7)
        case .viewsColor:
            return UIColor(red: 38/256,
                           green: 42/256,
                           blue: 56/256,
                           alpha: 1)
        case .grayTextColor:
            return UIColor(red: 147/256,
                           green: 152/256,
                           blue: 156/256,
                           alpha: 1)
        case .greenTextColor:
            return UIColor(red: 71/256,
                           green: 198/256,
                           blue: 11/256,
                           alpha: 1)
        }
    }
}

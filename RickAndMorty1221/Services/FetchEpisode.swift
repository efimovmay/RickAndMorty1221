//
//  FetchEpisode.swift
//  RickAndMorty1221
//
//  Created by Aleksey Efimov on 23.08.2023.
//

import Foundation
import SwiftUI

class FetchEpisode: ObservableObject {
    
    @Published var results = [Episode]()
    
    func getDate(from link: String, completion: @escaping (Episode) -> ()){
        guard let url = URL(string: link) else {
            print("Invalid url...")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            let results = try! JSONDecoder().decode(Episode.self, from: data!)
            DispatchQueue.main.async {
                completion(results)
            }
        }.resume()
    }
}

//
//  EpisodesView.swift
//  RickAndMorty1221
//
//  Created by Aleksey Efimov on 23.08.2023.
//

import SwiftUI

struct EpisodesView: View {
    let character: Character
    
    @State var episodes = [Episode]()
    
    var body: some View {
        HStack {
            Text("Episodes")
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 24.0)
            Spacer()
        }.onAppear() {
            fetchEpisode()
            }
        
        ForEach(episodes, id: \.self) { episode in
            ZStack {
                Rectangle()
                    .frame(height: 86)
                    .foregroundColor(Color(Colors.viewsColor.getColor()))
                    .cornerRadius(16)
                VStack (spacing: 10) {
                    HStack {
                        Text(episode.name ?? "")
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }
                    HStack {
                        Text(episode.episode ?? "")
                            .foregroundColor(Color(Colors.greenTextColor.getColor()))
                        Spacer()
                        Text(episode.air_date ?? "")
                            .foregroundColor(.gray)
                    }.font(.system(size: 13))
                }
                .padding(.horizontal, 16.0)
            }.padding(.horizontal, 20)
        }
    }
    
    func fetchEpisode() {
        for linkEpisode in character.episode {
            NetworkManger().fetch(dataType: Episode.self, from: linkEpisode)
                { result in
                    switch result {
                    case .success(let result):
                        self.episodes.append(result)
                    case .failure(let error):
                        print(error)
                    }
                }
        }
    }
}

//struct EpisodesView_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodesView()
//    }
//}

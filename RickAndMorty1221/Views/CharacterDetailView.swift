//
//  CharacterDetailView.swift
//  RickAndMorty1221
//
//  Created by Aleksey Efimov on 21.08.2023.
//

import SwiftUI



struct CharacterDetailView: View {
    
    var character: Character!
    var episodes: [Episode] = []
    
    let greenColor = Color(red: 71/256, green: 198/256, blue: 11/256)
    let backgroundColor = CGColor(red: 4/256, green: 12/256, blue: 30/256, alpha: 1)
    let grayColor = Color(red: 38/256, green: 42/256, blue: 56/256)
    
    @ObservedObject var fetchData = NetworkManger()
    
//    mutating func fetchEpisodes(from link: String) {
//        NetworkManger.shared.fetch(dataType: Episode.self, from: link) { [weak self] result in
//            switch result {
//            case .success(let episode):
//                self?.episodes.append(episode)
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    
    var body: some View {
            ZStack {
                Color(backgroundColor)
                    .edgesIgnoringSafeArea(.all)
                ScrollView {

                VStack {
                    HeadView(character: character, greenColor: greenColor)
                    InfoView(character: character, grayColor: grayColor)
                    OriginView(character: character, greenColor: greenColor, grayColor: grayColor)
                    
                    // MARK: - Episode
                    HStack {
                        Text("Episodes")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.leading, 24.0)
                        Spacer()
                    }
                    
                    ForEach(character.episode, id: \.self) { episode in
                        ZStack {
                            Rectangle()
                                .frame(height: 86)
                                .foregroundColor(grayColor)
                                .cornerRadius(16)
                            VStack (spacing: 10) {
                                HStack {
                                    Text(episode)
                                        .bold()
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                HStack {
                                    Text("Episodes")
                                        .foregroundColor(greenColor)
                                    Spacer()
                                    Text("Episodes")
                                        .foregroundColor(.gray)
                                }.font(.system(size: 13))
                            }
                            .padding(.horizontal, 16.0)
                        }.padding(.horizontal, 20)
                    }.onAppear() {
                        
                    }
                }
            }
        }
    }
}


//struct CharacterDetailView_Previews: PreviewProvider {
//    @ObservedObject var fetchData = NetworkManger()
//    let randomCharacter: Character
//
//    static var previews: some View {
//        CharacterDetailView()
//    }
//
//}




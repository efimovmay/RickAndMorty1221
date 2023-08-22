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
                    AsyncImage(
                        url: URL(string: character.image),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 148, maxHeight: 148)
                                .cornerRadius(16)
                        },
                        placeholder: { ProgressView()}
                    )
                    .padding(.bottom, 20.0)
                    Text(character.name)
                        .font(.system(size: 22) .bold())
                        .foregroundColor(.white)
                        .padding(.bottom, 10.0)
                    
                    Text(character.status)
                        .font(.system(size: 16))
                        .foregroundColor(greenColor)
                        .padding(.bottom, 20.0)
                    
                    
                    // MARK: - INFO
                    HStack {
                        Text("Info")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.leading, 24.0)
                        Spacer()
                    }
                    ZStack {
                        Rectangle()
                            .frame(height: 124)
                            .foregroundColor(grayColor)
                            .cornerRadius(16)
                        VStack (spacing: 16) {
                            HStack {
                                Text("Species:")
                                Spacer()
                                Text(character.species)
                                    .bold()
                            }
                            HStack {
                                Text("Type:")
                                Spacer()
                                Text(character.type)
                                    .bold()
                            }
                            HStack {
                                Text("Gender:")
                                Spacer()
                                Text(character.gender)
                                    .bold()
                            }
                        }.foregroundColor(.white)
                            .padding(.horizontal, 16)
                    }.padding([.leading, .bottom, .trailing], 20)
                    // MARK: - Origin
                    
                    HStack {
                        Text("Origin")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.leading, 24.0)
                        Spacer()
                    }
                    ZStack {
                        Rectangle()
                            .frame(height: 80)
                            .foregroundColor(grayColor)
                            .cornerRadius(16)
                        HStack {
                            ZStack {
                                Rectangle()
                                    .frame(width: 64, height: 64)
                                    .foregroundColor(Color(red: 25/256, green: 28/256, blue: 42/256))
                                    .cornerRadius(16)
                                    .padding(8)
                                Image("Planet")
                            }
                            VStack (spacing: 10) {
                                HStack {
                                    Text(character.location.name)
                                        .bold()
                                    Spacer()
                                }
                                HStack {
                                    Text("Planet")
                                        .font(.system(size: 16))
                                        .foregroundColor(greenColor)
                                    Spacer()
                                }
                            }
                            .foregroundColor(.white)
                        }
                    }.padding([.leading, .bottom, .trailing], 20)
                    
                    // MARK: - Episode
                    HStack {
                        Text("Episodes")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.leading, 24.0)
                        Spacer()
                    }
                    
                    ForEach(episodes, id: \.self) { episode in
                        ZStack {
                            Rectangle()
                                .frame(height: 86)
                                .foregroundColor(grayColor)
                                .cornerRadius(16)
                            VStack (spacing: 10) {
                                HStack {
                                    Text(episode.name)
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

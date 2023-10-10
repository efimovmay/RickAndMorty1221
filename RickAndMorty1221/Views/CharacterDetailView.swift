//
//  CharacterDetailView.swift
//  RickAndMorty1221
//
//  Created by Aleksey Efimov on 21.08.2023.
//

import SwiftUI
import Combine


struct CharacterDetailView: View {
    
    var character: Character!

    var body: some View {
            ZStack {
                Color(uiColor: Colors.backgroundColor.getColor())
                    .edgesIgnoringSafeArea(.all)
                ScrollView {

                VStack {
                    HeadView(character: character)
                    InfoView(character: character)
                    OriginView(character: character)
                    EpisodesView(character: character)
                }
            }
        }
    }
}


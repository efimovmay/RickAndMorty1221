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
    
    let greenColor = Color(red: 71/256, green: 198/256, blue: 11/256)
    let backgroundColor = CGColor(red: 4/256, green: 12/256, blue: 30/256, alpha: 1)
    let grayColor = Color(red: 38/256, green: 42/256, blue: 56/256)

    var body: some View {
            ZStack {
                Color(backgroundColor)
                    .edgesIgnoringSafeArea(.all)
                ScrollView {

                VStack {
                    HeadView(character: character, greenColor: greenColor)
                    InfoView(character: character, grayColor: grayColor)
                    OriginView(character: character, greenColor: greenColor, grayColor: grayColor)
                    EpisodesView(character: character, greenColor: greenColor, grayColor: grayColor)
                }
            }
        }
    }
}


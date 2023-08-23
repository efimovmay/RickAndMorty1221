//
//  InfoView.swift
//  RickAndMorty1221
//
//  Created by Aleksey Efimov on 23.08.2023.
//

import SwiftUI

struct InfoView: View {
    let character: Character
    let grayColor: Color
    
    var body: some View {
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
    }
}
//
//struct InfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        InfoView()
//    }
//}

//
//  HeadView.swift
//  RickAndMorty1221
//
//  Created by Aleksey Efimov on 23.08.2023.
//

import SwiftUI

struct HeadView: View {
    let character: Character
    
    var body: some View {
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
            .foregroundColor(Color(Colors.greenTextColor.getColor()))
            .padding(.bottom, 20.0)
    }
}

//struct HeadView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeadView()
//    }
//}

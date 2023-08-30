//
//  OriginView.swift
//  RickAndMorty1221
//
//  Created by Aleksey Efimov on 23.08.2023.
//

import SwiftUI

struct OriginView: View {
    let character: Character
    
    var body: some View {
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
                .foregroundColor(Color(Colors.viewsColor.getColor()))
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
                            .foregroundColor(Color(Colors.greenTextColor.getColor()))
                        Spacer()
                    }
                }
                .foregroundColor(.white)
            }
        }.padding([.leading, .bottom, .trailing], 20)
    }
}

//struct OriginView_Previews: PreviewProvider {
//    static var previews: some View {
//        OriginView()
//    }
//}

//
//  ContentView.swift
//  Memorize
//
//  Created by André Arns on 04/06/21.
//

import SwiftUI

struct ContentView: View {
    let viewModel: EmojiMemoryGame
    
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text("Memorize!")
                        .bold()
                        .font(.title)
                        .padding()
                }
                ScrollView {
                    Spacer()
                    VStack {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]){
                            ForEach(viewModel.cards) { card in
                                CardView(card: card)
                            }.aspectRatio(2/3, contentMode: .fit)
                        }
                    }.padding(.horizontal)
                }
                HStack {
                    
                }
                .font(.largeTitle)
                .foregroundColor(.blue)
            }
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 15.0)
                
                if card.isFacedUp {
                    shape.stroke(lineWidth: 4.0).foregroundColor(.red)
                    shape.foregroundColor(.white)
                    Text(card.content).font(.system(size: 35))
                } else {
                    shape.foregroundColor(.red)
                }
            }
    }
}














struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}

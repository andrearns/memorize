//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by AndrΓ© Arns on 06/06/21.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["β€οΈ", "π₯©", "π½", "π§π»ββοΈ", "π¨βπ", "π€―", "π", "π", "π€", "β³", "βοΈ", "π₯", "π¦·", "π¦Ύ", "π", "β οΈ"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }

    private var model: MemoryGame<String> = createMemoryGame()
        
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}

//
//  MemorizeApp.swift
//  Memorize
//
//  Created by André Arns on 04/06/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}

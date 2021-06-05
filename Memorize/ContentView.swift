//
//  ContentView.swift
//  Memorize
//
//  Created by André Arns on 04/06/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["❤️", "🥩", "👽", "🧘🏻‍♂️", "👨‍🚀", "🤯", "🚀", "🏆", "🤘", "⏳", "☕️", "🥐", "🦷", "🦾", "👁", "⚠️"]
    @State var emojiCount = 4
    
    var body: some View {
        let sortedEmojis = emojis.sorted()
        
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
                            ForEach(sortedEmojis[0..<emojiCount], id: \.self) { emoji in
                                CardView(emoji: emoji)
                            }.aspectRatio(2/3, contentMode: .fit)
                        }
                    }.padding(.horizontal)
                }
                HStack {
                    Spacer()
                    Button(action: {
                        if emojiCount > 0 {
                            emojiCount -= 1
                        }
                    }) {
                        Image(systemName: "minus.circle")
                    }
                    Spacer()
                    Text("Shuffle")
                    Spacer()
                    Button(action: {
                        if emojiCount < emojis.count {
                            emojiCount += 1
                        }
                    }) {
                        Image(systemName: "plus.circle")
                    }
                    Spacer()
                }
                .font(.largeTitle)
                .foregroundColor(.blue)
            }
        }
    }
}

struct CardView: View {
    var emoji: String
    @State var isFacedUp = false
    
    var body: some View {
        
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 15.0)
                
                if isFacedUp {
                    shape.stroke(lineWidth: 4.0).foregroundColor(.red)
                    shape.foregroundColor(.white)
                    Text(emoji).font(.system(size: 35))
                } else {
                    shape.foregroundColor(.red)
                }
            }.onTapGesture {
                if isFacedUp {
                    isFacedUp = false
                } else {
                    isFacedUp = true
                }
            }
    }
}














struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}

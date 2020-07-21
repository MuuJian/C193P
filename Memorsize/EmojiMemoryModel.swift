//
//  EmojiMemoryModel.swift
//  Memorsize
//
//  Created by mumu on 19/7/2020.
//  Copyright © 2020 mumu. All rights reserved.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject{
	@Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
	
	static func createMemoryGame() -> MemoryGame<String>{
		//MemoryGame<String>(numberOfPairsOfCards: 2){_ in "👻"}
		//let emojis :  Array<String>
		let emojis = ["👻", "🎃", "🕷"]
		return MemoryGame<String>(numberOfPairsOfCards: emojis.count, cardContentFactory: {(pairIndex: Int) -> String in
			 return emojis[pairIndex]
		})
	}

	
	var cards: Array<MemoryGame<String>.Card>{
		model.cards
	}
	
	func choose(card: MemoryGame<String>.Card){
		model.choose(card: card)
	}
}

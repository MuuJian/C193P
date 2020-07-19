//
//  File.swift
//  Memorsize
//
//  Created by mumu on 19/7/2020.
//  Copyright © 2020 mumu. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent>{
	var cards: Array<Card>
	
	func choose(card: Card) {
		print("card choose \(card)")
	}
	
	init(numberOfPairsOfCards: Int, cardContentFactory:(Int) -> CardContent){
		cards = Array<Card>()
		for pairIndex in 0..<numberOfPairsOfCards{
			let content = cardContentFactory(pairIndex)
			cards.append(Card(content: content, id: pairIndex * 2))
			cards.append(Card(content: content, id: pairIndex * 2 + 1))
		}
	}
	

	
	struct Card: Identifiable{
		var isFaceUp: Bool = true
		var isMatched: Bool = false
		var content: CardContent
		var id: Int
	}
}

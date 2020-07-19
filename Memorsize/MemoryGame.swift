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
	
	mutating func choose(card: Card) {
		print("card choose \(card)")
		let chosenIndex = self.index(of: card)
		self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
	}
	
	func index(of card: Card) -> Int{
		for index in 0..<self.cards.count{
			if self.cards[index].id == card.id{
				return index
			}
		}
		return 0 // TODO: bogus
	}

	
	init(numberOfPairsOfCards: Int, cardContentFactory:(Int) -> CardContent){
		cards = Array<Card>()
		for pairIndex in 0..<numberOfPairsOfCards{
			let content = cardContentFactory(pairIndex)
			cards.append(Card(content: content, id: pairIndex * 2))
			cards.append(Card(content: content, id: pairIndex * 2 + 1))
		}
		for indexOf in (0..<cards.count).reversed(){
			let index = Int.random(in: 0..<cards.count) % (indexOf + 1)
			let temp = cards[indexOf]
			cards[indexOf] = cards[index]
			cards[index] = temp
		}
		
	}


	
	struct Card: Identifiable{
		var isFaceUp: Bool = false
		var isMatched: Bool = false
		var content: CardContent
		var id: Int
	}
}

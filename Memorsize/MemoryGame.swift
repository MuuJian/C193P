//
//  File.swift
//  Memorsize
//
//  Created by mumu on 19/7/2020.
//  Copyright © 2020 mumu. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
	private(set) var cards: Array<Card>
	
	private var indexOfTheOneAndOnlyFaceUpCard: Int?{
		get{
			cards.indices.filter { index in cards[index].isFaceUp}.only
			/*
			let faceUpCardIndicse = cards.indices.filter { index in cards[index].isFaceUp}
			if faceUpCardIndecse.count == 1{
				return faceUpCardIndecse.first
			}else{
				return nil
			}
			*/
		}
		set{
			for index in cards.indices{
				cards[index].isFaceUp = index == newValue // newValue是set内建的参数
				//选择点击的卡片翻转 其他掩盖
			}
		}
		/*
		get{
			var faceUpCardIndices = [Int]()
			for index in cards.indices{
				if cards[index].isFaceUp{
					faceUpCardIndices.append(index)
				}
			}
			if faceUpCardIndices.count == 1{
				return faceUpCardIndices.first
			}else{
				return nil
			}
		}
		
		
		set{
			for index in cards.indices{
				if index == newValue{
					cards[index].isFaceUp = true
				}else{
					cards[index].isFaceUp = false
				}
			}
		}
		*/
	}
	
	mutating func choose(card: Card) {
		if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{ //chosenIndex 点击的卡片
			if let potentialMatchingIndex = indexOfTheOneAndOnlyFaceUpCard{
				if cards[chosenIndex].content == cards[potentialMatchingIndex].content{
					cards[chosenIndex].isMatched = true
					cards[potentialMatchingIndex].isMatched = true
				}
				self.cards[chosenIndex].isFaceUp = true
			}else{
				indexOfTheOneAndOnlyFaceUpCard = chosenIndex
			}
		}
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

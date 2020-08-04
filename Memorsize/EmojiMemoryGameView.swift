//
//  EmojiMemoryGameView.swift
//  Memorsize
//
//  Created by mumu on 18/7/2020.
//  Copyright © 2020 mumu. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
	@ObservedObject var viewModel: EmojiMemoryGame
	
    var body: some View {
		/*
		HStack(content:{
			ForEach(viewModel.cards) { card in
				CardView(card: card).onTapGesture {
					self.viewModel.choose(card: card)
				}
			}
		})
		*/
		//lambda语法
		Grid(viewModel.cards) { card in
				CardView(card: card).onTapGesture {
					self.viewModel.choose(card: card)
				}
			}
			.padding()
			.foregroundColor(Color.orange)
    }
}

struct CardView: View {
	var card: MemoryGame<String>.Card
	
	var body: some View {
		GeometryReader {geometry in
			self.body(for: geometry.size)
		}
	}
	
	func body(for size: CGSize) -> some View{
		ZStack() {
				if self.card.isFaceUp {
					RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
					RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
					Text(self.card.content)
				}
				else {
					RoundedRectangle(cornerRadius: 10.0).fill()
				}
			}
			.font(Font.system(size: min(size.width, size.height) * 0.75))
	}
	
	// MARK: Drawing Constants
	let cornerRadius: CGFloat = 10.0
	let edgeLineWidth: CGFloat = 3
	let fontScalaFactor: CGFloat = 0.75
	
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

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
		VStack{
			Grid(viewModel.cards) { card in
					CardView(card: card).onTapGesture {
						withAnimation(.linear(duration: 0.75)){
							self.viewModel.choose(card: card)
						}
					}
					.padding()
				}
				.padding()
				.foregroundColor(Color.orange)
			Button {
				//action:{}
				withAnimation(.easeInOut){
					self.viewModel.resetGame()
				}
			}label: {
				Text("New Game")
			}

		}
    }
}


struct CardView: View {
	var card: MemoryGame<String>.Card
	
	
	var body: some View {
		GeometryReader {geometry in
			self.body(for: geometry.size)
		}
	}
	
	@ViewBuilder
	private func body(for size: CGSize) -> some View{
		if card.isFaceUp || !card.isMatched{
			ZStack() {
				Pie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees(110 - 90), clockwise: true)
					.padding(5).opacity(0.4)
				Text(self.card.content)
					.font(Font.system(size: min(size.width, size.height) * 0.75))
					.rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
					.animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
			}
			.cardify(isFaceUp: card.isFaceUp)
			//.modifier(Cardify(isFaceUp: card.isFaceUp))
			.transition(AnyTransition.scale)
			}
	}
	
	// MARK: Drawing Constants

	private func fontSize(for size: CGSize) -> CGFloat{
		return min(size.height, size.width) * 0.7
	}
	
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		let game = EmojiMemoryGame()
		game.choose(card: game.cards[0])
		return Group {
			EmojiMemoryGameView(viewModel: game)
			EmojiMemoryGameView(viewModel: game)
		}
    }
}

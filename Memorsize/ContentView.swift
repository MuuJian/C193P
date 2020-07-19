//
//  ContentView.swift
//  Memorsize
//
//  Created by mumu on 18/7/2020.
//  Copyright © 2020 mumu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	var viewModel: EmojiMemoryGame
	
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
		HStack(){
			ForEach(viewModel.cards) { card in
				CardView(card: card).onTapGesture {
					self.viewModel.choose(card: card)
				}
			}
		}
			.padding()
			.foregroundColor(Color.orange)
			.font(Font.largeTitle)
    }
}

struct CardView: View {
	var card: MemoryGame<String>.Card
	
	var body: some View {
		ZStack() {
			if card.isFaceUp {
				RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
				RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
				Text(card.content)
			}
			else {
				RoundedRectangle(cornerRadius: 10.0).fill()
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}

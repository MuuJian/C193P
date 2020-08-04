//
//  Grid.swift
//  Memorsize
//
//  Created by mumu on 4/8/2020.
//  Copyright © 2020 mumu. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View {
	var items: [Item]
	var viewForItem: (Item) -> ItemView
	
	init(_ items: [Item], viewForItem:@escaping (Item) -> ItemView){
		self.items = items
		self.viewForItem = viewForItem
	}
	
    var body: some View {
        Text("Fuck, World!")
    }
}


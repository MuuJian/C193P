//
//  Array+Identifiable.swift
//  Memorsize
//
//  Created by mumu on 4/8/2020.
//  Copyright © 2020 mumu. All rights reserved.
//

import Foundation


extension Array where Element: Identifiable{
	func firstIndex(matching: Element) -> Int?{
		for index in 0..<self.count{
			if self[index].id == matching.id{
				return index
			}
		}
		return nil //TODO bogus
	}
}

//
//  Array+only.swift
//  Memorsize
//
//  Created by mumu on 5/8/2020.
//  Copyright © 2020 mumu. All rights reserved.
//

import Foundation


extension Array{
	var only: Element?{
		count == 1 ? first : nil
	}
}

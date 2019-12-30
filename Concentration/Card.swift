//
//  Card.swift
//  Concentration
//
//  Created by Ikram Gabiyev on 12/26/19.
//  Copyright © 2019 Ikram Gabiyev. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var idFactory = 0
    
    static func getUniqueId() -> Int
    {
        Card.idFactory += 1
        return Card.idFactory;
    }
    
    init()
    {
        self.identifier = Card.getUniqueId()
    }
}

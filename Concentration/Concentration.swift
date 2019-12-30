//
//  Concentration.swift
//  Concentration
//
//  Created by Ikram Gabiyev on 12/26/19.
//  Copyright © 2019 Ikram Gabiyev. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int)
    {
        if !cards[index].isMatched
        {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index
            {
                if cards[matchIndex].identifier == cards[index].identifier
                {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            //either no cards or 2 cards are faceUp
            else
            {
                for flipDownIndex in cards.indices
                {
                    cards[flipDownIndex].isFaceUp = false
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numOfPairsOfCards: Int)
    {
        for _ in 1...numOfPairsOfCards
        {
            let card = Card()
            self.cards += [card, card]
        }
        
        //TODO: shuffle the cards
        
        for index in 0..<self.cards.count
        {
            //random index
            let randIndex = Int.random(in: 0..<self.cards.count)
            //swapping with a random spot
            let tempCard = self.cards[randIndex]
            self.cards[randIndex] = self.cards[index]
            self.cards[index] = tempCard
        }
    }
}

//
//  ViewController.swift
//  Concentration
//
//  Created by Ikram Gabiyev on 12/21/19.
//  Copyright © 2019 Ikram Gabiyev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //connecting to the model
    lazy var game = Concentration(numOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else {
            print("chosen button not in cardButtons")
        }
    }
    
    func updateViewFromModel()
    {
        for index in self.cardButtons.indices
        {
            let button = self.cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp
            {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else
            {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🏴‍☠️", "🎃", "👻", "🤯", "🦊", "🐍", "👹", "🕸"]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String
    {
        if emoji[card.identifier] == nil, emojiChoices.count > 0
        {
            let randIndex = Int.random(in: 0..<emojiChoices.count)
            emoji[card.identifier] = emojiChoices.remove(at: randIndex)
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
}


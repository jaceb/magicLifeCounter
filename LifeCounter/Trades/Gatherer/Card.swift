//
//  Card.swift
//  LifeCounter
//
//  Created by Jace on 4/23/18.
//  Copyright © 2018 Jace Briggs. All rights reserved.
//

import Foundation

class Card {
    var name : String = ""
    var manaCost: String = ""
    var cmc: Int = 0
    var colors: String = ""
    var type: String = ""
    var rarity: String = ""
    var set: String = ""
    var imageUrl: String = ""
    var toughness: Int = 0
    var power: Int = 0
    var artist: String = ""
    var text: String = ""
    
    init(name : String, manaCost: String, cmc: Int, colors: String, type: String, rarity: String, set: String, imageUrl: String, toughness: Int, power: Int, artist: String, text: String) {
        self.name = name
        self.manaCost = manaCost
        self.cmc = cmc
        self.colors = colors
        self.type = type
        self.rarity = rarity
        self.set = set
        self.imageUrl = imageUrl
        self.toughness = toughness
        self.power = power
        self.artist = artist
        self.text = text
    }
}

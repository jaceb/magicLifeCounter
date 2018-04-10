//
//  poisonCell.swift
//  LifeCounter
//
//  Created by Jace on 3/10/18.
//  Copyright © 2018 Jace Briggs. All rights reserved.
//

import UIKit



class PoisonCell: UITableViewCell {
    var poisonTotal: Int = 0
    @IBOutlet  weak var poisonLabel: UILabel!
    @IBAction func plusPoison(_ sender: Any) {
        poisonTotal += 1
        poisonLabel.text = "\(poisonTotal)"
    }
    @IBAction func minusPoison(_ sender: Any) {
        if poisonTotal <= 0 {
            poisonTotal = 0
        } else {
        poisonTotal -= 1
        poisonLabel.text = "\(poisonTotal)"
        }
    }
    func resetPoison() {
        poisonTotal = 0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

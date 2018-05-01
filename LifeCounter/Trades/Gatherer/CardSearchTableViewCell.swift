//
//  CardSearchTableViewCell.swift
//  LifeCounter
//
//  Created by Jace on 4/23/18.
//  Copyright © 2018 Jace Briggs. All rights reserved.
//

import UIKit

class CardSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var cardPreviewPowerToughness: UILabel!
    @IBOutlet weak var cardPreviewName: UILabel!
    @IBOutlet weak var cardPreviewImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

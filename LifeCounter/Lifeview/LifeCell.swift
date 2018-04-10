//
//  LifeCell.swift
//  LifeCounter
//
//  Created by Jace on 3/10/18.
//  Copyright © 2018 Jace Briggs. All rights reserved.
//

import UIKit


protocol LifeCellDelegate {
    func makePoisonAt(indexPath: IndexPath?)
}

class LifeCell: UITableViewCell {

    var lifeTotal: Int = 20
    var delegate: LifeCellDelegate?
    var indexPath: IndexPath?
    var totalWins: [String] = []
    
    @IBOutlet weak var lifeLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    
    
    
    @IBAction func addOneLife(_ sender: Any) {
        addLifeToTotal(1)
    }
    @IBAction func minusOneLife(_ sender: Any) {
        minusLifeFromTotal(1)
    }
    
    @IBAction func addWin(_ sender: Any) {
        
        if totalWins.count < 1 {
        totalWins.append("I")
        winsLabel.text = totalWins.joined()
        } else if totalWins.count == 1 {
            totalWins.append("I")
            winsLabel.text = totalWins.joined()
            
        }
        
    }
    
    
    func minusLifeFromTotal(_ lifeLost: Int) {
        lifeTotal -= lifeLost
        lifeLabel.text = "\(lifeTotal)"
    }
    
    func addLifeToTotal(_ lifeGained: Int) {
        lifeTotal += lifeGained
        lifeLabel.text = "\(lifeTotal)"
    }
    
    @IBAction func insertPoisonButton(_ sender: Any) {
        delegate?.makePoisonAt(indexPath: indexPath)
        
    }
    
    func resetCell() {
        lifeTotal = 20
        lifeLabel.text = "\(lifeTotal)"

    }
    
    func resetWins() {
   
        totalWins.removeAll()
        winsLabel.text = totalWins.joined()

    }
        
}
    


@IBDesignable public extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }

}



//
//  LifeCell.swift
//  LifeCounter
//
//  Created by Jace on 3/10/18.
//  Copyright © 2018 Jace Briggs. All rights reserved.
//

import UIKit




class LifeCell: UITableViewCell {

    var lifeTotal: Int = 20
    
    @IBOutlet weak var lifeLabel: UILabel!
    
    @IBAction func addOneLife(_ sender: Any) {
        addLifeToTotal(1)
    }
    @IBAction func minusOneLife(_ sender: Any) {
        minusLifeFromTotal(1)
    }
    
    @IBAction func addWin(_ sender: Any) {
        
    }
    
    
    func minusLifeFromTotal(_ lifeLost: Int) {
        lifeTotal -= lifeLost
        lifeLabel.text = "\(lifeTotal)"
    }
    
    func addLifeToTotal(_ lifeGained: Int) {
        lifeTotal += lifeGained
        lifeLabel.text = "\(lifeTotal)"
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

//
//  Header.swift
//  LifeCounter
//
//  Created by Jace on 3/10/18.
//  Copyright © 2018 Jace Briggs. All rights reserved.
//

import UIKit

protocol LifeHeaderDelegate {
    func addAnotherPlayer()
    
}

class MyTableHeader: UIView {
 
    
    var headerDelegate : LifeHeaderDelegate?
    
    @IBAction func addPlayer(_ sender: Any) {
        headerDelegate?.addAnotherPlayer()
        
    }
 
    
}



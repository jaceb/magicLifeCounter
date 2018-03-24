//
//  resetPopupViewController.swift
//  LifeCounter
//
//  Created by Jace on 3/12/18.
//  Copyright © 2018 Jace Briggs. All rights reserved.
//

import UIKit



class resetPopupViewController: UIViewController {
 
    @IBAction func resetGameButton(_ sender: Any) {
        var resetGameLifeDelegate : resetLifeTableDelegate?
        resetGameLifeDelegate?.resetGame()
    }
    
    @IBAction func resetMatchButton(_ sender: Any) {
        var resetMatchLifeDelegate : resetLifeTableDelegate?
        resetMatchLifeDelegate?.resetMatch()
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
extension resetPopupViewController: resetLifeTableDelegate {
    func resetGame() {
        LifeViewController().lifeCells = [["Player 1"]]
        LifeViewController().tableView.reloadData()
    }
    func resetMatch() {
        print("reset")
    }
}

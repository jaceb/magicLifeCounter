//
//  StormViewController.swift
//  LifeCounter
//
//  Created by Jace on 3/23/18.
//  Copyright © 2018 Jace Briggs. All rights reserved.
//

import UIKit

class StormViewController: UIViewController {
    
    var stormTotal:Int = 0
    var whiteManaTotal:Int = 0
    var blackManaTotal:Int = 0
    var greenManaTotal:Int = 0
    var redManaTotal:Int = 0
    var blueManaTotal:Int = 0
    
    @IBOutlet weak var stormLabel: UILabel!
    
    @IBAction func stormPlusClicked(_ sender: Any) {
        stormTotal += 1
        stormLabel.text = "\(stormTotal)"
    }
    @IBAction func stormMinusClicked(_ sender: Any) {
        if stormTotal <= 0 {
            stormTotal = 0
        } else {
            stormTotal -= 1
        }
        stormLabel.text = "\(stormTotal)"
    }
    

    @IBOutlet weak var whiteManaLabel: UILabel!
    
    @IBAction func whiteManaPlus(_ sender: Any) {
        whiteManaTotal += 1
        whiteManaLabel.text = "\(whiteManaTotal)"
    }
    @IBAction func whiteManaMinus(_ sender: Any) {
        
        if whiteManaTotal <= 0 {
            whiteManaTotal = 0
        } else {
            whiteManaTotal -= 1
        }
        whiteManaLabel.text = "\(whiteManaTotal)"
    }
    @IBOutlet weak var blackManaLabel: UILabel!
    
    @IBAction func blackManaPlus(_ sender: Any) {
        blackManaTotal += 1
        blackManaLabel.text = "\(blackManaTotal)"
    }
    
    @IBAction func blackManaMinus(_ sender: Any) {
        if blackManaTotal <= 0 {
            blackManaTotal = 0
        } else {
            blackManaTotal -= 1
        }
        blackManaLabel.text = "\(blackManaTotal)"
    }
    @IBOutlet weak var greenManaLabel: UILabel!
    
    @IBAction func greenManaPlus(_ sender: Any) {
        greenManaTotal += 1
        greenManaLabel.text = "\(greenManaTotal)"
    }
    
    @IBAction func greenManaMinus(_ sender: Any) {
        if greenManaTotal <= 0 {
            greenManaTotal = 0
        } else {
            greenManaTotal -= 1
        }
        greenManaLabel.text = "\(greenManaTotal)"
    }
    
    @IBOutlet weak var redManaLabel: UILabel!
    
    @IBAction func redmanaPlus(_ sender: Any) {
        redManaTotal += 1
        redManaLabel.text = "\(redManaTotal)"
    }
    @IBAction func redmanaMinus(_ sender: Any) {
        if redManaTotal <= 0 {
            redManaTotal = 0
        } else {
            redManaTotal -= 1
        }
        redManaLabel.text = "\(redManaTotal)"
    }
    
    @IBOutlet weak var blueManaLabel: UILabel!
    
    
    @IBAction func blueManaPlus(_ sender: Any) {
        blueManaTotal += 1
        blueManaLabel.text = "\(blueManaTotal)"
    }
    @IBAction func blueManaMinus(_ sender: Any) {
        if blueManaTotal <= 0 {
            blueManaTotal = 0
        } else {
            blueManaTotal -= 1
        }
        blueManaLabel.text = "\(blueManaTotal)"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

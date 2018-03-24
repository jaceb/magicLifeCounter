//
//  LifeViewController.swift
//  LifeCounter
//
//  Created by Jace on 3/10/18.
//  Copyright © 2018 Jace Briggs. All rights reserved.
//

import UIKit

protocol resetLifeTableDelegate {
    func resetMatch()
    func resetGame()
}

class LifeViewController: UIViewController {
    
    var lifeCells = [["Player 1"]]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        self.tableView.sectionHeaderHeight = 54    }

//anything in this file can use it
    fileprivate func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        //clears out all lines after the row but keeps lines in between rows
       self.tableView.tableFooterView = UIView()
        
        let headerView: MyTableHeader? = tableView.tableHeaderView as? MyTableHeader
        headerView?.headerDelegate = self
        
    }


}



//MARK: - TableView Delegate and Datasource

extension LifeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return lifeCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: LifeCell = tableView.dequeueReusableCell(withIdentifier: "lifeCell") as? LifeCell ?? LifeCell()
        return cell
        
    }
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return MyTableHeader()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 196
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }

}

//MARK: - LifeHeader Delegate

extension LifeViewController: LifeHeaderDelegate {
    func addAnotherPlayer() {
        lifeCells.append(["Player 2"])
        tableView.reloadData()
    }
    
    
}


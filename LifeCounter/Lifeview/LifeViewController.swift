//
//  LifeViewController.swift
//  LifeCounter
//
//  Created by Jace on 3/10/18.
//  Copyright © 2018 Jace Briggs. All rights reserved.
//

import UIKit


protocol ResetDelegate {
    func resetCellLife()
    func resetCellWins()
    func resetCellPoison()
}

class LifeViewController: UIViewController {
    
    var lifeCells = [["Player"]]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        self.tableView.sectionHeaderHeight = 54
        

    }

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
        return lifeCells[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if lifeCells[indexPath.section][indexPath.row] == "Player" {
            let cell: LifeCell = tableView.dequeueReusableCell(withIdentifier: "lifeCell") as? LifeCell ?? LifeCell()
            cell.delegate = self
            cell.indexPath = indexPath
            
            return cell
        } else {
            let cell: PoisonCell = tableView.dequeueReusableCell(withIdentifier: "poisonCell") as? PoisonCell ?? PoisonCell()
            return cell
        }
    }
        
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if lifeCells[indexPath.section][indexPath.row] == "Player" {
        let resetGame = UIContextualAction(style: .normal, title: "Reset Life") {
            (action, view, nil) in
            
            let cell: LifeCell = tableView.cellForRow(at: indexPath) as? LifeCell ?? LifeCell()
            print("reset game")
            cell.resetCell()
            tableView.setEditing(false, animated: true)

            tableView.reloadRows(at: [indexPath], with: .none)
            }
            let resetCellWins = UIContextualAction(style: .normal, title: "Reset Wins") {
                (action, view, nil) in
                let cell: LifeCell = tableView.cellForRow(at: indexPath) as? LifeCell ?? LifeCell()
                 tableView.setEditing(false, animated: true)
                cell.resetWins()
                tableView.reloadRows(at: [indexPath], with: .none)

                print("reset wins")
                
        }
            resetGame.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            resetCellWins.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        let config = UISwipeActionsConfiguration(actions: [resetGame, resetCellWins])
        config.performsFirstActionWithFullSwipe = false
        return config
        } else {
            
            let resetPoison = UIContextualAction(style: .normal, title: "Reset Poison") {
                (action, view, nil) in
                let cell: PoisonCell = tableView.cellForRow(at: indexPath) as? PoisonCell ?? PoisonCell()
                 tableView.setEditing(false, animated: true)
                cell.resetPoison()
                
                tableView.reloadRows(at: [indexPath], with: .none)

                print("reset poison")
                
            }
            let config = UISwipeActionsConfiguration(actions: [resetPoison])

                config.performsFirstActionWithFullSwipe = false
            
                return config
        }


    }
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return lifeCells.count
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return MyTableHeader()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if lifeCells[indexPath.section][indexPath.row] == "Player" {
        return 176
        }
        else {
            return 74
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    
 


}

//MARK: - LifeHeader Delegate

extension LifeViewController: LifeHeaderDelegate {
    func addAnotherPlayer() {
        lifeCells.append(["Player"])
        tableView.reloadData()
    }
    
    
}

extension LifeViewController: LifeCellDelegate {
    
    func makePoisonAt(indexPath: IndexPath?) {
        if !lifeCells[indexPath!.section].contains("Poison") {
            lifeCells[indexPath!.section].append("Poison")
            tableView.reloadData()
        }
    }
}



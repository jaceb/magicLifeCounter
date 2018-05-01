//
//  CarListViewController.swift
//  LifeCounter
//
//  Created by Jace on 4/17/18.
//  Copyright © 2018 Jace Briggs. All rights reserved.
//

import UIKit

class CardListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cardSearchList: [[String:Any]] = [["name" : "Jace, the me sculptor", "power" : 4, "toughness" : 4, "imageUrl" : #imageLiteral(resourceName: "storm") ]]
  
    @IBAction func searchActionClick(_ sender: Any) {
    tableView.reloadData()
        print(cardSearchList)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension CardListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardSearchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CardSearchTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cardSearchTableViewCell") as? CardSearchTableViewCell ?? CardSearchTableViewCell()
        var myCards = cardSearchList[indexPath.row]
        cell.cardPreviewName.text = myCards["name"] as? String
        cell.cardPreviewPowerToughness.text = "\(myCards["power"])" + "/" + "\(myCards["toughness"])"
        cell.cardPreviewImage.image = #imageLiteral(resourceName: "storm")
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let addToMyCollection = UIContextualAction(style: .normal, title: "Add to My Collection") {
                (action, view, nil) in
                
                let cell: CardSearchTableViewCell = tableView.cellForRow(at: indexPath) as? CardSearchTableViewCell ?? CardSearchTableViewCell()
                print("added to collection")
                tableView.setEditing(false, animated: true)
                
                tableView.reloadRows(at: [indexPath], with: .none)
            }
        
            addToMyCollection.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            addToMyCollection.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
            let config = UISwipeActionsConfiguration(actions: [addToMyCollection])
            config.performsFirstActionWithFullSwipe = false
            return config
        
        
        
    }
    
}

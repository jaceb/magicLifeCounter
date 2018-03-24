//
//  NotesViewController.swift
//  LifeCounter
//
//  Created by Jace on 3/18/18.
//  Copyright © 2018 Jace Briggs. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {

    
    var gamesNoteBook: [String] = ["Add A Note"]
    let vc = NotesEditorViewController()
    
    
    @IBOutlet weak var notesTextView: UITextView!
    
    @IBOutlet weak var tableView: UITableView!
   
    @IBAction func addNoteClick(_ sender: Any?){
        
    }
        
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
  
    
}



//Mark: TableView delegate and datasource
extension NotesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    

    func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NoteCell = tableView.dequeueReusableCell(withIdentifier: "noteCell") as? NoteCell ?? NoteCell()
       cell.previewLabel.text = gamesNoteBook[indexPath.row]
        cell.titleLabel.text = "Game /(indexPath.row + 1)"
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ notesTableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        notesTableView.deselectRow(at: indexPath, animated: true)
   
    }
        
    
    func tableView(_ notesTableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ notesTableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    func tableView(_ notesTableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
}


// Mark: DoneClickDelegate

extension NotesViewController: DoneClickDelegate{
    func applyText() {
        
        print("in the delegate")
        
        tableView.reloadData()
    }
    
    
}

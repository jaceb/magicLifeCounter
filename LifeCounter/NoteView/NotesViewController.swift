//
//  NotesViewController.swift
//  LifeCounter
//
//  Created by Jace on 3/18/18.
//  Copyright © 2018 Jace Briggs. All rights reserved.
//

import UIKit

protocol EditNoteDelegate {
    func editNote(cellIdx: Int, newNote: Bool)
}

class NotesViewController: UIViewController {

    var selectedIndex: Int = 0
    
    var gamesNoteBook: [String] = []
    var editDelegate: EditNoteDelegate?
    
    @IBOutlet weak var notesTextView: UITextView!
    
    @IBOutlet weak var tableView: UITableView!
   
    @IBAction func addNoteClick(_ sender: Any?){
        gamesNoteBook.append("")
        print(gamesNoteBook)
       selectedIndex = gamesNoteBook.endIndex - 1
        print("here is the selected index\(selectedIndex)")
        editDelegate?.editNote(cellIdx: gamesNoteBook.endIndex - 1, newNote: true)
        self.performSegue(withIdentifier: "addNoteClick", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nevc: NotesEditorViewController = segue.destination as? NotesEditorViewController {
            nevc.doneDelegate = self
           nevc.defaultNoteIndex = selectedIndex
            print("notesview prepare \(selectedIndex) ")
            if segue.identifier == "editNote" && selectedIndex < gamesNoteBook.count{
                nevc.previousNoteText = gamesNoteBook[selectedIndex]
            }
        }
    }
    
}



//Mark: TableView delegate and datasource
extension NotesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamesNoteBook.count
    }
    

    func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NoteCell = tableView.dequeueReusableCell(withIdentifier: "noteCell") as? NoteCell ?? NoteCell()
       cell.previewLabel.text = gamesNoteBook[indexPath.row]
        cell.titleLabel.text = "Game \(indexPath.row + 1)"
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.selectedIndex = indexPath.row
        editDelegate?.editNote(cellIdx: self.selectedIndex, newNote: false)
        print("\(selectedIndex)")

        self.performSegue(withIdentifier: "editNote", sender: nil)
    }
        
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let deleteNote = UIContextualAction(style: .normal, title: "Delete") {
                (action, view, nil) in
                
                let cell: NoteCell = tableView.cellForRow(at: indexPath) as? NoteCell ?? NoteCell()
                tableView.setEditing(false, animated: true)
                self.gamesNoteBook.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
//                tableView.reloadRows(at: [indexPath], with: .none)

                
            }
            deleteNote.backgroundColor = #colorLiteral(red: 1, green: 0.1191273257, blue: 0, alpha: 1)
            let config = UISwipeActionsConfiguration(actions: [deleteNote])
            config.performsFirstActionWithFullSwipe = false
            return config
        
    }
}


// Mark: DoneClickDelegate

extension NotesViewController: DoneClickDelegate{
    func applyText(text: String, idx: Int) {
        gamesNoteBook[idx] = text
        print(gamesNoteBook)
        tableView.reloadData()
   
    }
    
    
}

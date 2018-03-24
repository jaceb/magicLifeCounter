//
//  NotesEditorViewController.swift
//  LifeCounter
//
//  Created by Jace on 3/19/18.
//  Copyright © 2018 Jace Briggs. All rights reserved.
//

import UIKit


protocol DoneClickDelegate {
    func applyText()
}

class NotesEditorViewController: UIViewController {

    var editableNoteBook: [String] = []
    var noteIndex: Int = 0
    var doneDelegate: DoneClickDelegate?
    
    
    @IBOutlet weak var notesTextView: UITextView!
    
   
    
    
    @IBAction func doneNoteButtonClick(_ sender: Any) {
        textViewDidEndEditing(notesTextView)
        editableNoteBook.insert(notesTextView.text, at: noteIndex)
        print("done button clicked")
        doneDelegate?.applyText()
        _ = self.navigationController?.popViewController(animated: true)
        

        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any) {
        
        if let vc = segue.destination as? NotesEditorViewController {
            vc.editableNoteBook.insert(notesTextView.text, at: noteIndex)
            
             NotesViewController().gamesNoteBook = vc.editableNoteBook
            self.doneDelegate = NotesViewController() as DoneClickDelegate
        }
        }
        
}
       
       


extension NotesEditorViewController: UITextViewDelegate {
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
    }
        
    
}


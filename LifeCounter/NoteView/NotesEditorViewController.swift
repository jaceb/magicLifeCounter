//
//  NotesEditorViewController.swift
//  LifeCounter
//
//  Created by Jace on 3/19/18.
//  Copyright © 2018 Jace Briggs. All rights reserved.
//

import UIKit


protocol DoneClickDelegate {
    func applyText(text: String, idx: Int)
}

class NotesEditorViewController: UIViewController {
    
    var editableNoteBook: [String] = []
    var doneDelegate: DoneClickDelegate?
    //temp variable for setting stuff from a selected note cell --Trey
    var previousNoteText: String?
    var defaultNoteIndex: Int?
    var noteIndex: Int = 0
    
    @IBOutlet weak var notesTextView: UITextView!

    @IBAction func doneNoteButtonClick(_ sender: Any) {
        textViewDidEndEditing(notesTextView)
        if editableNoteBook.count <= noteIndex {
            editableNoteBook.append(notesTextView.text)
        } else {
        editableNoteBook.insert(notesTextView.text, at: noteIndex)
        }
        print("done button clicked \(noteIndex)")
        doneDelegate?.applyText(text: notesTextView.text, idx: noteIndex)
        
        _ = self.navigationController?.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.notesTextView.delegate = self
        if let noteText: String = previousNoteText {
            notesTextView.text = noteText
        }
        if let loadNoteIndex: Int = defaultNoteIndex{
            self.noteIndex = loadNoteIndex
        }
        
        print("edit load noteindex \(noteIndex)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? NotesViewController {
            vc.editDelegate = self
//            noteIndex = vc.selectedIndex
            NotesEditorViewController().noteIndex = vc.selectedIndex
            notesTextView.text = editableNoteBook[noteIndex]
            
        }
    }
}


extension NotesEditorViewController: UITextViewDelegate {
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        //        UITableView().reloadData()
    }
    
    
}

extension NotesEditorViewController: EditNoteDelegate {
    func editNote(cellIdx: Int, newNote: Bool) {
        
        self.noteIndex = cellIdx

        if newNote == true {
            self.editableNoteBook.append(notesTextView.text)
            
        } else {
            notesTextView.text = self.editableNoteBook[cellIdx]
        }
        
        print("\(self.editableNoteBook[cellIdx])")

    }
    
    
}

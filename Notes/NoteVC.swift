//
//  NoteVC.swift
//  Notes
//
//  Created by Александр Беляев on 17.03.2021.
//

import UIKit

class NoteVC: UIViewController {

    @IBOutlet weak var userNoteField: UITextField!
    weak var saveNoteDelegate: SaveNoteDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveNoteBtnPressed(_ sender: Any) {
        if let note = userNoteField.text {
            if !note.isEmpty {
                let note = NoteModel(noteName: note, noteCellColor: .white)
                saveNoteDelegate?.saveNote(note: note)
                dismiss(animated: true, completion: nil)
            }
        }
    }
}

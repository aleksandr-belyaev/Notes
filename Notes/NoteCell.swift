//
//  NoteCell.swift
//  Notes
//
//  Created by Александр Беляев on 17.03.2021.
//

import UIKit

class NoteCell: UITableViewCell {

    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var someNote: UILabel!
    weak var removeNoteDelegate: RemoveNoteDelegate?
    var note: NoteModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func removeNoteBtnPressed(_ sender: UIButton) {
        guard let note = note else { return }
        removeNoteDelegate?.removeNote(note: note)
    }
    
    func cellData(note: NoteModel) {
        someNote.text = note.noteName
        viewCell.backgroundColor = note.noteCellColor
        self.note = note
      }
}


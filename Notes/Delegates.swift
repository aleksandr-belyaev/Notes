//
//  Delegates.swift
//  Notes
//
//  Created by Александр Беляев on 17.03.2021.
//

import Foundation

protocol SaveNoteDelegate: class {
    func saveNote(note: NoteModel)
}

protocol RemoveNoteDelegate: class {
  func removeNote(note: NoteModel)
}

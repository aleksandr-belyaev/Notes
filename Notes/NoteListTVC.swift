//
//  NoteListTVC.swift
//  Notes
//
//  Created by Александр Беляев on 17.03.2021.
//

import UIKit

class NoteListTVC: UITableViewController {
    
    var vc = NoteVC()
    var arrayUserNotes = [NoteModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUserNotes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell") as? NoteCell else {return UITableViewCell()}
        cell.removeNoteDelegate = self

        arrayUserNotes[indexPath.row].currentIndex = indexPath
        let note = arrayUserNotes[indexPath.row]
        cell.cellData(note: note)
        return cell
    }
    
    @IBAction func showNoteVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: "NoteVC") as! NoteVC
        vc.saveNoteDelegate = self
        present(vc, animated: true, completion: nil)
    }
    
}

extension NoteListTVC: SaveNoteDelegate {
    func saveNote(note: NoteModel) {
        arrayUserNotes.append(note)
        tableView.reloadData()
    }
}

extension NoteListTVC: RemoveNoteDelegate {
  func removeNote(note: NoteModel) {
    guard let noteByIndex = note.currentIndex?.item else { return }
    arrayUserNotes.remove(at: noteByIndex)
    tableView.reloadData()
  }
}


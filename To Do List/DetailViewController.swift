//
//  DetailViewController.swift
//  To Do List
//
//  Created by Tom Kotopoulos on 2/10/19.
//  Copyright © 2019 Tom Kotopoulos. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var toDoItem: String?
    var toDoNoteItem: String?

    @IBOutlet weak var toDoField: UITextField!

    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    @IBOutlet weak var toDoNoteField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDoItem = toDoItem{
            toDoField.text = toDoItem
            self.navigationItem.title = "Edit To Do Item"
        }else {
            self.navigationItem.title = "New To Do Item"
        }
        if let toDoNoteItem = toDoNoteItem{
            toDoNoteField.text = toDoNoteItem
        }
        enableDisableSaveButton()
        toDoField.becomeFirstResponder()
    }

    func enableDisableSaveButton(){
        if toDoField.text!.count > 0 {
            saveBarButton.isEnabled = true
        }else{
            saveBarButton.isEnabled = false
        }
    }
    
    @IBAction func toDoFieldChanged(_ sender: UITextField) {
       enableDisableSaveButton()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave"{
            toDoItem = toDoField.text
            toDoNoteItem = toDoNoteField.text
        }
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode{
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}

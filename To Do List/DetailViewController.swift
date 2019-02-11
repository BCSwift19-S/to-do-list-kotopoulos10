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

    @IBOutlet weak var toDoField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDoItem = toDoItem{
            toDoField.text = toDoItem
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave"{
            toDoItem = toDoField.text
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

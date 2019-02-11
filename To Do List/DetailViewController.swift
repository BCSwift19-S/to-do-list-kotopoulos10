//
//  DetailViewController.swift
//  To Do List
//
//  Created by Tom Kotopoulos on 2/10/19.
//  Copyright © 2019 Tom Kotopoulos. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var toDoField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
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

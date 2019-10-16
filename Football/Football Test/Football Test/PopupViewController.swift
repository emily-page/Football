//
//  PopupViewController.swift
//  Football Test
//
//  Created by apcs7 on 1/19/18.
//  Copyright © 2018 apcs7. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var nameOfPlayField: UITextField!
    @IBOutlet weak var downSegmentedControl: UISegmentedControl!
    @IBOutlet weak var yardsField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func dismissPopup(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

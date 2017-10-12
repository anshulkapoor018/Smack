//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Anshul Kapoor on 12/10/17.
//  Copyright © 2017 Anshul Kapoor. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
}

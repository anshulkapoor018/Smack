//
//  LoginVC.swift
//  Smack
//
//  Created by Anshul Kapoor on 12/10/17.
//  Copyright © 2017 Anshul Kapoor. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    
    //Outlets
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var passWord: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated:  true, completion: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    
    func setupView(){
        userName.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
        passWord.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
        
    }
}

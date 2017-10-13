//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Anshul Kapoor on 12/10/17.
//  Copyright © 2017 Anshul Kapoor. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    //Outlets
    @IBOutlet weak var userNameTxt: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Actions
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let email = emailTxt.text, emailTxt.text != "" else
            {return}
        guard let pass = passTxt.text, passTxt.text != "" else
            {return}
        
        AuthService.instance.registerUser(email: email, password: pass)
            { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success{
                        print ("Logged in user!", AuthService.instance.authToken)
                    }
                    
                })
            }
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
    
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
    
    }

    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
}

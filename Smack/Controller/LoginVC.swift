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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let email = userName.text , userName.text != "" else { return }
        guard let pass = passWord.text , passWord.text != "" else { return }
        
        AuthService.instance.loginUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: notif, object: nil)
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
        
    }
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated:  true, completion: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    
    func setupView(){
        spinner.isHidden = true
        userName.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
        passWord.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
        
    }
}

//
//  ChatVC.swift
//  Smack
//
//  Created by Anshul Kapoor on 11/10/17.
//  Copyright © 2017 Anshul Kapoor. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var menuBtn: UIButton!
    
    @IBOutlet weak var channelNameLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataDidChange(_:)), name: notif, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: NOTIF_CHANNEL_SELECTED, object: nil)
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail(completion: { (success) in
                NotificationCenter.default.post(name: notif, object: nil)
            })
        }
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedIn {
            onLoginGetMessages()
        } else {
            channelNameLbl.text = "Please Log In"
        }
    }
    
    @objc func channelSelected(_ notif: Notification) {
        updateWithChannel()
    }

    func updateWithChannel() {
        let channelName = MessageService.instance.selectedChannel?.channelTitle ?? ""
        channelNameLbl.text = "#\(channelName)"
    }

    func onLoginGetMessages() {
        MessageService.instance.findAllChannel { (success) in
            if success {
                // Do stuff with channels
            }
        }
    }
}

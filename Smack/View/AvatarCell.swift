//
//  AvatarCell.swift
//  Smack
//
//  Created by Anshul Kapoor on 14/10/17.
//  Copyright © 2017 Anshul Kapoor. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    func setUpView(){
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
    }
}

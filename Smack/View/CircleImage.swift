//
//  CircleImage.swift
//  Smack
//
//  Created by Anshul Kapoor on 14/10/17.
//  Copyright © 2017 Anshul Kapoor. All rights reserved.
//

import UIKit


@IBDesignable
class CircleImage: UIImageView {
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView(){
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
}
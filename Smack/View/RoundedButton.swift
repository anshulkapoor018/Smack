//
//  RoundedButton.swift
//  Smack
//
//  Created by Anshul Kapoor on 13/10/17.
//  Copyright © 2017 Anshul Kapoor. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView(){
         self.layer.cornerRadius = cornerRadius
    }
}

//
//  MainButtonView.swift
//  FIPEnaMao
//
//  Created by Breno Ramos on 30/05/18.
//  Copyright © 2018 brenor2. All rights reserved.
//

import UIKit

class MainButtonView: UIView {
    
    var button: UIButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let buttonHeight  = self.frame.height
        let buttonWidth   = self.frame.width
        let buttonY       = (self.frame.height/2) - (buttonHeight/2)
        let buttonX       = (self.frame.width/2) - (buttonWidth/2)
        let buttonFrame   = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight)
        
        self.button.tintColor        = .white
        self.button.frame            = buttonFrame
        self.button.titleLabel?.font = UIFont(name: "SF-Pro-Text-Medium", size: 20.0)
        self.button.setTitleColor(.white, for: .normal)
        self.button.setTitleColor(Color.obscureGray, for: .selected)
        self.button.setTitleColor(Color.obscureGray, for: .disabled)


        self.backgroundColor = Color.redStraw
        self.addSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
}


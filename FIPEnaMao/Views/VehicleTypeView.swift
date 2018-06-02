//
//  vehicleTypeView.swift
//  FIPEnaMao
//
//  Created by Breno Ramos on 26/05/18.
//  Copyright © 2018 brenor2. All rights reserved.
//

import UIKit

//@IBDesignable
class VehicleTypeView: UIView {
    
    var iconImageView : UIImageView {
        let view         = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image       = UIImage(named: "carIcon2.png")
        return view
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    private func setupView() {
        self.layer.cornerRadius = 16
        self.backgroundColor = UIColor(red:0.71, green:0.76, blue:0.79, alpha:1.0)
        
        let paddingTopBottom  = 20
        let x      = self.frame.midX - (self.iconImageView.frame.width/2)
        let y      = self.frame.midY - (self.iconImageView.frame.height/2)
        let height = self.frame.height - CGFloat(paddingTopBottom*2)
        let width  = self.frame.width/3
        
        iconImageView.frame = CGRect(x: x, y: y, width: width, height: height)
        iconImageView.backgroundColor = .yellow
        self.addSubview(iconImageView)
        self.bringSubview(toFront: iconImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    
//    @IBInspectable var cornerRadius: CGFloat = 0 {
//        didSet {
//            self.layer.cornerRadius = cornerRadius
//        }
//    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

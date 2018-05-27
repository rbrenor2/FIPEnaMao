//
//  Animation.swift
//  FIPEnaMao
//
//  Created by Breno Ramos on 26/05/18.
//  Copyright © 2018 brenor2. All rights reserved.
//

import Foundation
import UIKit

class Animation {
    static func rotate() -> CGAffineTransform {
        return CGAffineTransform(rotationAngle: 0.0872665)
    }
    
    static func translateOutOfScreenX(parentView: UIView) -> CGAffineTransform {
        return CGAffineTransform(translationX: -((parentView.bounds.width/2) + 100), y: 0)
    }
    
    static func translateOutOfScreenY(parentView: UIView) -> CGAffineTransform {
        return CGAffineTransform(translationX: 0, y: -parentView.bounds.height/2)
    }
    
    static func translateLittleY() -> CGAffineTransform {
        return CGAffineTransform(translationX: 0, y: 30)
    }
}

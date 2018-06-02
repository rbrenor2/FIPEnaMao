//
//  DataTableView.swift
//  FIPEnaMao
//
//  Created by Breno Ramos on 26/05/18.
//  Copyright © 2018 brenor2. All rights reserved.
//

import UIKit

@IBDesignable
class DataTableView: UITableView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

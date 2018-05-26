//
//  ViewController.swift
//  FIPEnaMao
//
//  Created by Breno Ramos on 25/05/18.
//  Copyright © 2018 brenor2. All rights reserved.
//

import UIKit

class FirstScreenViewController: UIViewController {

    @IBOutlet weak var bgButtonView: UIView!
    @IBAction func startButton(_ sender: Any) {
        UIView.animate(withDuration: 1, animations: {
            self.bgButtonView.transform = Animation.rotate()
        }) {(true) in
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


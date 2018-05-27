//
//  ViewController.swift
//  FIPEnaMao
//
//  Created by Breno Ramos on 25/05/18.
//  Copyright © 2018 brenor2. All rights reserved.
//

import UIKit

class FirstScreenViewController: UIViewController {
    
    //
    var vehicleChoosen = ""
    var brandChoosen   = ""
    var modelChoosen   = ""
    var yearChoosen    = ""

    // First screen
    @IBOutlet weak var motorcycleButtonView: VehicleTypeView!
    @IBOutlet weak var truckButtonView: VehicleTypeView!
    @IBOutlet weak var vehicleButtonView: VehicleTypeView!
    @IBOutlet weak var questionVehicleLabel: UILabel!
    
    // Second screen
    @IBOutlet weak var brandTableView: DataTableView!
    @IBOutlet weak var questionBrandLabel: UILabel!
    
    //Initial
    @IBOutlet weak var bgButtonView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var isFirstTimeTapped1: Bool = true
    var isFirstTimeTapped2: Bool = true
    var isFirstTimeTapped3: Bool = true
    var isFirstTimeTapped4: Bool = true

    @IBAction func startButton(_ sender: Any) {
        if isFirstTimeTapped1 {
            isFirstTimeTapped1 = false
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { [unowned self] in
                self.bgButtonView.transform = Animation.rotate()
                //Car goes to the end
                }, completion: { [unowned self] (true) in
                    self.setupFirstScreen()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let vehicleTap = UITapGestureRecognizer(target: self, action: #selector(handleVehicleChoice))
        self.vehicleButtonView.addGestureRecognizer(vehicleTap)
        
        let truckTap = UITapGestureRecognizer(target: self, action: #selector(handleTruckChoice))
        self.truckButtonView.addGestureRecognizer(truckTap)
        
        let motorcycleTap = UITapGestureRecognizer(target: self, action: #selector(handleMotorcycleChoice))
        self.motorcycleButtonView.addGestureRecognizer(motorcycleTap)
        
        animateElementsFirstScreen(position: "init")
        animateElementsSecondScreen(position: "init")
    }
}

// Handle First Screen
extension FirstScreenViewController {
    func setupFirstScreen() {
        //Label animation
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { [unowned self] in
            self.titleLabel.transform = Animation.translateLittleY()
            }, completion: { [unowned self] (true) in
                UIView.animate(withDuration: 1.5, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {[unowned self] in
                    self.titleLabel.transform = Animation.translateOutOfScreenX(parentView: self.view)
                    }, completion: { [unowned self] (true) in
                        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { [unowned self] in
                            //Button View Animations
                            self.animateElementsFirstScreen(position: "middle")
                        })
                })
        })
    }
    
    func animateElementsFirstScreen(position: String) {
            let width     = Int(self.view.bounds.width - 100)
            let height    = 100
            let widthQuestion  = Int(self.questionVehicleLabel.frame.width)
            let heightQuestion = Int(self.questionVehicleLabel.frame.height)
            let padding   = 30
            let initialX  = Int(self.view.bounds.maxX)
    
            let truckY    = Int(self.view.bounds.midY - CGFloat(height/2))
            let vehicleY  = truckY - height - padding
            let motorY    = truckY + height + padding
            let questionY = vehicleY - Int(self.questionVehicleLabel.frame.height) - padding - 10
    
            let translationMiddle         = CGFloat(width) + (self.view.bounds.width/2) - CGFloat(width/2)
            let translationMiddleQuestion = CGFloat(widthQuestion) + (self.view.bounds.width/2) - CGFloat(widthQuestion/2)
    
            let initialFrameVehicle  = CGRect(x: initialX, y: vehicleY, width: width, height: height)
            let initialFrameTruck    = CGRect(x: initialX, y: truckY, width: width, height: height)
            let initialFrameMotor    = CGRect(x: initialX, y: motorY, width: width, height: height)
    
            let initialFrameQuestion = CGRect(x: initialX, y: questionY , width: widthQuestion, height: heightQuestion)
    
            switch position {
            case "init":
                vehicleButtonView.frame    = initialFrameVehicle
                truckButtonView.frame      = initialFrameTruck
                motorcycleButtonView.frame = initialFrameMotor
                questionVehicleLabel.frame = initialFrameQuestion
            case "middle":
                UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn,animations: { [unowned self] in
                        self.questionVehicleLabel.transform = CGAffineTransform(translationX: -translationMiddleQuestion , y: 0)
                })
        
                UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: { [unowned self] in
                        self.vehicleButtonView.transform = CGAffineTransform(translationX: -translationMiddle , y: 0)
                })
        
                UIView.animate(withDuration: 1.5, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: { [unowned self] in
                    self.truckButtonView.transform = CGAffineTransform(translationX: -translationMiddle , y: 0)
                })
        
                UIView.animate(withDuration: 1.5, delay: 0.4, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: { [unowned self] in
                        self.motorcycleButtonView.transform = CGAffineTransform(translationX: -translationMiddle , y: 0)
                })
        
            case "final":
                UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: { [unowned self] in
                        self.motorcycleButtonView.transform = CGAffineTransform(translationX: -2*translationMiddle , y: 0)
                })
        
                UIView.animate(withDuration: 1.5, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: { [unowned self] in
                        self.truckButtonView.transform = CGAffineTransform(translationX: -2*translationMiddle , y: 0)
                })
        
                UIView.animate(withDuration: 1.5, delay: 0.4, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: { [unowned self] in
                        self.vehicleButtonView.transform = CGAffineTransform(translationX: -2*translationMiddle , y: 0)
                })
                
                UIView.animate(withDuration: 1.5, delay: 0.6, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: { [unowned self] in
                    self.questionVehicleLabel.transform = CGAffineTransform(translationX: -2*translationMiddle , y: 0)
                })
                
                // Go to second screen
                setupSecondScreen()
            default:
                print("The impossible happened!")
            }
        }
}


// Handle Second Screen
extension FirstScreenViewController {
    func setupSecondScreen() {
        // Setup initial frames
        
        // Label animation
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { [unowned self] in
            self.brandTableView.transform = Animation.translateLittleY()
            }, completion: { [unowned self] (true) in
                UIView.animate(withDuration: 1.5, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {[unowned self] in
                    self.titleLabel.transform = Animation.translateOutOfScreenX(parentView: self.view)
                    }, completion: { [unowned self] (true) in
                        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { [unowned self] in
                            //Button View Animations
                            self.animateElementsSecondScreen(position: "middle")
                        })
                })
        })
    }
    
    func animateElementsSecondScreen(position: String) {
        let widthQuestion  = Int(self.questionBrandLabel.frame.width)
        let heightQuestion = Int(self.questionBrandLabel.frame.height)
        let widthTable     = Int(self.view.bounds.maxX - 100)
        let heightTable    = Int(self.view.bounds.maxY - (self.brandTableView.frame.height/2))
        let padding   = 30
        let initialX  = Int(self.view.bounds.maxX)
        let brandTableY = Int((self.view.bounds.height/2) - (self.brandTableView.frame.height/2))
        let questionY   = brandTableY - Int(self.questionBrandLabel.frame.height) - padding - 10
        
        let translationMiddleQuestion = CGFloat(widthQuestion) + (self.view.bounds.width/2) - CGFloat(widthQuestion/2)
        let translationMiddleTable    = CGFloat(widthTable) + (self.view.bounds.width/2) - CGFloat(widthQuestion/2)
        
        let initialFrameBrandTable = CGRect(x: initialX, y: brandTableY, width: widthTable, height: heightTable)
        let initialFrameQuestion   = CGRect(x: initialX, y: questionY , width: widthQuestion, height: heightQuestion)
        
        switch position {
        case "init":
            questionBrandLabel.frame = initialFrameQuestion
            brandTableView.frame     = initialFrameBrandTable
        case "middle":
            UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: { [unowned self] in
                self.questionBrandLabel.transform = CGAffineTransform(translationX: -translationMiddleQuestion , y: 0)
            })
            
            UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: { [unowned self] in
                self.brandTableView.transform = CGAffineTransform(translationX: -translationMiddleTable , y: 0)
            })
        default:
            print("The impossible happened!")
        }
    }

}

// Handle Vehicle Taps
extension FirstScreenViewController {
    @objc func handleMotorcycleChoice() {
        // Set variable choosen categorie
        self.vehicleChoosen = "moto"
        // Dismiss first screen elements
        animateElementsFirstScreen(position: "final")
    }
    
    @objc func handleTruckChoice() {
        // Set variable choosen categorie
        self.vehicleChoosen = "caminhao"
        // Dismiss first screen elements
        animateElementsFirstScreen(position: "final")
    }
    
    @objc func handleVehicleChoice() {
        // Set variable choosen categorie
        self.vehicleChoosen = "carro"
        // Dismiss first screen elements
        animateElementsFirstScreen(position: "final")
    }
}



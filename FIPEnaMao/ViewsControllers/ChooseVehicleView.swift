//
//  ChooseVehicleView.swift
//  FIPEnaMao
//
//  Created by Breno Ramos on 28/05/18.
//  Copyright © 2018 brenor2. All rights reserved.
//

import Foundation
import UIKit

// Handle First Screen
extension FirstScreenViewController {
    func setupFirstScreen() {
        //Label animation
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 5, initialSpringVelocity: 10, options: .curveEaseOut, animations: { [unowned self] in
            self.titleLabel.transform = Animation.translateLittleY()
            }, completion: { [unowned self] (true) in
                UIView.animate(withDuration: 1.5, delay: 0.1, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: .curveEaseOut, animations: {[unowned self] in
                    self.titleLabel.transform = CGAffineTransform(translationX: -CGFloat(self.titleLabel.frame.width + 50.0), y: 30)
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
        
        //animation vars
        let damping          = CGFloat(5)
        let initialSpringVel = CGFloat(10)
        
        switch position {
        case "init":
            vehicleButtonView.frame    = initialFrameVehicle
            truckButtonView.frame      = initialFrameTruck
            motorcycleButtonView.frame = initialFrameMotor
            questionVehicleLabel.frame = initialFrameQuestion
        case "middle":
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: damping, initialSpringVelocity: initialSpringVel, options: .curveEaseIn,animations: { [unowned self] in
                self.questionVehicleLabel.transform = CGAffineTransform(translationX: -translationMiddleQuestion , y: 0)
            })
            
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: damping, initialSpringVelocity: initialSpringVel, options: .curveEaseIn, animations: { [unowned self] in
                self.vehicleButtonView.transform = CGAffineTransform(translationX: -translationMiddle , y: 0)
            })
            
            UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: damping, initialSpringVelocity: initialSpringVel, options: .curveEaseIn, animations: { [unowned self] in
                self.truckButtonView.transform = CGAffineTransform(translationX: -translationMiddle , y: 0)
            })
            
            UIView.animate(withDuration: 1, delay: 0.4, usingSpringWithDamping: damping, initialSpringVelocity: initialSpringVel, options: .curveEaseIn, animations: { [unowned self] in
                self.motorcycleButtonView.transform = CGAffineTransform(translationX: -translationMiddle , y: 0)
            })
            
        case "final":
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: damping, initialSpringVelocity: initialSpringVel, options: .curveEaseOut, animations: { [unowned self] in
                self.motorcycleButtonView.transform = CGAffineTransform(translationX: -2*translationMiddle , y: 0)
            })
            
            UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: damping, initialSpringVelocity: initialSpringVel, options: .curveEaseOut, animations: { [unowned self] in
                self.truckButtonView.transform = CGAffineTransform(translationX: -2*translationMiddle , y: 0)
            })
            
            UIView.animate(withDuration: 1, delay: 0.4, usingSpringWithDamping: damping, initialSpringVelocity: initialSpringVel, options: .curveEaseOut, animations: { [unowned self] in
                self.vehicleButtonView.transform = CGAffineTransform(translationX: -2*translationMiddle , y: 0)
            })
            
            UIView.animate(withDuration: 1, delay: 0.6, usingSpringWithDamping: damping, initialSpringVelocity: initialSpringVel, options: .curveEaseOut, animations: { [unowned self] in
                self.questionVehicleLabel.transform = CGAffineTransform(translationX: -2*(translationMiddle+100) , y: 0)
            })
            
            // Go to second screen
            setupSecondScreen()
        default:
            print("The impossible happened!")
        }
    }
    
    @objc func handleMotorcycleChoice() {
        // Set variable choosen categorie
        self.vehicleChoosen = "motos"
        // Dismiss first screen elements
        animateElementsFirstScreen(position: "final")
    }
    
    @objc func handleTruckChoice() {
        // Set variable choosen categorie
        self.vehicleChoosen = "caminhoes"
        // Dismiss first screen elements
        animateElementsFirstScreen(position: "final")
    }
    
    @objc func handleVehicleChoice() {
        // Set variable choosen categorie
        self.vehicleChoosen = "carros"
        // Dismiss first screen elements
        animateElementsFirstScreen(position: "final")
    }
}

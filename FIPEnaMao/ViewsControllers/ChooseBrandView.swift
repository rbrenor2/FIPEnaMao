//
//  ChooseBrandView.swift
//  FIPEnaMao
//
//  Created by Breno Ramos on 28/05/18.
//  Copyright © 2018 brenor2. All rights reserved.
//

import Foundation
import UIKit

// Handle Second Screen
extension FirstScreenViewController {
    func setupSecondScreen() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: { [unowned self] in
            self.continueButton.isEnabled = false
            self.continueButton.alpha     = 1
        })
        self.animateElementsSecondScreen(position: "middle")
    }
    
    func animateElementsSecondScreen(position: String) {
        let padding        = 30
        let widthQuestion  = Int(self.questionBrandLabel.frame.width)
        let heightQuestion = Int(self.questionBrandLabel.frame.height)
        let widthTable     = Int(self.view.bounds.maxX - 50)
        let heightTable    = Int(self.view.bounds.height - self.bgButtonView.frame.height - self.carAnimView.frame.height)
        let initialX       = Int(self.view.bounds.maxX)
        let brandTableY    = Int((self.view.bounds.height/2) - CGFloat(heightTable/2))
        let questionY      = brandTableY - Int(self.questionBrandLabel.frame.height) - padding - 10
        
        let translationMiddleQuestion = CGFloat(widthQuestion) + (self.view.bounds.width/2) - CGFloat(widthQuestion/2)
        let translationMiddleTable    = CGFloat(widthTable) + (self.view.bounds.width/2) - CGFloat(widthTable/2)
        
        let initialFrameBrandTable    = CGRect(x: initialX, y: brandTableY, width: widthTable, height: heightTable)
        let initialFrameQuestion      = CGRect(x: initialX, y: questionY , width: widthQuestion, height: heightQuestion)
        
        switch position {
        case "init":
            questionBrandLabel.frame = initialFrameQuestion
            listTableView.frame      = initialFrameBrandTable
        case "middle":
            UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { [unowned self] in
                self.questionBrandLabel.transform = CGAffineTransform(translationX: -translationMiddleQuestion , y: 0)
            })
            UIView.animate(withDuration: 1, delay: 1.2, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { [unowned self] in
                self.listTableView.transform = CGAffineTransform(translationX: -translationMiddleTable , y: 0)
            })
            
            getData()
        default:
            print("The impossible happened!")
        }
    }
    
    func getData() {
        DispatchQueue.global(qos: .userInteractive).async { [unowned self] in
            self.brandData = DataJSON.getBrands(vehicle: self.vehicleChoosen)
            if self.brandData != nil {
                DispatchQueue.main.async {
                    self.listTableView.reloadData()
                }
            }
        }
    }
    
}

// Handle Third Screen
extension FirstScreenViewController {
    func setupThirdScreen() {
        self.animateElementsSecondScreen(position: "middle")
    }
    
    func animateElementsThirdScreen(position: String) {
        let widthQuestion  = Int(self.questionModelLabel.frame.width)
        let heightQuestion = Int(self.questionModelLabel.frame.height)
        let widthTable     = Int(self.view.bounds.maxX - 50)
        let heightTable    = Int(self.view.bounds.maxY - self.bgButtonView.frame.height - 100)
        let padding        = 30
        let initialX       = Int(self.view.bounds.maxX)
        let brandTableY    = Int((self.view.bounds.height/2) - (self.listTableView.frame.height/2))
        let questionY      = brandTableY - Int(self.questionModelLabel.frame.height) - padding - 20
        
        let translationMiddleQuestion = CGFloat(widthQuestion) + (self.view.bounds.width/2) - CGFloat(widthQuestion/2)
        let translationMiddleTable    = CGFloat(widthTable) + (self.view.bounds.width/2) - CGFloat(widthTable/2)
        
        let initialFrameBrandTable = CGRect(x: initialX, y: brandTableY, width: widthTable, height: heightTable)
        let initialFrameQuestion   = CGRect(x: initialX, y: questionY , width: widthQuestion, height: heightQuestion)
        
        switch position {
        case "init":
            questionModelLabel.frame = initialFrameQuestion
            listTableView.frame      = initialFrameBrandTable
        case "middle":
            UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { [unowned self] in
                self.questionModelLabel.transform = CGAffineTransform(translationX: -translationMiddleQuestion , y: 0)
            })
            
            UIView.animate(withDuration: 1, delay: 1.2, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { [unowned self] in
                self.listTableView.transform = CGAffineTransform(translationX: -translationMiddleTable , y: 0)
            })
        default:
            print("The impossible happened!")
        }
    }
}

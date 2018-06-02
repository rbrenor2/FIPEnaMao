//
//  ViewController.swift
//  FIPEnaMao
//
//  Created by Breno Ramos on 25/05/18.
//  Copyright © 2018 brenor2. All rights reserved.
//

import UIKit
import Lottie

class FirstScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     
    //
    var vehicleChoosen = ""
    var brandChoosen   = ""
    var modelChoosen   = ""
    var yearChoosen    = ""

    // First screen
    var motorcycleButtonView: VehicleTypeView!
    var truckButtonView     : VehicleTypeView!
    var vehicleButtonView   : VehicleTypeView!
    @IBOutlet weak var questionVehicleLabel: UILabel!
    
    // Table View control
    var currentTable = 1
    var modelsData : CarsModel?
    var carData    : CarModel?
    var yearsData  : [YearsModel]?
    var brandData  : [BrandModel]?
    
    // Second screen
    @IBOutlet weak var listTableView: DataTableView!
    @IBOutlet weak var questionBrandLabel: UILabel!
    
    // Third screen
    @IBOutlet weak var questionModelLabel: UILabel!
    
    //Initial
    var mainButtonView: MainButtonView!
    @IBOutlet weak var titleLabel: UILabel!
    let carAnimView = LOTAnimationView(name: "suv4")

//-----------------------//-------------------------//-----------------------//-------------------------//-------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInitialPositionOfElements()
        setupCarAnimation()
        
        self.listTableView.delegate    = self
        self.listTableView.dataSource  = self
    }
    
    func start() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { [unowned self] in
                self.mainButtonView.button.alpha = 0
            //Car goes to the end
            }, completion: { [unowned self] (true) in
                self.setupFirstScreen()
        })
    }
    
    fileprivate func setupCarAnimation() {
        let carAnimWidth  = self.view.frame.height/8
        let carAnimHeight = carAnimWidth/2
        carAnimView.frame = CGRect(x: self.view.bounds.midX - (carAnimWidth/2), y: self.view.bounds.maxY - self.mainButtonView.frame.height - carAnimHeight, width: carAnimWidth, height: carAnimHeight)
        
        carAnimView.contentMode     = .scaleAspectFit
        
        self.view.addSubview(carAnimView)
        carAnimView.loopAnimation = true
        carAnimView.play()
    }
  
    fileprivate func setupInitialPositionOfElements() {
        let mainBtHeight    = self.view.frame.height/8
        let mainButtonFrame = CGRect(x: 0, y: self.view.frame.maxY - mainBtHeight, width: self.view.frame.width, height: mainBtHeight)
        self.mainButtonView = MainButtonView(frame: mainButtonFrame)
        self.mainButtonView.button.isEnabled = true
        self.mainButtonView.button.alpha     = 1
        self.mainButtonView.button.setTitle("Começar", for: .normal)
        self.mainButtonView.button.addTarget(self, action: #selector(setupFirstScreen), for: .touchUpInside)
        self.view.addSubview(mainButtonView)
                
        self.animateElementsFirstScreen(position: "init")
        self.animateElementsSecondScreen(position: "init")
        self.animateElementsThirdScreen(position: "init")
    }
    
}

// Handle TableView
extension FirstScreenViewController {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        
        switch currentTable {
        case 1:
            if let brands = brandData, let name = brands[indexPath.row].nome {
                cell.textLabel?.text = name
            }
        default:
            print("things")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.mainButtonView.button.isEnabled = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowsNumber = 5
        switch currentTable {
        case 1:
            if let brands = brandData {
                rowsNumber = brands.count
                return rowsNumber
            }
            
        default:
            print("things")
        }
        return rowsNumber

    }
}






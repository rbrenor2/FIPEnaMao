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
    @IBOutlet weak var motorcycleButtonView: VehicleTypeView!
    @IBOutlet weak var truckButtonView: VehicleTypeView!
    @IBOutlet weak var vehicleButtonView: VehicleTypeView!
    @IBOutlet weak var questionVehicleLabel: UILabel!
    
    // Table View control
    var currentTable = 1
    var modelsData : CarsModel?
    var carData : CarModel?
    var yearsData : [YearsModel]?
    var brandData : [BrandModel]?
    
    // Second screen
    @IBOutlet weak var listTableView: DataTableView!
    @IBOutlet weak var questionBrandLabel: UILabel!
    
    // Third screen
    @IBOutlet weak var questionModelLabel: UILabel!
    
    @IBOutlet weak var continueButton: UIButton!
    @IBAction func continueButton(_ sender: Any) {
    }
    //Initial
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var bgButtonView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //
    let carAnimView = LOTAnimationView(name: "suv4")

    
    var isFirstTimeTapped1: Bool = true
    var isFirstTimeTapped2: Bool = true
    var isFirstTimeTapped3: Bool = true
    var isFirstTimeTapped4: Bool = true

    @IBAction func startButton(_ sender: Any) {
        if isFirstTimeTapped1 {
            isFirstTimeTapped1 = false
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { [unowned self] in
                //self.bgButtonView.transform = Animation.rotate()
                self.startButton.alpha = 0
                //Car goes to the end
                }, completion: { [unowned self] (true) in
                    self.setupFirstScreen()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgButtonHeight = self.view.frame.height/6
        self.bgButtonView.frame = CGRect(x: 0, y: self.view.frame.maxY - bgButtonHeight, width: self.view.frame.width, height: bgButtonHeight)
        
        let carAnimWidth = self.view.frame.height/8
        let carAnimHeight = carAnimWidth/2
        carAnimView.frame = CGRect(x: self.view.bounds.midX - 50, y: self.view.bounds.maxY - self.bgButtonView.frame.height - (carAnimHeight/2), width: carAnimWidth, height: carAnimHeight)

        carAnimView.contentMode = .scaleAspectFit
        carAnimView.backgroundColor = .yellow
            
        self.view.addSubview(carAnimView)
        carAnimView.loopAnimation = true
        carAnimView.play()
        
        self.listTableView.delegate    = self
        self.listTableView.dataSource  = self

        setupGestureRecognizers()
        setupInitialPositionOfElements()
    }
    
    fileprivate func setupGestureRecognizers() {
        let vehicleTap = UITapGestureRecognizer(target: self, action: #selector(handleVehicleChoice))
        self.vehicleButtonView.addGestureRecognizer(vehicleTap)
        
        let truckTap = UITapGestureRecognizer(target: self, action: #selector(handleTruckChoice))
        self.truckButtonView.addGestureRecognizer(truckTap)
        
        let motorcycleTap = UITapGestureRecognizer(target: self, action: #selector(handleMotorcycleChoice))
        self.motorcycleButtonView.addGestureRecognizer(motorcycleTap)
    }
    
    fileprivate func setupInitialPositionOfElements() {
        self.continueButton.isEnabled = false
        self.continueButton.setTitleColor(.gray, for: .disabled)
        self.continueButton.alpha = 0
        
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
        self.continueButton.isEnabled = true
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






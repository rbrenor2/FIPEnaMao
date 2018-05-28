//
//  ViewController.swift
//  FIPEnaMao
//
//  Created by Breno Ramos on 25/05/18.
//  Copyright © 2018 brenor2. All rights reserved.
//

import UIKit

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
                //self.bgButtonView.transform = Animation.rotate()
                //Car goes to the end
                }, completion: { [unowned self] (true) in
                    self.setupFirstScreen()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modelsData = DataJSON.getBrandModels(brand: "59")
        carData = DataJSON.getCar(vehicle: "carros", brand: "59", model: "5940", year: "2014-3")
        yearsData = DataJSON.getModelYears(model: "5940", brand: "59")
        
        
        self.listTableView.delegate    = self
        self.listTableView.dataSource  = self

        let vehicleTap = UITapGestureRecognizer(target: self, action: #selector(handleVehicleChoice))
        self.vehicleButtonView.addGestureRecognizer(vehicleTap)
        
        let truckTap = UITapGestureRecognizer(target: self, action: #selector(handleTruckChoice))
        self.truckButtonView.addGestureRecognizer(truckTap)
        
        let motorcycleTap = UITapGestureRecognizer(target: self, action: #selector(handleMotorcycleChoice))
        self.motorcycleButtonView.addGestureRecognizer(motorcycleTap)
        
        animateElementsFirstScreen(position: "init")
        animateElementsSecondScreen(position: "init")
        animateElementsThirdScreen(position: "init")
        
        continueButton.isHidden = true
    }
}

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


// Handle Second Screen
extension FirstScreenViewController {
    func setupSecondScreen() {
        self.animateElementsSecondScreen(position: "middle")
    }
    
    func animateElementsSecondScreen(position: String) {
        let padding        = 30
        let widthQuestion  = Int(self.questionBrandLabel.frame.width)
        let heightQuestion = Int(self.questionBrandLabel.frame.height)
        let widthTable     = Int(self.view.bounds.maxX - 50)
        let heightTable    = Int(self.view.bounds.maxY - self.bgButtonView.frame.height - 100)
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
            listTableView.frame     = initialFrameBrandTable
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
        let padding   = 30
        let initialX  = Int(self.view.bounds.maxX)
        let brandTableY = Int((self.view.bounds.height/2) - (self.listTableView.frame.height/2))
        let questionY   = brandTableY - Int(self.questionModelLabel.frame.height) - padding - 20
        
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






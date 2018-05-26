//
//  CarFunctions.swift
//  FIPEnaMao
//
//  Created by Breno Ramos on 26/05/18.
//  Copyright © 2018 brenor2. All rights reserved.
//

import Foundation

class CarFunctions {
    //static let's you use functions without instantiaing the class
    static func createCar(carModel: CarModel) {
        
    }
    
    static func readCars() {
        if Data.tripModels.count == 0 {
            Data.tripModels.append(CarModel(brand: "Peugeot", model: "RCZ", year: "2015 Gasolina"))
            Data.tripModels.append(CarModel(brand: "BMW", model: "i3", year: "2018 Elétrico"))
            Data.tripModels.append(CarModel(brand: "Audi", model: "A4", year: "2015 Gasolina"))
            Data.tripModels.append(CarModel(brand: "Volkswagen", model: "RCZ", year: "2015 Gasolina"))
            Data.tripModels.append(CarModel(brand: "Fiat", model: "RCZ", year: "2015 Gasolina"))
            Data.tripModels.append(CarModel(brand: "Renault", model: "RCZ", year: "2015 Gasolina"))
            Data.tripModels.append(CarModel(brand: "Peugeot", model: "207", year: "2010 Flex"))
        }
    }
    
    static func updateCar(carModel: CarModel) {
        
    }
    
    static func deleteCar(carModel: CarModel) {
        
    }
}

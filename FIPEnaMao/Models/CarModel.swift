//
//  CarModel.swift
//  FIPEnaMao
//
//  Created by Breno Ramos on 26/05/18.
//  Copyright © 2018 brenor2. All rights reserved.
//

import Foundation

class CarModel {
    let id   : UUID
    let brand: String
    let model: String
    let year : String
    
    init(brand: String!, model: String!, year: String!) {
        id = UUID()
        self.brand = brand
        self.model = model
        self.year  = year
    }
}

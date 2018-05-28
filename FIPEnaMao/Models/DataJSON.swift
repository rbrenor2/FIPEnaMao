//
//  DataJSON.swift
//  FIPEnaMao
//
//  Created by Breno Ramos on 26/05/18.
//  Copyright © 2018 brenor2. All rights reserved.
//

import Foundation

class DataJSON {
    static var result = [CarModel]()
    static var baseUrl = "https://parallelum.com.br/fipe/api/v1"
    
    static func getCar(vehicle: String, brand: String, model: String, year: String) -> CarModel? {
        let url = URL(string: baseUrl + "/" + vehicle + "/marcas/" + brand + "/modelos/" + model + "/anos/" + year)
        do {
            let jsonData        = try Data(contentsOf: url!)
            let decodedResponse = try JSONDecoder().decode(CarModel.self, from: jsonData)
            return decodedResponse
        } catch _ {
            print("Download error")
            return nil
        }
    }
    
    static func getBrands(vehicle: String) -> [BrandModel]? {
        let url = URL(string: baseUrl + "/" + vehicle + "/marcas")
        do {
            let jsonData = try Data(contentsOf: url!)
            let decodedResponse = try JSONDecoder().decode([BrandModel].self, from: jsonData)
            return decodedResponse
        } catch _ {
            print("Download error")
            return nil
        }
    }
    
    static func getBrandModels(brand: String) -> CarsModel? {
        let url = URL(string: baseUrl + "/carros" + "/marcas/" + brand + "/modelos")
        do {
            let jsonData = try Data(contentsOf: url!)
            let decodedResponse = try JSONDecoder().decode(CarsModel.self, from: jsonData)
            return decodedResponse
        } catch _ {
            print("Download error")
            return nil
        }
    }
    
    static func getModelYears(model: String, brand: String) -> [YearsModel]? {
        let url = URL(string: baseUrl + "/carros" + "/marcas/" + brand + "/modelos/" + model + "/anos")
        do {
            let jsonData = try Data(contentsOf: url!)
            let decodedResponse = try JSONDecoder().decode([YearsModel].self, from: jsonData)
            return decodedResponse
        } catch _ {
            print("Download error")
            return nil
        }
    }

}

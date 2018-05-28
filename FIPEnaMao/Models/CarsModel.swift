//
//  CarsModel.swift
//  FIPEnaMao
//
//  Created by Breno Ramos on 27/05/18.
//  Copyright © 2018 brenor2. All rights reserved.
//

import Foundation

struct CarsModel : Codable {
    let modelos : [BrandModel]?
    let anos : [YearsModel]?
    
    enum CodingKeys: String, CodingKey {
        
        case modelos = "modelos"
        case anos = "anos"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        modelos = try values.decodeIfPresent([BrandModel].self, forKey: .modelos)
        anos = try values.decodeIfPresent([YearsModel].self, forKey: .anos)
    }
    
}

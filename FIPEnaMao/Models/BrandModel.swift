//
//  BrandModel.swift
//  FIPEnaMao
//
//  Created by Breno Ramos on 27/05/18.
//  Copyright © 2018 brenor2. All rights reserved.
//

import Foundation

struct BrandModel : Codable {
    let nome : String?
    let codigo : Int?
    
    enum CodingKeys: String, CodingKey {
        case nome = "nome"
        case codigo = "codigo"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        nome = try values.decodeIfPresent(String.self, forKey: .nome)
        codigo = try values.decodeIfPresent(Int.self, forKey: .codigo)
    }
    
}

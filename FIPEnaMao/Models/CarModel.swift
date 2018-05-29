//
//  CarModel.swift
//  FIPEnaMao
//
//  Created by Breno Ramos on 26/05/18.
//  Copyright © 2018 brenor2. All rights reserved.
//

import Foundation

struct CarModel : Codable {
    let valor : String?
    let marca : String?
    let modelo : String?
    let anoModelo : Int?
    let combustivel : String?
    let codigoFipe : String?
    let mesReferencia : String?
    let tipoVeiculo : Int?
    let siglaCombustivel : String?
    
    enum CodingKeys: String, CodingKey {
        
        case valor = "Valor"
        case marca = "Marca"
        case modelo = "Modelo"
        case anoModelo = "AnoModelo"
        case combustivel = "Combustivel"
        case codigoFipe = "CodigoFipe"
        case mesReferencia = "MesReferencia"
        case tipoVeiculo = "TipoVeiculo"
        case siglaCombustivel = "SiglaCombustivel"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        valor = try values.decodeIfPresent(String.self, forKey: .valor)
        marca = try values.decodeIfPresent(String.self, forKey: .marca)
        modelo = try values.decodeIfPresent(String.self, forKey: .modelo)
        anoModelo = try values.decodeIfPresent(Int.self, forKey: .anoModelo)
        combustivel = try values.decodeIfPresent(String.self, forKey: .combustivel)
        codigoFipe = try values.decodeIfPresent(String.self, forKey: .codigoFipe)
        mesReferencia = try values.decodeIfPresent(String.self, forKey: .mesReferencia)
        tipoVeiculo = try values.decodeIfPresent(Int.self, forKey: .tipoVeiculo)
        siglaCombustivel = try values.decodeIfPresent(String.self, forKey: .siglaCombustivel)
    }
    
}

//
//  AddressDTO.swift
//  Fakestagram
//
//  Created by Diplomado on 07/06/24.
//

import Foundation

struct AddressDTO: Decodable {
    var city: String?
    var street: String?
    
    private enum CodingKeys: String, CodingKey {
        case city = "cityOfResidence"
        case street
    }
}

// Codable = Decodable + Encodable

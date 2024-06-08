//
//  UserDTO.swift
//  Fakestagram
//
//  Created by Diplomado on 07/06/24.
//

import Foundation

struct UserDTO: Decodable {
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var address: AddressDTO?
}

// Codable = Decodable + Encodable

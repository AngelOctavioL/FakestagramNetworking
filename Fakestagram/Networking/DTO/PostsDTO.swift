//
//  PostDTO.swift
//  Fakestagram
//
//  Created by Diplomado on 07/06/24.
//

import Foundation

struct PostsDTO: Decodable {
    var id: Int?
    var title: String?
    var body: String?
}

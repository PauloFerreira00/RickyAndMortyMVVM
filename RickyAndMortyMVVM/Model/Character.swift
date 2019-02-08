//
//  Character.swift
//  RickyAndMortyMVVM
//
//  Created by stags on 31/01/19.
//  Copyright © 2019 Paulo. All rights reserved.
//

struct Character: Codable{
    let id: Int
    let name: String
    let species: String
    let gender: String
    let image: String
    let origin: Origin
}
struct Origin: Codable{
    let name: String
}
struct ResponseCharacter: Codable{
    let results: [Character]
}

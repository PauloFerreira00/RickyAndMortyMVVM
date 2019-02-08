//
//  CharacterAPI.swift
//  RickyAndMortyMVVM
//
//  Created by stags on 31/01/19.
//  Copyright © 2019 Paulo. All rights reserved.
//

import Moya

enum CharacterAPI{
    case listCharacters
    case characterDetail(id: Int)
}
extension CharacterAPI: TargetType{
    var baseURL: URL {
        return URL(string: "https://rickandmortyapi.com/api")!
    }
    
    var path: String {
        switch self {
        case .listCharacters:
            return "/character"
        case .characterDetail(let id):
            return "/character/\(id)"
        }
    }
    
    var method: Method {
        switch self {
        case .listCharacters, .characterDetail:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .listCharacters, .characterDetail:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

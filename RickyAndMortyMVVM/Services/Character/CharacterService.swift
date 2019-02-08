//
//  CharacterService.swift
//  RickyAndMortyMVVM
//
//  Created by stags on 31/01/19.
//  Copyright © 2019 Paulo. All rights reserved.
//

import RxSwift
import Moya
import SwiftyJSON

protocol CharacterServiceContract {
    func fetchCharacters() -> Observable<[Character]>
}

class CharacterService: CharacterServiceContract{
    static let shared = CharacterService()
    
    let provider = MoyaProvider<CharacterAPI>()
    
    func fetchCharacters() -> Observable<[Character]> {
        return provider.rx.request(.listCharacters).map { response in
            
            guard let response = try? response.filterSuccessfulStatusCodes(), let data = try? response.data else {
                return []
            }
            do {
                let characters = try JSONDecoder().decode(ResponseCharacter.self, from: data)
                print("Loading characters: ",characters.results)
                return characters.results
            }catch{
                print("Error: ", error)
                return []
            }
            }.asObservable()
    }
}

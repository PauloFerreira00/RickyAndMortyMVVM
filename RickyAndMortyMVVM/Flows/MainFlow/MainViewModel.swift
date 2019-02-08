//
//  MainViewModel.swift
//  RickyAndMortyMVVM
//
//  Created by stags on 31/01/19.
//  Copyright © 2019 Paulo. All rights reserved.
//

import RxCocoa
import RxSwift
import RxFlow

protocol MainViewModelContract{
    func fetchCharacters() -> Driver<[Character]>
    func navigateToDetail(character: Character)
}

class MainViewModel: Stepper, MainViewModelContract {

    let characterService: CharacterServiceContract
    
    init(with characterService: CharacterServiceContract){
        self.characterService = characterService
    }
    
    func fetchCharacters() -> Driver<[Character]> {
        return self.characterService.fetchCharacters().asDriver(onErrorJustReturn: [])
    }
    
    func navigateToDetail(character: Character) {
        self.step.accept(MainStep.detailCharacter(character: character))
    }
}

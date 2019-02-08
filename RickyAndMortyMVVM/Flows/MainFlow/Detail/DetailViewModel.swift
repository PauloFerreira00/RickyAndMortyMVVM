//
//  DetailViewModel.swift
//  RickyAndMortyMVVM
//
//  Created by stags on 05/02/19.
//  Copyright © 2019 Paulo. All rights reserved.
//

import Foundation
import RxFlow
import RxSwift

protocol DetailViewModelContract {
    var character: Character? { get }
}

class DetailViewModel: DetailViewModelContract, Stepper{
    internal var character: Character?
    
    init(with character: Character) {
        self.character = character
    }
    
}

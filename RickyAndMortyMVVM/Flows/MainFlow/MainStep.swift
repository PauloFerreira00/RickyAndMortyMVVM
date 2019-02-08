//
//  MainStep.swift
//  RickyAndMortyMVVM
//
//  Created by stags on 30/01/19.
//  Copyright © 2019 Paulo. All rights reserved.
//

import RxFlow

enum MainStep: Step{
    case listCharacters
    case detailCharacter(character: Character)
}

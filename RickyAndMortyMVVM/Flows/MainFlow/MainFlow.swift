//
//  MainFlow.swift
//  RickyAndMortyMVVM
//
//  Created by stags on 30/01/19.
//  Copyright © 2019 Paulo. All rights reserved.
//

import RxFlow
import UIKit

class MainFlow: Flow {
    var root: Presentable{
        return self.rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        viewController.setNavigationBarHidden(false, animated: false)
        viewController.navigationBar.prefersLargeTitles = true
        return viewController
    }()
    
    
    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? MainStep else{
            return .none
        }
        
        switch step {
        case .listCharacters:
            return navigateToCharactersList()
        case .detailCharacter(let character):
            return navigateToCharacterDetail(character)
        }
    }
    
    func navigateToCharacterDetail(_ character: Character) -> NextFlowItems{
        let viewModel = DetailViewModel(with: character)
        let viewController = DetailViewController.instantiate(with: viewModel)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .none
    }
    
    func navigateToCharactersList() -> NextFlowItems{
        let viewModel = MainViewModel(with: CharacterService.shared)
        let viewController = MainViewController.instatiate(with: viewModel)
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowItem: NextFlowItem(nextPresentable: viewController, nextStepper: viewModel))
    }
}

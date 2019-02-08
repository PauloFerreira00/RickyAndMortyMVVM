//
//  StartupFlow.swift
//  RickyAndMortyMVVM
//
//  Created by stags on 30/01/19.
//  Copyright © 2019 Paulo. All rights reserved.
//

import RxFlow

class StartupFlow : Flow{
    
    var root: Presentable{
        return self.rootViewController
    }
    
    private lazy var rootViewController: UIViewController = {
        return UIViewController()
    }()
    
    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? StartupStep else{
            return .none
        }
    
        switch step {
        case .selectInitialFlow:
            return chooseInitialFlow()
        }
    }
    
    private func chooseInitialFlow() -> NextFlowItems{
        let mainFlow = MainFlow()
        
        Flows.whenReady(flow1: mainFlow) { [unowned self]  (root) in
            self.rootViewController.present(root, animated: true, completion: nil)
        }
        
        return .one(flowItem: NextFlowItem(nextPresentable: mainFlow, nextStepper: OneStepper(withSingleStep: MainStep.listCharacters)))
    }
}



//
//  MainViewController.swift
//  RickyAndMortyMVVM
//
//  Created by stags on 31/01/19.
//  Copyright © 2019 Paulo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

class MainViewController: UITableViewController, Stepper {
    
    static func instatiate(with viewModel: MainViewModelContract) -> MainViewController{
        let viewController = R.storyboard.main.instantiateInitialViewController()!
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    var viewModel: MainViewModelContract!
    
    let disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tableView.dataSource = nil
        tableView.delegate = nil
        bind()
    }
    func setupView(){
        title = "Characters"
        self.tableView.rx.modelSelected(Character.self)
            .subscribe({ [weak self] item in
//                print(item.name)
                if let item = item.element{
                    self?.viewModel.navigateToDetail(character: item)
                }
            }).disposed(by: disposeBag)
    }
    

    private func bind() {
        self.viewModel.fetchCharacters().drive(self.tableView.rx.items(cellIdentifier: "CharacterCell", cellType: CharacterCell.self)) { (_,element,cell) in
            cell.set(character: element)
        }.disposed(by: disposeBag)
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
}




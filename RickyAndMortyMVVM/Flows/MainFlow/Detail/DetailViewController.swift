//
//  DetailViewController.swift
//  RickyAndMortyMVVM
//
//  Created by stags on 05/02/19.
//  Copyright © 2019 Paulo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class DetailViewController: UIViewController {
    
    @IBOutlet weak var ivThumb: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbSpecies: UILabel!
    @IBOutlet weak var lbGender: UILabel!
    @IBOutlet weak var lbOrigin: UILabel!
    
    var viewModel: DetailViewModelContract!
    
    let disposeBag: DisposeBag = DisposeBag()

    static func instantiate(with viewModel: DetailViewModelContract) -> DetailViewController{
        let viewController =  R.storyboard.detail.instantiateInitialViewController()!
        viewController.viewModel = viewModel
        
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bind()
    }
    
    func setupView(){
        ivThumb.clipsToBounds = true
        ivThumb.layer.cornerRadius = self.ivThumb.frame.height / 2
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func bind(){
        if let url = URL(string: viewModel.character?.image ?? ""){
            ivThumb.kf.indicatorType = .activity
            ivThumb.kf.setImage(with: url)
        }
        lbName.text = viewModel.character?.name
        lbSpecies.text = viewModel.character?.species
        lbGender.text = viewModel.character?.gender
        lbOrigin.text = viewModel.character?.origin.name
    }
}

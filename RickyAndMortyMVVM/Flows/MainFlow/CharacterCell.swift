//
//  CharacterCell.swift
//  RickyAndMortyMVVM
//
//  Created by stags on 31/01/19.
//  Copyright © 2019 Paulo. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterCell: UITableViewCell {
    
    @IBOutlet weak var ivThumb: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbSpecies: UILabel!
    @IBOutlet weak var lbLocation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(character: Character){
        if let url = URL(string: character.image){
            ivThumb.kf.indicatorType = .activity
            ivThumb.kf.setImage(with: url)
        }
        lbName.text = character.name
        lbSpecies.text = character.species
        lbLocation.text = character.origin.name
    }
}

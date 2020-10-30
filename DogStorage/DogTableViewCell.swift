//
//  TableViewCell.swift
//  DogStorage
//
//  Created by Gharin Pautz on 10/28/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

class DogTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var breedLabel: UILabel!
    @IBOutlet var dogImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(with dog: Dog) {
        nameLabel.text = dog.name
        breedLabel.text = dog.breed
        dogImageView.image = UIImage(named: dog.imageName)
    }
}

//
//  MountainCollectionViewCell.swift
//  TravelDestinationProject
//
//  Created by GEU on 30/01/26.
//

import UIKit

class MountainCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 10
           self.layer.masksToBounds = true
    }
    func configureCell(with destination: Destination) {
        self.imageView.image = UIImage(named: destination.imagePath)
    }

}

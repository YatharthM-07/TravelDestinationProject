//
//  UrbanCollectionViewCell.swift
//  TravelDestinationProject
//
//  Created by GEU on 30/01/26.
//

import UIKit

class UrbanCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
           self.layer.masksToBounds = true
        // Initialization code
    }
    func configureCell(destination: Destination){
        //display the destination image of the image view
        imageView.image = UIImage(named: destination.imagePath)
    }

}

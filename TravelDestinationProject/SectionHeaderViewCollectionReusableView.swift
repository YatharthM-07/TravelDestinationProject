//
//  SectionHeaderViewCollectionReusableView.swift
//  TravelDestinationProject
//
//  Created by GEU on 30/01/26.
//

import UIKit

class SectionHeaderViewCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var headerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with title: String) {
        headerLabel.text = title
    }
}

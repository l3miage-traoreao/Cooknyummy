//
//  CustomCollectionViewCell.swift
//  Cooknyummy
//
//  Created by traoreao on 29/06/2022.
//

import Foundation
import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

 
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    func configure(_ index: Int) {
        
        titleLabel.text = String(index)
    }
}

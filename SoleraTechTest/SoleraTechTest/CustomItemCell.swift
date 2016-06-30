//
//  CustomItemCell.swift
//  SoleraTechTest
//
//  Created by Bruno Rodrigues on 30/06/2016.
//
//

import Foundation
import UIKit

class CustomItemCell : UICollectionViewCell {
   
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    override func didMoveToSuperview() {
        //        layer.borderColor = UIColor.orangeColor().CGColor
        layer.borderWidth = 0
        layer.cornerRadius = 2
        layer.masksToBounds = true
    }
}

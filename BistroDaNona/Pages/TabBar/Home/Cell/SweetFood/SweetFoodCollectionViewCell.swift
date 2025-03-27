//
//  SweetFoodCollectionViewCell.swift
//  BistroDaNona
//
//  Created by Thiago Neves on 26/01/25.
//

import UIKit

class SweetFoodCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static let identifier: String = String(describing: SweetFoodCollectionViewCell.self)
    
        static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    
    func setupCell(whit item: String){

    }

}

//
//  SweetFoodCollectionViewCell.swift
//  BistroDaNona
//
//  Created by Thiago Neves on 26/01/25.
//

import UIKit

class SweetFoodCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleSweetFood: UILabel!
    @IBOutlet weak var pictureSweetFood: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static let identifier: String = String(describing: SweetFoodCollectionViewCell.self)
    
        static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    
    func setupCell(whit item: String)-> String{
        titleSweetFood.text = item
        pictureSweetFood.image =  UIImage(named: item)
        
        return item
    }

}

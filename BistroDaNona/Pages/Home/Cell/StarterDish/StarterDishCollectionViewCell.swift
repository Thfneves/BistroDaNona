//
//  StarterDishCollectionViewCell.swift
//  BistroDaNona
//
//  Created by Thiago Neves on 17/01/25.
//

import UIKit

class StarterDishCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var titleStarterDish: UILabel!
    @IBOutlet weak var pictureStarterDish: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()


    }
    
    static let identifier: String = String(describing: StarterDishCollectionViewCell.self)
    
        static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    
    func setupCell(whit item: String){
        titleStarterDish.text = item
        pictureStarterDish.image =  UIImage(named: item)
    }
    
}

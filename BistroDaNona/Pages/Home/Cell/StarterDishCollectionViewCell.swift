//
//  StarterDishCollectionViewCell.swift
//  BistroDaNona
//
//  Created by Thiago Neves on 17/01/25.
//

import UIKit

class StarterDishCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var TitleStarterDish: UILabel!
    @IBOutlet weak var PictureStarterDish: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    static let identifier: String = String(describing: StarterDishCollectionViewCell.self)
    
        static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    
    func setupCell(whit item: Item){
        TitleStarterDish.text = item.item
        PictureStarterDish.image = UIImage(named:item.item)
    }
    
}

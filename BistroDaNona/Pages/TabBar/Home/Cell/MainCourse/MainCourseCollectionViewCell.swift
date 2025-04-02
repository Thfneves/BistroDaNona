//
//  MainCourseCollectionViewCell.swift
//  BistroDaNona
//
//  Created by Thiago Neves on 26/01/25.
//

import UIKit

class MainCourseCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleMainCourse: UILabel!
    @IBOutlet weak var pictureMainCourse: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static let identifier: String = String(describing: MainCourseCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func setupCell(whit item: String){
        
        titleMainCourse.text = item
        pictureMainCourse.image =  UIImage(named: item)
    }
    
}

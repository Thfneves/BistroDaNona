//
//  CartTableView.swift
//  BistroDaNona
//
//  Created by Thiago Neves on 11/03/25.
//

import UIKit

class CartTableView: UITableViewCell {
    
    
    @IBOutlet weak var cartName: UILabel!
    
    @IBOutlet weak var howManyCartName: UILabel!
    @IBOutlet weak var priceCartName: UILabel!
    
    static let identifier: String = String(describing: CartTableView.self)
    
        static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with dish: Dish) {
        cartName.text = dish.plateName
        howManyCartName.text = "1"
        priceCartName.text = String(format: "%.2f", dish.price)
        

    }
    
    
    
    
}

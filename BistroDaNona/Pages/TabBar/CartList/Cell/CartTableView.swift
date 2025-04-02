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
        
    }
    protocol CartCellDelegate: AnyObject {
        func didTapRemoveButton(cell: CartTableView)
    }
    weak var delegate: CartCellDelegate?
    
    @IBAction func RemoveCell(_ sender: UIButton) {
        delegate?.didTapRemoveButton(cell: self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(with dish: Dish) {
        
        let priceDecimal = Decimal(dish.price)
        cartName.text = dish.plateName
        howManyCartName.text = "1"
        priceCartName.text = String(format: "%.2f", NSDecimalNumber(decimal: priceDecimal).doubleValue)
        
    }
    
}

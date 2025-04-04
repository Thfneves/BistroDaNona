//
//  CartViewModel.swift
//  BistroDaNona
//
//  Created by Thiago Neves on 03/04/25.
//

import Foundation


class CartViewModel {
    
    var items: [Dish] {
        return DataManager.shared.items
    }
    
    var totalPrice: String {
        let total = items.reduce(0) { $0 + $1.price }
        return String(format: "R$ %.2f", total)
    }
    
    var onItemsUpdated: (() -> Void)?
    
    func removeItem(at index: Int) {
        guard index < items.count else { return }
        DataManager.shared.items.remove(at: index)
        onItemsUpdated?()
    }
}

//
//  HalfPageViewModel.swift
//  BistroDaNona
//
//  Created by Thiago Neves on 02/04/25.
//

import Foundation
import UIKit

class HalfPageViewModel {
    
    private var selectedDish: Dish?
    
    var plateName: String? {
        return selectedDish?.plateName
    }
    
    var dishDescription: String? {
        return selectedDish?.description
    }
    
    var peopleServedText: String? {
        guard let people = selectedDish?.forManyPeople else { return nil }
        return "Serve até \(people) pessoas"
    }
    
    var imageName: String? {
        return selectedDish?.plateName
    }
    
    var priceText: String? {
        guard let price = selectedDish?.price else { return nil }
        return "R$ \(price)"
    }
    
    func updateData(receivedArray: [Dish], selectedItem: String) {
        self.selectedDish = receivedArray.first(where: { $0.plateName == selectedItem })
    }
}

//
//  HalfPage.swift
//  BistroDaNona
//
//  Created by Thiago Neves on 25/01/25.
//

import UIKit

class HalfPageViewController: UIViewController {
    
    @IBOutlet weak var halfPageMenuTitle: UILabel!
    @IBOutlet weak var halfPageText: UITextView!
    @IBOutlet weak var halfPageHowManyPeople: UILabel!
    @IBOutlet weak var halfPageImage: UIImageView!
    @IBOutlet weak var halfPagePrice: UILabel!
    @IBOutlet weak var halfPageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atritubedHalf(receivedArray: receivedArray, selectedItem: selectedItem!)
    }
    
    func receiveData(selectedItem: String?, arraySelected: [Dish]) {
        self.selectedItem = selectedItem
        self.receivedArray = arraySelected
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        atritubedHalf(receivedArray: receivedArray, selectedItem: selectedItem!)
    }
    
    var indexSelected: Int?
    var selectedItem: String?
    var receivedArray: [Dish] = []
    
    func atritubedHalf(receivedArray: [Dish], selectedItem: String) {
        
        for Dish in receivedArray {
            
            if Dish.plateName == selectedItem{
                halfPageMenuTitle.text = Dish.plateName
                halfPageText.text = Dish.description
                halfPageHowManyPeople.text = "Serve até \(String(Dish.forManyPeople)) pessoas"
                halfPageImage.image = UIImage(named: Dish.plateName)
                halfPagePrice.text = "R$ \(Dish.price)"
                
            }
        }
    }
    
    @IBAction func SendManageCart(_ sender: UIButton) {
        
        if let selectedItem = selectedItem,
           let dish = receivedArray.first(where: { $0.plateName == selectedItem }) {
            
            CartManager.shared.items.append(dish)
        } else {
            print("Erro: prato não encontrado no array.")
            
        }
    }
    
}










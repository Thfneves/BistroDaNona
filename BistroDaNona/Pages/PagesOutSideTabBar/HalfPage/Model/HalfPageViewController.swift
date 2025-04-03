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
    
    var viewModel = HalfPageViewModel()
    
    var selectedItem: String?
    var receivedArray: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedItem = selectedItem {
            viewModel.updateData(receivedArray: receivedArray, selectedItem: selectedItem)
        }
        updateUI()
        
    }
    
    func configureViewModel(receivedArray: [Dish], selectedItem: String) {
        self.receivedArray = receivedArray
        self.selectedItem = selectedItem
        viewModel.updateData(receivedArray: receivedArray, selectedItem: selectedItem)
        
    }

    
    func updateUI() {
        halfPageMenuTitle.text = viewModel.plateName
        halfPageText.text = viewModel.dishDescription
        halfPageHowManyPeople.text = viewModel.peopleServedText
        if let imageName = viewModel.imageName {
            halfPageImage.image = UIImage(named: imageName)
        }
        halfPagePrice.text = viewModel.priceText
    }
    
    @IBAction func SendManageCart(_ sender: UIButton) {
        if let selectedItem = selectedItem,
           let dish = receivedArray.first(where: { $0.plateName == selectedItem }) {
            DataManager.shared.items.append(dish)
        } else {
            print("Erro: prato não encontrado no array.")
        }
    }
}










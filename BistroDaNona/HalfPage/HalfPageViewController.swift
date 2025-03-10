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
    
    
    
    func receiveData(selectedItem: String?, indexSelected: Int?, arraySelected: [Dish]) {
        self.selectedItem = selectedItem
        self.indexSelected = indexSelected
        self.receivedArray = arraySelected
    }
   
    var indexSelected: Int?
    var selectedItem: String?
    var receivedArray: [Dish] = []
   
    override func viewDidDisappear(_ animated: Bool) {
       super.viewDidDisappear(animated)
   
   }
    var countReceive = receiveData.self
    
    func atritubedHalf(receivedArray: [Dish], indexSelected: Int, selectedItem: String) {
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        halfPageMenuTitle.text = receivedArray[indexSelected!].plateName
    }

    

    
    
    

}

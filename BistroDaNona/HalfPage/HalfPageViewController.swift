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
    
    
    var selectedItem: String?
    
    
    override func viewDidDisappear(_ animated: Bool) {
       super.viewDidDisappear(animated)
   
   }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }

  
    func setUpView(selectItem: String) {
        if let selectItem = selectedItem {
            print("essa foi a interacao do usuario \(selectItem)")
        }
    }

    
    
    

}

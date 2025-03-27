//
//  PersonViewController.swift
//  BistroDaNona
//
//  Created by Thiago Neves on 16/01/25.
//

import UIKit

class PersonViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var changeEditUser: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeEditUser.isUserInteractionEnabled = true
        
        
        let tapForgotPassword = UITapGestureRecognizer(target: self, action: #selector(editUser))
        changeEditUser.addGestureRecognizer(tapForgotPassword)
        
        
    }
    
    @IBAction func ButtonLogar(_ sender: UIButton) {

    }
    
    @objc func editUser() {
        changeEditUser.textColor = .blue

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.changeEditUser.textColor = .white
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                if let vc = UIStoryboard(name: "PageOfRegisterViewController", bundle: nil).instantiateViewController(withIdentifier: "PageOfRegisterViewController") as? PageOfRegisterViewController {
                    
                    if let presentationController = vc.presentationController as? UISheetPresentationController {
                        presentationController.detents = [.large()]
                    }
                    self.present(vc, animated: true)
                }
                
                
            }
        }
        
    }}


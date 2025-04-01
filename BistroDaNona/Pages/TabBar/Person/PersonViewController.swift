//
//  PersonViewController.swift
//  BistroDaNona
//
//  Created by Thiago Neves on 16/01/25.
//

import UIKit

class PersonViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberTextField.delegate = self
        addressTextField.delegate = self
        
    }
    
    func isValidPhone(_ phone: String) -> Bool {
        let phoneCount = phone.count
        return phoneCount >= 8 && phoneCount <= 9
    }
    
    func isValidEmail(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".com")
    }
    
    func validationRegister() -> Bool {
        guard let name = nameTextField.text, !name.isEmpty,
              let email = emailTextField.text, !email.isEmpty,
              let phone = phoneNumberTextField.text, !phone.isEmpty,
              let address = addressTextField.text, !address.isEmpty else {
            showAlert(title: "Erro", message: "Preencha todos os campos.")
            return false
        }
        
        if !isValidPhone(phone) {
            showAlert(title: "Erro", message: "O telefone deve ter entre 8 e 9 dígitos.")
            return false
        }
        
        if !isValidEmail(email) {
            showAlert(title: "Erro", message: "E-mail inválido. Deve conter '@' e '.com'.")
            return false
        }
        
        return true
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            alert.dismiss(animated: true)
        }
    }
    
    func showSuccessAlert() {
        let alert = UIAlertController(title: "Sucesso", message: "Enviado com sucesso!", preferredStyle: .alert)
        present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            alert.dismiss(animated: true)
        }
    }
    
    @IBAction func ButtonLogar(_ sender: UIButton) {
        if validationRegister() == true {
            if let phoneText = phoneNumberTextField.text, let cepText = addressTextField.text,
               let phone = Int(phoneText), let cep = Int(cepText) {
                
                let person = Person(
                    name: nameTextField.text!,
                    email: emailTextField.text!,
                    phone: phone,
                    adress: cep
                )
                
                print("Dados cadastrados: \(person)")
                showSuccessAlert()
            } else {
                showAlert(title: "Erro", message: "Telefone ou CEP inválidos.")
            }
        }
    }
    @objc(textField:shouldChangeCharactersInRange:replacementString:) func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == phoneNumberTextField || textField == addressTextField {
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            
            if textField == phoneNumberTextField {
                let newLength = (textField.text?.count ?? 0) + string.count - range.length
                if newLength > 9 { return false }
            }
            
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
    
}


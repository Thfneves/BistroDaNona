//
//  CartViewController.swift
//  BistroDaNona
//
//  Created by Thiago Neves on 16/01/25.
//

import UIKit

class CartViewController: UIViewController, CartTableView.CartCellDelegate {
    
    @IBOutlet weak var carListTableView: UITableView!
    @IBOutlet weak var totalCart: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTableView()
        
    }
    
    @IBAction func nextBuy(_ sender: UIButton) {
        
        if let vc = UIStoryboard(name: "PaymentViewController", bundle: nil).instantiateViewController(withIdentifier: "PaymentViewController") as? PaymentViewController {
            
            if let presentationController = vc.presentationController as? UISheetPresentationController {
                presentationController.detents = [.large()]
            }
            self.present(vc, animated: true)
            
        }
    }
    var items: [Dish] {
        return CartManager.shared.items
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        carListTableView.reloadData()
        totalCart.text = String(calculaTotal())
    }
    
    func receiveData(arraySelected: [Dish]) {
        self.receivedArray = arraySelected
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    var receivedArray: [Dish] = []
    
    
    func cartTableView(){
        carListTableView.delegate = self
        carListTableView.dataSource = self
        carListTableView.register(CartTableView.nib(), forCellReuseIdentifier: CartTableView.identifier)
        carListTableView.reloadData()
    }
    
    
    func calculaTotal() -> Double{
        
        var soma = 00.00
        
        for dish in items {
            soma += dish.price
            print(soma)
            print(dish.price)
        }
        return soma
    }
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableView.identifier, for: indexPath) as? CartTableView else {
            return UITableViewCell()
        }
        
        let item = items[indexPath.row]
        cell.configure(with: item)
        cell.delegate = self
        
        return cell
    }
    
    func didTapRemoveButton(cell: CartTableView) {
        if let indexPath = carListTableView.indexPath(for: cell) {
            CartManager.shared.items.remove(at: indexPath.row)
            carListTableView.deleteRows(at: [indexPath], with: .automatic)
            totalCart.text = String(calculaTotal())
        }
    }
}




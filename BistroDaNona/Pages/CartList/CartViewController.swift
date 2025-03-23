//
//  CartViewController.swift
//  BistroDaNona
//
//  Created by Thiago Neves on 16/01/25.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var carListTableView: UITableView!
    @IBOutlet weak var totalCart: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTableView()
        
        
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
        return cell
        
        }
        
        func tableView(_ tableView: UITableView, numberOfItemsInSection section: Int) -> Int {
            return 1
        }
        
        
        
        
    
}

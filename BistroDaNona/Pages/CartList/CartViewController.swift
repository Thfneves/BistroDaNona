//
//  CartViewController.swift
//  BistroDaNona
//
//  Created by Thiago Neves on 16/01/25.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var carTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        carTableView.reloadData()
    }
    
    
    func cartTableView(){
        carTableView.delegate = self
        carTableView.dataSource = self
        carTableView.register(CartTableView.nib(), forCellReuseIdentifier: CartTableView.identifier)
        carTableView.reloadData()
    }
    
    
    var items: [Dish] {
        return CartManager.shared.items
    }

}

extension CartViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Itens no array: \(items.count)")
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

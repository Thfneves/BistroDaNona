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
    
    var viewModel = CartViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        viewModel.onItemsUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.carListTableView.reloadData()
                self?.totalCart.text = self?.viewModel.totalPrice
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        carListTableView.reloadData()
        totalCart.text = viewModel.totalPrice
    }
    
    @IBAction func nextBuy(_ sender: UIButton) {
        
        if let vc = UIStoryboard(name: "PaymentViewController", bundle: nil).instantiateViewController(withIdentifier: "PaymentViewController") as? PaymentViewController {
            
            if let presentationController = vc.presentationController as? UISheetPresentationController {
                presentationController.detents = [.large()]
            }
            self.present(vc, animated: true)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    func setupTableView() {
        carListTableView.delegate = self
        carListTableView.dataSource = self
        carListTableView.register(CartTableView.nib(), forCellReuseIdentifier: CartTableView.identifier)
        carListTableView.reloadData()
    }
    
    func didTapRemoveButton(cell: CartTableView) {
        if let indexPath = carListTableView.indexPath(for: cell) {
            viewModel.removeItem(at: indexPath.row)
        }
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableView.identifier, for: indexPath) as? CartTableView else {
            return UITableViewCell()
        }
        
        let item = viewModel.items[indexPath.row]
        cell.configure(with: item)
        cell.delegate = self
        
        return cell
    }
}




//
//  HomeScreenViewController.swift
//  BistroDaNona
//
//  Created by Thiago Neves on 16/01/25.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var starterDish: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confighomeScreen()
       
    }
    func confighomeScreen(){
        starterDish.delegate = self
        starterDish.dataSource = self
        starterDish.register(UINib(nibName: "StarterDishCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: StarterDishCollectionViewCell.identifier)
        if let layout = starterDish.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
        }
    }


    var itemsList: [Item] = [
        Item(item: "Starter Dish"),
        Item(item: "Starter"),
        Item(item: "Dish"),
        Item(item: "Teste")
    ]
    
}

extension HomeScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StarterDishCollectionViewCell.identifier, for: indexPath) as? StarterDishCollectionViewCell
        cell?.setupCell (whit: itemsList[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}

extension HomeScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.0, height: collectionView.frame.width / 2.0 * 1.5)
    }
}

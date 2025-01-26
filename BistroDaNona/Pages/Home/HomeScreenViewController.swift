//
//  HomeScreenViewController.swift
//  BistroDaNona
//
//  Created by Thiago Neves on 16/01/25.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var starterDish: UICollectionView!
    @IBOutlet weak var mainCourse: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confighomeScreen()
        starterDish.backgroundColor = .clear
    }
    
    func confighomeScreen(){
        //                                       StarterDish
        starterDish.delegate = self
        starterDish.dataSource = self
        //                                       MainCourse
        mainCourse.delegate = self
        mainCourse.dataSource = self
        //                                       StarterDish
        starterDish.register(UINib(nibName: "StarterDishCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: StarterDishCollectionViewCell.identifier)
        
        //                                //                                       MainCourse
        mainCourse.register(UINib(nibName: "MainCourseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MainCourseCollectionViewCell.identifier)
        
        
    }
    
    var itemsList: [Item] = [
        Item(item: "AntePasto"),
        Item(item: "BurrataDeBufala"),
        Item(item: "CanapéDeSalame"),
        Item(item: "CanapesGeleiaDamasco"),
        Item(item: "CanapeTapiocaPresuntoParma"),
        Item(item: "MiniQuiches"),
        Item(item: "QueijoBrieComGeleia")
        
    ]
}


extension HomeScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == starterDish {
            return itemsList.count
        } else {
            return itemsList.count
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == starterDish {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StarterDishCollectionViewCell.identifier, for: indexPath) as? StarterDishCollectionViewCell
            cell?.setupCell (whit: itemsList[indexPath.row])
            return cell ?? UICollectionViewCell()
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCourseCollectionViewCell.identifier, for: indexPath) as? MainCourseCollectionViewCell
            cell?.setupCell (whit: itemsList[indexPath.row])
            return cell ?? UICollectionViewCell()
        }
        

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var item = itemsList[indexPath.row]
        
        let vc: HalfPageViewController? = UIStoryboard(name: "HalfPageViewController", bundle: nil).instantiateViewController(withIdentifier: "HalfPageViewController") as? HalfPageViewController
        present( vc ??  UIViewController(), animated: true)
        
    }
    
    
}


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
    
    @IBOutlet weak var drinksCollectionView: UICollectionView!
    @IBOutlet weak var sweetFood: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confighomeScreen()
        starterDish.backgroundColor = .clear
        
    }
    
    func confighomeScreen(){
        //                                       StarterDish
        starterDish.delegate = self
        starterDish.dataSource = self
        starterDish.register(UINib(nibName: "StarterDishCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: StarterDishCollectionViewCell.identifier)
        //                                       MainCourse
        mainCourse.delegate = self
        mainCourse.dataSource = self
        mainCourse.register(UINib(nibName: "MainCourseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MainCourseCollectionViewCell.identifier)
        //                                       SweetFood
        sweetFood.delegate = self
        sweetFood.dataSource = self
        sweetFood.register(UINib(nibName: "SweetFoodCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: SweetFoodCollectionViewCell.identifier)
        //                                       MainCourse
        drinksCollectionView.delegate = self
        drinksCollectionView.dataSource = self
        drinksCollectionView.register(UINib(nibName: "DrinksCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: DrinksCollectionViewCell.identifier)
        
    }
    
        var itemsStarterDish: [StarterDish] = [
            StarterDish(plateName:  "Ante Pasto", description: "teste", price: 39.90 , forManyPeople: 3, imagesStarterDish: "Ante Pasto"),
            StarterDish(plateName:  "Burrata de Bufala", description: "teste", price: 39.90 , forManyPeople: 3, imagesStarterDish: "Burrata de Bufala"),
            StarterDish(plateName:  "Canapé De Salame", description: "teste", price: 39.90 , forManyPeople: 3, imagesStarterDish: "Canapé De Salame"),
            StarterDish(plateName:  "Mini Quiches", description: "teste", price: 39.90 , forManyPeople: 3, imagesStarterDish: "Mini Quiches"),
            StarterDish(plateName:  "Canapé De Salame", description: "teste", price: 39.90 , forManyPeople: 3, imagesStarterDish: "Canapé De Salame"),
            StarterDish(plateName:  "Queijo Brie de Geleia", description: "teste", price: 39.90 , forManyPeople: 3, imagesStarterDish: "Queijo Brie de Geleia"),
        ]
        var itemsMainCourse: [MainCourse] = [
            MainCourse(plateName:  "itemsMainCourse 0", description: "itemsMainCourse 0Descrip", price: 39.90 , forManyPeople: 3),
            MainCourse(plateName:  "itemsMainCourse 1", description: "itemsMainCourse 1Descrip", price: 39.90 , forManyPeople: 3),
            MainCourse(plateName:  "itemsMainCourse2", description: "itemsMainCourse 2Descrip", price: 39.90 , forManyPeople: 3),
        ]
        var itemsSweetFood: [MainCourse] = [
            MainCourse(plateName:  "itemsSweetFood 0", description: "itemsSweetFood 0", price: 39.90 , forManyPeople: 3),
            MainCourse(plateName:  "itemsSweetFood 1", description: "itemsSweetFood 1", price: 39.90 , forManyPeople: 3),
            MainCourse(plateName:  "itemsSweetFood 2", description: "itemsSweetFood 2", price: 39.90 , forManyPeople: 3),
        ]
        var itemsDrinks: [MainCourse] = [
            MainCourse(plateName:  "itemsDrinks", description: "teste", price: 39.90 , forManyPeople: 3),
            MainCourse(plateName:  "itemsDrinks", description: "teste", price: 39.90 , forManyPeople: 3),
            MainCourse(plateName:  "itemsDrinks", description: "teste", price: 39.90 , forManyPeople: 3),
        ]
    
    }


extension HomeScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
        
        
        if collectionView == starterDish {
            return itemsStarterDish.count
        } else if collectionView == mainCourse {
            return itemsMainCourse.count
        } else if collectionView == sweetFood {
            return itemsSweetFood.count
        } else {
            return itemsDrinks.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == starterDish {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StarterDishCollectionViewCell.identifier, for: indexPath) as? StarterDishCollectionViewCell
            
            if indexPath.item < itemsStarterDish.count {
                cell?.setupCell(whit: itemsStarterDish[indexPath.item].plateName)
            }
            return cell ?? UICollectionViewCell()
            
        } else if collectionView == mainCourse {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCourseCollectionViewCell.identifier, for: indexPath) as? MainCourseCollectionViewCell
            
            if indexPath.item < itemsMainCourse.count {
                cell?.setupCell(whit: itemsMainCourse[indexPath.item].plateName)
            }
            return cell ?? UICollectionViewCell()
            
        } else if collectionView == sweetFood {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SweetFoodCollectionViewCell.identifier, for: indexPath) as? SweetFoodCollectionViewCell
            
            if indexPath.item < itemsSweetFood.count {
                cell?.setupCell(whit: itemsSweetFood[indexPath.item].plateName)
            }
            return cell ?? UICollectionViewCell()
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DrinksCollectionViewCell.identifier, for: indexPath) as? DrinksCollectionViewCell
            
            if indexPath.item < itemsDrinks.count {
                cell?.setupCell(whit: itemsDrinks[indexPath.item].plateName)
            }
            return cell ?? UICollectionViewCell()
            
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var itemSelected : String?
     
        var arraySelected: [Dish]
        
        switch collectionView {
        case starterDish:
            itemSelected = itemsStarterDish[indexPath.item].plateName
            arraySelected = itemsStarterDish
                  
        case mainCourse:
            itemSelected = itemsMainCourse[indexPath.item].plateName
            arraySelected = itemsMainCourse

        case sweetFood:
            itemSelected = itemsSweetFood[indexPath.item].plateName
            arraySelected = itemsSweetFood
                  
        case drinksCollectionView:
            itemSelected = itemsDrinks[indexPath.item].plateName
            arraySelected = itemsDrinks
            
        default:
            arraySelected = itemsStarterDish
        }
        
        
        guard let selectedItem = itemSelected else { return }
        
        if let vc = UIStoryboard(name: "HalfPageViewController", bundle: nil).instantiateViewController(withIdentifier: "HalfPageViewController") as? HalfPageViewController {
      
            
            protocol DataReceiver {
                func receiveData(selectedItem: String?, indexSelected: Int?, arraySelected: [Dish])
            }
                        
            vc.receiveData(selectedItem: selectedItem, arraySelected: arraySelected)
            
            if let presentationController = vc.presentationController as? UISheetPresentationController {
                presentationController.detents = [.large()]
            }
            self.present(vc ?? UIViewController(), animated: true)
            
        }
        
    }
    
}



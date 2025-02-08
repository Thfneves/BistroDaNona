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
    
    
    
    var itemsList: [Menu] = [
        Menu(
            starterDish: [StarterDish(plateName:  [ "Ante Pasto", "Burrata de Bufala", "Canapé de Salame", "Canape de geleia de Damasco", "Mini Quiches", "Queijo Brie com Geleia"], description: [], price: [], forManyPeople: [])],
            mainCourse: [MainCourse(plateName: ["Bruschetta", "Salada Caesar", "Ceviche"], description: [], price: [], forManyPeople: [])],
            sweetFood: [SweetFood(plateName: ["Bruschetta", "Salada Caesar", "Ceviche"], description: [], price: [], forManyPeople: [])],
            drinks: [Drinks(plateName: ["Bruschetta", "Salada Caesar", "Ceviche"], description: [], price: [], forManyPeople: [])]
        )
    ]
    
    
}
extension HomeScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // Define o espaçamento entre as linhas (vertical)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5 // Altere esse valor para o espaçamento desejado
    }

    // Define o espaçamento entre os itens na mesma linha (horizontal)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5 // Altere esse valor para o espaçamento desejado
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == starterDish {
            return itemsList.first?.starterDish.first?.plateName.count ?? 0
        } else if collectionView == mainCourse {
            return itemsList.first?.mainCourse.first?.plateName.count ?? 0
        } else if collectionView == sweetFood {
            return itemsList.first?.sweetFood.first?.plateName.count ?? 0
        } else {
            return itemsList.first?.drinks.first?.plateName.count ?? 0
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == starterDish {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StarterDishCollectionViewCell.identifier, for: indexPath) as? StarterDishCollectionViewCell
            
            if let dish = itemsList.first?.starterDish.first, indexPath.item < dish.plateName.count {
                cell?.setupCell(whit: dish.plateName[indexPath.item]) // Agora cada célula recebe um prato diferente
//                let imageDish =  UIImage(named: dish.plateName[indexPath.item])?.withRenderingMode(.alwaysOriginal)
            }
            
            return cell ?? UICollectionViewCell()
            
        } else if collectionView == mainCourse {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCourseCollectionViewCell.identifier, for: indexPath) as? MainCourseCollectionViewCell
            
            if let dish = itemsList.first?.mainCourse.first, indexPath.item < dish.plateName.count {
                cell?.setupCell(whit: dish.plateName[indexPath.item])
            }
            
            return cell ?? UICollectionViewCell()
        } else if collectionView == sweetFood {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SweetFoodCollectionViewCell.identifier, for: indexPath) as? SweetFoodCollectionViewCell
            
            if let dish = itemsList.first?.sweetFood.first, indexPath.item < dish.plateName.count {
                cell?.setupCell(whit: dish.plateName[indexPath.item])
            }
            
            return cell ?? UICollectionViewCell()
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DrinksCollectionViewCell.identifier, for: indexPath) as? DrinksCollectionViewCell
            
            if let dish = itemsList.first?.drinks.first, indexPath.item < dish.plateName.count {
                cell?.setupCell(whit: dish.plateName[indexPath.item])
            }
            return cell ?? UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //        var item = itemsList[indexPath.row]
        let vc: HalfPageViewController? = UIStoryboard(name: "HalfPageViewController", bundle: nil).instantiateViewController(withIdentifier: "HalfPageViewController") as? HalfPageViewController
        
        if let presentationController = vc?.presentationController as? UISheetPresentationController{
            presentationController.detents = [.large()]
            
        }
        self.present(vc ?? UIViewController(), animated: true)
        
        
        
    }
    
}



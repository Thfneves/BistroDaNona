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
        setupCollectionViewLayouts()
        confighomeScreen()
        setClearBackGround()
        setupCollectionViewLayouts()
    }
    func setClearBackGround(){
        starterDish.backgroundColor = .clear
        sweetFood.backgroundColor = .clear
        mainCourse.backgroundColor = .clear
        drinksCollectionView.backgroundColor = .clear
    }
    
    var receiveCartTableView:[Dish] = []
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
        //                                       Drinks
        drinksCollectionView.delegate = self
        drinksCollectionView.dataSource = self
        drinksCollectionView.register(UINib(nibName: "DrinksCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: DrinksCollectionViewCell.identifier)
        
    }
    
    var itemsStarterDish: [StarterDish] = [
        StarterDish(plateName:  "Ante Pasto", description: " Uma deliciosa seleção de ingredientes frescos e temperados, perfeita para abrir o apetite. Preparado com vegetais marinados, azeite de qualidade e ervas aromáticas. Cada ingrediente é escolhido para oferecer um equilíbrio perfeito entre acidez, doçura e textura.", price: 39.90 , forManyPeople: 2, imagesStarterDish: "Ante Pasto"),
        
        StarterDish(plateName:  "Burrata de Bufala", description: " Um clássico da culinária italiana, nossa burrata é cremosa por dentro e envolta em uma delicada camada de mozzarella, servida com azeite extravirgem, manjericão e tomate confit. A combinação da cremosidade da burrata com a acidez suave do tomate cria uma experiência única no paladar.", price: 29.90 , forManyPeople: 3, imagesStarterDish: "Burrata de Bufala"),
        
        StarterDish(plateName:  "Canapé De Salame", description: "Pequenos e sofisticados, nossos canapés combinam o sabor marcante do salame com queijos finos e ervas frescas, tudo sobre uma base crocante. Cada mordida traz um contraste perfeito entre crocância, cremosidade e um toque levemente picante.", price: 39.90 , forManyPeople: 3, imagesStarterDish: "Canapé De Salame"),
        
        StarterDish(plateName:  "Mini Quiches", description: " Leves e saborosas, nossas mini quiches são feitas com massa amanteigada e recheios cremosos, como queijo, alho-poró e bacon, assadas até ficarem douradas e irresistíveis. O equilíbrio entre a massa delicada e os recheios bem temperados faz dessa entrada uma opção irresistível.", price: 29.90 , forManyPeople: 2, imagesStarterDish: "Mini Quiches"),
        
        StarterDish(plateName:  "Carpaccio de Carne", description: " Finas fatias de carne temperadas com azeite trufado, alcaparras e lascas de parmesão, trazendo um sabor sofisticado e refrescante. O leve toque cítrico do tempero realça o sabor da carne, tornando essa entrada leve e cheia de personalidade", price: 19.90 , forManyPeople: 4, imagesStarterDish: "Carpaccio de Carne"),
        
        StarterDish(plateName:  "Queijo Brie de Geleia", description: "A união perfeita entre o toque aveludado do brie e a doçura da geleia artesanal. Assado até derreter suavemente, é servido com torradas para um contraste perfeito de texturas e sabores. Uma combinação clássica de queijo e doce que encanta pelo equilíbrio sofisticado e delicado.", price: 29.90 , forManyPeople: 4, imagesStarterDish: "Queijo Brie de Geleia"),
    ]
    var itemsMainCourse: [MainCourse] = [
        MainCourse(plateName:  "Risoto com queijo brie", description: "O risoto com queijo brie é uma opção sofisticada e cremosa, perfeita para quem aprecia sabores marcantes. O arroz arbóreo absorve lentamente o caldo, criando uma textura aveludada, enquanto o queijo brie derrete, trazendo um toque suave e levemente amanteigado. Harmoniza bem com nozes, mel ou cogumelos, tornando-se irresistível.", price: 79.90 , forManyPeople: 3, imagesMainCourse: "Risoto com queijo brie"),
        MainCourse(plateName:  "Macarrão à carbonara", description: "O macarrão à carbonara é um prato clássico da culinária italiana, simples e saboroso. Feito com ovos, queijo parmesão, pancetta e pimenta-do-reino, ele oferece uma combinação cremosa e irresistível. A mistura dos ingredientes cria um molho aveludado que envolve a massa, proporcionando uma refeição aconchegante e cheia de sabor.", price: 89.90 , forManyPeople: 1, imagesMainCourse: "Macarrão à carbonara"),
        MainCourse(plateName:  "Risoto de contra filé", description: "O risoto de contrafilé é uma combinação deliciosa de sabores intensos e texturas aveludadas. O arroz arbóreo absorve o caldo, criando uma base cremosa que se complementa perfeitamente com pedaços suculentos de contrafilé grelhado. Esse prato é uma opção sofisticada e cheia de sabor, ideal para quem busca uma refeição reconfortante e cheia de personalidade.", price: 99.90 , forManyPeople: 2, imagesMainCourse: "Risoto de contra filé"),
    ]
    var itemsSweetFood: [MainCourse] = [
        MainCourse(plateName:  "Torta de maçã caramelizada", description: "A tarte de maçã caramelizada é uma sobremesa irresistível, com maçãs suculentas envoltas em um caramelo dourado e levemente crocante. A base de massa amanteigada combina perfeitamente com a doçura das maçãs, criando um contraste delicioso. Servida morna, é ideal para momentos de aconchego e prazer.", price: 39.90 , forManyPeople: 2, imagesMainCourse: "Torta de maçã caramelizada"),
        MainCourse(plateName:  "Cheesecake de nozes e caramelo", description: "A cheesecake de nozes e caramelo é uma sobremesa indulgente, que combina a suavidade da cream cheese com o crocante das nozes e a doçura envolvente do caramelo. A base de biscoito adiciona uma textura crocante, enquanto o caramelo derrete na boca, criando um equilíbrio perfeito entre sabores ricos e sofisticados. Ideal para momentos especiais.", price: 29.90 , forManyPeople: 2, imagesMainCourse: "Cheesecake de nozes e caramelo"),
        MainCourse(plateName:  "Mil-folhas de brigadeiro com crocante de chocolate belga", description: "O mil-folhas de brigadeiro com crocante de chocolate belga é uma sobremesa decadente que combina camadas finas de massa folhada crocante com o irresistível brigadeiro cremoso. O toque de crocante de chocolate belga adiciona uma camada extra de sabor e textura, criando uma explosão de sabores ricos e contrastantes. Uma verdadeira tentação para os amantes de doces.", price: 59.90 , forManyPeople: 3, imagesMainCourse: "Mil-folhas de brigadeiro com crocante de chocolate belga"),
    ]
    var itemsDrinks: [MainCourse] = [
        MainCourse(plateName:  "Martini Clássico", description: "O Martini Clássico é feito com gin e vermute seco, servido em taça com azeitona ou casca de limão.", price: 19.90 , forManyPeople: 1, imagesMainCourse: "Martini Clássico"),
        MainCourse(plateName:  "Mojito de Frutas Vermelhas", description: " Rum, hortelã, limão, açúcar e um toque de frutas vermelhas frescas.", price: 39.90 , forManyPeople: 1, imagesMainCourse: "Mojito de Frutas Vermelhas"),
        MainCourse(plateName:  "Chardonnay", description: "Branco, fresco e frutado, ideal para pratos leves.", price: 39.90 , forManyPeople: 1, imagesMainCourse: "Chardonnay"),
        MainCourse(plateName:  "Cabernet Sauvignon", description: "Tinto encorpado, com notas de frutas vermelhas e taninos marcantes.", price: 89.90 , forManyPeople: 1, imagesMainCourse: "Cabernet Sauvignon"),
        MainCourse(plateName:  "Virgin Mojito", description: "Hortelã, limão, açúcar, água com gás e gelo, refrescante e leve.", price: 19.90 , forManyPeople: 1, imagesMainCourse: "Virgin Mojito"),
        MainCourse(plateName:  "Suco de Abacaxi com Hortelã", description: "Abacaxi fresco, hortelã e gelo, doce e refrescante.", price: 19.90 , forManyPeople: 3, imagesMainCourse: "Suco de Abacaxi com Hortelã"),
        MainCourse(plateName:  "Água com gás", description: "Água com gás é gelo e limao opcional", price: 9.90 , forManyPeople: 1, imagesMainCourse: "Água com gás")
    ]
    private func setupCollectionViewLayouts() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 175, height: 120)
        layout.minimumInteritemSpacing = 3
        
        starterDish.collectionViewLayout = layout
        mainCourse.collectionViewLayout = layout
        sweetFood.collectionViewLayout = layout
        drinksCollectionView.collectionViewLayout = layout
        // setei por aqui tambem, mas nao esta batendo, a starterView
        
    }
    
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
        
        guard let selectedItem = itemSelected else { return  }
        
        if let vc = UIStoryboard(name: "HalfPageViewController", bundle: nil).instantiateViewController(withIdentifier: "HalfPageViewController") as? HalfPageViewController {
            
            protocol DataReceiver {
                func receiveData(selectedItem: String?, indexSelected: Int?, arraySelected: [Dish])
            }
            
            vc.receiveData(selectedItem: selectedItem, arraySelected: arraySelected)
            
            if let presentationController = vc.presentationController as? UISheetPresentationController {
                presentationController.detents = [.large()]
            }
            self.present(vc, animated: true)
            
        }
    }
}



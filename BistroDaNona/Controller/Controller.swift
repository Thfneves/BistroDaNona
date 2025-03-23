//
//  Controller.swift
//  BistroDaNona
//
//  Created by Thiago Neves on 08/02/25.
//

class  CartManager {
        static var shared = CartManager()
        
    var items: [Dish] = []
        
    }


protocol Dish {
    var plateName: String { get }
        var description: String { get }
        var price: Double { get }
        var forManyPeople: Int { get }
}

struct StarterDish: Dish {                        
    let plateName : String
    let description : String
    var price : Double
    var forManyPeople : Int
    var imagesStarterDish : String
}

struct MainCourse: Dish  {
    let plateName : String
    let description : String
    var price : Double
    var forManyPeople : Int
//    var imagesMainCourse : [String]
}

struct SweetFood: Dish  {
    let plateName : String
    let description : String
    var price : Double
    var forManyPeople : Int
//    var imagesSweetFood : [String]
}
struct Drinks: Dish  {
    let plateName : String
    let description : String
    var price : Double
    var forManyPeople : Int
//    var imagesDrinks: [String]
}


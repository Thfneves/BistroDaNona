//
//  Controller.swift
//  BistroDaNona
//
//  Created by Thiago Neves on 08/02/25.
//

protocol Dish {
    var plateName: String { get }
        var description: String { get }
        var price: Double { get }
        var forManyPeople: Int { get }
}

struct Menu {
    var starterDish : [StarterDish]
    var mainCourse : [MainCourse]
    var sweetFood : [SweetFood]
    var drinks : [Drinks]
    
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


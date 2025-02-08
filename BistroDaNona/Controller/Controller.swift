//
//  Controller.swift
//  BistroDaNona
//
//  Created by Thiago Neves on 08/02/25.
//



struct Menu {
    var starterDish : [StarterDish]
    var mainCourse : [MainCourse]
    var sweetFood : [SweetFood]
    var drinks : [Drinks]
    
}
struct StarterDish{
    let plateName : [String]
    let description : [String]
    var price : [Double]
    var forManyPeople : [Int]
//    var imagesStarterDish : [String]
}

struct MainCourse {
    let plateName : [String]
    let description : [String]
    var price : [Double]
    var forManyPeople : [Int]
//    var imagesMainCourse : [String]
}

struct SweetFood {
    let plateName : [String]
    let description : [String]
    var price : [Double]
    var forManyPeople : [Int]
//    var imagesSweetFood : [String]
}
struct Drinks {
    let plateName : [String]
    let description : [String]
    var price : [Double]
    var forManyPeople : [Int]
//    var imagesDrinks: [String]
}


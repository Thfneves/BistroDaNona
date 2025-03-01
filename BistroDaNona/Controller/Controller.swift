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
struct StarterDish{                         //      Testanto usabilidade sem uma struct de array, porque quando acessamos o array pela struct menu, ja pegamos todos os dados dentro da struct em                                                   questao. logo e redundante utilizar outra struct
    let plateName : String
    let description : String
    var price : Double
    var forManyPeople : Int
    var imagesStarterDish : String
}

struct MainCourse {
    let plateName : String
    let description : String
    var price : Double
    var forManyPeople : Int
//    var imagesMainCourse : [String]
}

struct SweetFood {
    let plateName : String
    let description : String
    var price : Double
    var forManyPeople : Int
//    var imagesSweetFood : [String]
}
struct Drinks {
    let plateName : String
    let description : String
    var price : Double
    var forManyPeople : Int
//    var imagesDrinks: [String]
}


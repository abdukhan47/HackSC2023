//
//  RecommendedFoods.swift
//  DiabetesNutrition
//
//  Created by Abdulah Khan on 2/3/23.
//

import Foundation


class RecommendedFoods: Codable{
    static var sharedFoods = RecommendedFoods(foodList: [])
    
    var foodList: [Food]
    
    init(foodList: [Food]) {
        self.foodList = foodList
        var chocolate : Food = Food()
        chocolate.itemName = "Hershey Bar (17 pieces, 39g)"
        chocolate.calories = 214
        chocolate.totalCarbohydrate = 20
        chocolate.protein = 3.8
        chocolate.sugars = 17
        chocolate.totalFat = 14
        chocolate.servingSizeQty = 1
        chocolate.servingSizeUnit = "bar"
        
        var coke : Food = Food()
        coke.itemName = "Coke (368 g)"
        coke.calories = 138
        coke.totalCarbohydrate = 35
        coke.protein = 0.3
        coke.sugars = 33
        coke.totalFat = 0.1
        coke.servingSizeQty = 1
        coke.servingSizeUnit = "can"
        
        var popcorn : Food = Food()
        popcorn.itemName = "Smartfood White Cheddar Popcorn (28 g)"
        popcorn.calories = 160
        popcorn.totalCarbohydrate = 13
        popcorn.protein = 4
        popcorn.sugars = 2
        popcorn.totalFat = 10
        popcorn.servingSizeQty = 2.5
        popcorn.servingSizeUnit = "cups"
        
        var cokeZero : Food = Food()
        cokeZero.itemName = "Coke Zero"
        cokeZero.calories = 0
        cokeZero.totalCarbohydrate = 0
        cokeZero.protein = 0
        cokeZero.sugars = 0
        cokeZero.totalFat = 0
        cokeZero.servingSizeQty = 1
        cokeZero.servingSizeUnit = "can"
        
        
        var iceCream = Food()
        iceCream.itemName = "Outshine Strawberry Fruit Bars"
        iceCream.calories = 60
        iceCream.totalCarbohydrate = 15
        iceCream.protein = 0
        iceCream.sugars = 14
        iceCream.totalFat = 0
        iceCream.servingSizeQty = 2
        iceCream.servingSizeUnit = "bar"
        
        
        
        
        addFood(food: chocolate)
        addFood(food: popcorn)
        addFood(food: cokeZero)
        addFood(food: coke)
        addFood(food: iceCream)
     
    }
    
    func addFood(food: Food) {
        foodList.append(food)
    }
    
}

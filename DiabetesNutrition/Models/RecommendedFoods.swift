//
//  RecommendedFoods.swift
//  DiabetesNutrition
//
//  Created by Abdulah Khan on 2/3/23.
//

import Foundation


class RecommendedFoods: Codable{
    static let sharedFoods = RecommendedFoods(foodList: [])
    
    var foodList: [Food]
    
    init(foodList: [Food]) {
        self.foodList = foodList
        var chocolate : Food
     
    }
    
    func addFood(food: Food) {
        foodList.append(food)
    }
    
}

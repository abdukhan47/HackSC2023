//
//  FoodContainer.swift
//  DiabetesNutrition
//
//  Created by Abdulah Khan on 2/4/23.
//

import Foundation

class FoodContainer {
    static var shared = FoodContainer()
    private init() {}

    var foodItem: Food?
}

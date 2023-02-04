//
//  Food.swift
//  DiabetesNutrition
//
//  Created by Abdulah Khan on 2/3/23.
//

import Foundation

class Food
{
    var name: String
    var cal: Double
    var nDict : [String: Double] = [:]
    var foodGroups : [String] = []
    init(name: String, cal: Double)
    {
        self.name = name
        self.cal = cal
    }
    
}


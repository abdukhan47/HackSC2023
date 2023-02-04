//
//  Food.swift
//  DiabetesNutrition
//
//  Created by Abdulah Khan on 2/3/23.
//

import Foundation

class Food
{
    var name: String = ""
    var cal: Double = 0
    var nDict : [String: Double] = [:]
    //var foodGroups : [String] = []
    
    init(name: String, cal: Double, nDict : [String: Double])
    {
        self.name = name
        self.cal = cal
    }
    
}


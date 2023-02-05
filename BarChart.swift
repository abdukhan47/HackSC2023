//
//  NutritionUIView.swift
//  DiabetesNutrition
//
//  Created by Spencer Tran on 2/4/23.
//

import SwiftUI
import Charts

struct BarChart: View
{
    
    struct Nutrient : Identifiable
    {
        let type_: String
        let val: Float
        var id = UUID()
    }
    var data:[Nutrient] = []
    
    init(c : Float, s : Float, f : Float, p: Float)
    {
        data.append(Nutrient(type_:"Carbohydrates", val:c))
        data.append(Nutrient(type_:"Sugars", val:s))
        data.append(Nutrient(type_:"Fats", val:f))
        data.append(Nutrient(type_:"Protein", val:p))

    }
    
   
    
    
    
    
    
    
    var body: some View
    {
                
        Chart()
        {
            ForEach(data) {nutr in BarMark(
                    x: .value("type_", nutr.type_),
                    y: .value("val", nutr.val)
                )
            }
        }
    }
}
/*
 struct BarChart_Previews: PreviewProvider {
 static var previews: some View {
 BarChart(nd)
 }
 }
 */

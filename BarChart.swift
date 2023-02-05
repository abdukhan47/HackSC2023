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
        let val: Double
        var id = UUID()
    }
    var nDict_ : [String: Double] = [:]
    init(nd :  [String: Double])
    {
        nDict_ = nd;
        //nDict_["protein"] = 10.0;
        //nDict_["fat"] = 20.0;
        setData()
        
        print("a")
        
    }
    
    var data:[Nutrient] = []
    
    public mutating func setData()
    {
        print("b")
        for (key, value) in nDict_
        {
            data.append(Nutrient(type_ : key, val: value))
            print("c")
        }
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

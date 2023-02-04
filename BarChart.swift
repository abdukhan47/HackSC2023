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

    let data: [Nutrient] = [
        Nutrient(type_: "Protein", val: 10.0),
        Nutrient(type_: "Fat", val: 20.0)
    ]

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
struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart()
    }
}

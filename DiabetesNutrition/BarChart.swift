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
        let r: Double;
        let g: Double;
        var id = UUID()
    }
    var data:[Nutrient] = []
    let cd = 65.8587924217/4.5;
    let pd = 49.3940943163/2;
    let fd = 21.9529308072/2;
    //via United States Department of Agriculture
    let sugarLim = 36.0/2; // via American Heart association
    
    init(c : Float, s : Float, f : Float, p: Float)
    {
        
        
        var cdf = min((abs(cd-Double(c))*100)/cd, 100);
        if(c < 10)
        {
            cdf = 0.0;
        }
        let pdf = min((abs(pd-Double(p))*100)/pd, 100);
        let fdf = min((abs(fd-Double(f))*100)/fd, 100);
        
        var sdf = max(0.0, Double(s)-sugarLim)/sugarLim * 100
        if(sdf > 100.0)
        {
            sdf = 100.0;
        }
        
        
        var g_ : Double;
        var r_ : Double;
        var x = cdf;
        if (x>50.0)
        {
            g_ = 1-2*(x-50);
            r_ = 1.0;
        } else
        {
            g_ = 1.0;
            r_ = 2*x/100.0;
        }
        data.append(Nutrient(type_:"Carbohydrates", val:c, r:r_, g:g_))
        x = Double(sdf);
        if (x>50.0)
        {
            g_ = 1-2*(x-50);
            r_ = 1.0;
        } else
        {
            g_ = 1.0;
            r_ = 2*x/100.0;
        }
        data.append(Nutrient(type_:"Sugars", val:s, r:r_, g:g_))
        x = fdf;
        if (x>50.0)
        {
            g_ = 1-2*(x-50);
            r_ = 1.0;
        } else
        {
            g_ = 1.0;
            r_ = 2*x/100.0;
        }
        data.append(Nutrient(type_:"Fats", val:f, r:r_, g:g_))
        x = pdf;
        if (x>50.0)
        {
            g_ = 1-2*(x-50);
            r_ = 1.0;
        } else
        {
            g_ = 1.0;
            r_ = 2*x/100.0;
        }
        data.append(Nutrient(type_:"Protein", val:p, r:r_, g:g_))

    }
    
   
    
    
    
    
    
    
    
    var body: some View
    {
        
        VStack {
            Text("Nutrients (g)")
                .font(.largeTitle).bold()
            Chart()
            {
                
                ForEach(data) {nutr in BarMark(
                    
                    x: .value("type_", nutr.type_),
                    y: .value("val", nutr.val)
                )
                .cornerRadius(10)
                .foregroundStyle(Color(red:nutr.r, green:nutr.g, blue:0.0))
                }
            }
            
            
        }
        
    }
    
}

 struct BarChart_Previews: PreviewProvider {
 static var previews: some View {
     BarChart(c:49, s:50, f:12, p:30)
 }
 }


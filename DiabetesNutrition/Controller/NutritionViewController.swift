//
//  NutritionViewController.swift
//  DiabetesNutrition
//
//  Created by Abdulah Khan on 2/3/23.
//

import UIKit
import SwiftUI


//var child = UIHostingController(rootView: BarChart());


class NutritionViewController: UIViewController{
    let targetFood = Food(name: "Potato",
                          cal: 30.0,
                          nDict: ["Protein": 1.0, "Fat":2.0])
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.showFoodDetails(targetFood)
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var lblFoodName : UILabel!
    @IBOutlet weak var lblCalNum : UILabel!
    
    
    @IBSegueAction func embedSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: BarChart(nd : targetFood.nDict))
    }
    func showFoodDetails(_ food: Food)
    {
        lblFoodName.text = food.name;
        lblCalNum.text = String(format: "%.1f", food.cal);
        
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}





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
    let foodContainer = FoodContainer.shared
    var targetFood : Food?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        targetFood = foodContainer.foodItem
        self.showFoodDetails(targetFood!)
        
       }
        // Do any additional setup after loading the view.
    

@IBSegueAction func embedSwiftUIView(_ coder: NSCoder) -> UIViewController? {
    targetFood = foodContainer.foodItem
    return UIHostingController(coder: coder, rootView: BarChart(c : (targetFood?.totalCarbohydrate)!, s : (targetFood?.sugars)!, f : (targetFood?.totalFat)!, p : (targetFood?.protein)!))
}
    @IBOutlet weak var lblFoodName : UILabel!
    @IBOutlet weak var lblCalNum : UILabel!
    
    
    
    func showFoodDetails(_ food: Food)
    {
        lblFoodName.text = food.itemName;
        lblCalNum.text = String(food.calories!);
        
        
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





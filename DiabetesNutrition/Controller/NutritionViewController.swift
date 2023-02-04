//
//  NutritionViewController.swift
//  DiabetesNutrition
//
//  Created by Abdulah Khan on 2/3/23.
//

import UIKit
import Charts


class NutritionViewController: UIViewController {
    
    
    @IBOutlet weak var lblFoodName : UILabel!
    
    func showFoodDetails(_ food: Food)
    {
        lblFoodName.text = food.name;
    }
    var targetFood = Food(name: "Potato",
                          cal: 30.0,
                          nDict: ["Protein": 1.0, "Fat":2.0])
    showFoodDetails(food: self.targetFood)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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





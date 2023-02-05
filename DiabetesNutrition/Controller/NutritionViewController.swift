//
//  NutritionViewController.swift
//  DiabetesNutrition
//
//  Created by Abdulah Khan on 2/3/23.
//

import UIKit
import SwiftUI


//var child = UIHostingController(rootView: BarChart());


class NutritionViewController: UIViewController, UIPopoverPresentationControllerDelegate{
    let foodContainer = FoodContainer.shared
    var targetFood : Food?
//    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
//        foodContainer.foodItem = nil
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        targetFood = foodContainer.foodItem
        self.showFoodDetails(targetFood!)
        

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var buttonLabel: UIButton!
    
    @IBAction func heartPressed(_ sender: Any) {
        buttonLabel.setTitleColor(UIColor.red, for: .normal)
    }
    
    
    @IBSegueAction func embedSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        targetFood = foodContainer.foodItem
        return UIHostingController(coder: coder, rootView: BarChart(c : (targetFood?.totalCarbohydrate)!, s : (targetFood?.sugars)!, f : (targetFood?.totalFat)!, p : (targetFood?.protein)!))
   }
    @IBOutlet weak var lblFoodName : UILabel!
    @IBOutlet weak var lblCalNum : UILabel!
    
    @IBOutlet var servingSize: UILabel!
    
    
    func showFoodDetails(_ food: Food)
    {
        lblFoodName.text = food.itemName;
        lblCalNum.text = String(food.calories!);
        servingSize.text = "\(food.servingSizeQty!) \( food.servingSizeUnit!)"
        
        
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

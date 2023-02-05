////
////  NutritionViewController.swift
////  DiabetesNutrition
////
////  Created by Abdulah Khan on 2/3/23.
////
//
//import UIKit
//import Charts
//
//
//class NutritionViewController: UIViewController {
//
//
//    @IBOutlet weak var lblFoodName : UILabel!
//    @IBOutlet weak var lblCalNum : UILabel!
//
//    func showFoodDetails(_ food: Food)
//    {
//        lblFoodName.text = food.name;
//        lblCalNum.text = String(format: "%.1f", food.cal);
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let targetFood = Food(name: "Potato",
//                              cal: 30.0,
//                              nDict: ["Protein": 1.0, "Fat":2.0])
//
//        self.showFoodDetails(targetFood)
//
//        // Do any additional setup after loading the view.
//    }
//
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
//
//
//
//

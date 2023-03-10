import UIKit
import VisionKit

final class FoodScannerViewController: UIViewController {
    var timer : Timer? = Timer()
    let foodContainer = FoodContainer.shared
    let sharedFoods = RecommendedFoods.sharedFoods
    private let dataScannerViewController = DataScannerViewController(recognizedDataTypes: [.barcode()],
                                                                      qualityLevel: .fast,
                                                                      recognizesMultipleItems: false,
                                                                      isHighFrameRateTrackingEnabled: true,
                                                                      isPinchToZoomEnabled: true,
                                                                      isGuidanceEnabled: true,
                                                                      isHighlightingEnabled: true) // Mark 1
    
    @IBOutlet weak var openCamera: UIButton!
    
    private var isScannerAvailable: Bool { DataScannerViewController.isSupported && DataScannerViewController.isAvailable } // Mark 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataScannerViewController.delegate = self // Mark 5
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(checkObject), userInfo: nil, repeats: true)
        
    }
    
    @objc func checkObject() {
        if  foodContainer.foodItem != nil {
            // Object is not nil, stop the timer and transition to another ViewController
            timer!.invalidate()
            timer = nil


            // present the new view controller here
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "NutritionSummary")
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true)
        }
    }
        
        
        @IBAction func openCameraButton(_ sender: Any) {
            if(timer == nil) {
                timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(checkObject), userInfo: nil, repeats: true)
                foodContainer.foodItem = nil
            }
            
            if isScannerAvailable { // Mark 2

                present(dataScannerViewController, animated: true) // Mark 4
                try? dataScannerViewController.startScanning() // Mark 4
            }
        }
        
    }
    
    
    extension FoodScannerViewController: DataScannerViewControllerDelegate { // Mark 5
        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) { // Mark 5
            for item in addedItems {
                switch item {
                    
                    //process(data: text.transcript)
                case .barcode(let barcode):
                    let upc = barcode.payloadStringValue!
                    process(data: upc)
                    print(barcode.payloadStringValue!)
                    
                    break
                case .text(_):
                    break
                @unknown default:
                    print("Should not happen")
                }
            }
        }
        
        private func process(data: String) { // Mark 6
            let appId = "YOUR APP ID"
            let appKey = "YOUR API KEY"
            let upc = data
            
            let urlString = "https://api.nutritionix.com/v1_1/item?upc=\(upc)&appId=\(appId)&appKey=\(appKey)"
            
            if let url = URL(string: urlString) {
                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print("Error: \(error)")
                    } else if let data = data, let response = response as? HTTPURLResponse {
                        if response.statusCode == 200 {
                            // success, parse the response data here
                            do {
                                
                                let nutritionInfo = try JSONDecoder().decode(Food.self, from: data)
                                self.foodContainer.foodItem = nutritionInfo
                                self.sharedFoods.addFood(food: nutritionInfo)
                                print(nutritionInfo.itemName!)
                            } catch {
                                print("Error: \(error)")
                            }
                        } else {
                            print("Failure: \(response.statusCode)")
                        }
                    }
                }
                task.resume()
            }

            dismiss(animated: true, completion: nil)
        }
    }


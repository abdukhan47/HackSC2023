import UIKit
import VisionKit

final class FoodScannerViewController: UIViewController {
    
    private let dataScannerViewController = DataScannerViewController(recognizedDataTypes: [.barcode()],
                                                                      qualityLevel: .fast,
                                                                      recognizesMultipleItems: false,
                                                                      isHighFrameRateTrackingEnabled: true,
                                                                      isPinchToZoomEnabled: true,
                                                                      isGuidanceEnabled: true,
                                                                      isHighlightingEnabled: true) // Mark 1
    
    private var isScannerAvailable: Bool { DataScannerViewController.isSupported && DataScannerViewController.isAvailable } // Mark 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataScannerViewController.delegate = self // Mark 5
        
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
        guard let mathObject = MathObject(inputData: data) else {
            print("Could not parse into MathObject")
            return
        }
        
        dismiss(animated: true)
        
        let alertViewController = UIAlertController(title: "Math Solver", message: "The result of your calculus is: \(mathObject.result)", preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "Holy Swift!", style: .cancel))
        present(alertViewController, animated: true)
    }
}

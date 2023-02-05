import Foundation

class Food: Codable {
    var itemName: String?
    var brandName: String?
    var itemDescription: String?
    var calories: Int?
    var caloriesFromFat: Int?
    var totalFat: Float?
    var saturatedFat: Float?
    var totalCarbohydrate: Float?
    var sugars: Float?
    var protein: Float?
    var servingsPerContainer: Float?
    var servingSizeQty: Float?
    var servingSizeUnit: String?

    enum CodingKeys: String, CodingKey {
        case itemName = "item_name"
        case brandName = "brand_name"
        case itemDescription = "item_description"
        case calories = "nf_calories"
        case caloriesFromFat = "nf_calories_from_fat"
        case totalFat = "nf_total_fat"
        case saturatedFat = "nf_saturated_fat"
        case totalCarbohydrate = "nf_total_carbohydrate"
        case sugars = "nf_sugars"
        case protein = "nf_protein"
        case servingsPerContainer = "nf_servings_per_container"
        case servingSizeQty = "nf_serving_size_qty"
        case servingSizeUnit = "nf_serving_size_unit"
    }
}

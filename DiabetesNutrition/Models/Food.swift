import Foundation

class Food: Codable {
    let itemName: String?
    let brandName: String?
    let itemDescription: String?
    let calories: Int?
    let caloriesFromFat: Int?
    let totalFat: Float?
    let saturatedFat: Float?
    let totalCarbohydrate: Float?
    let sugars: Float?
    let protein: Float?
    let servingsPerContainer: Float?
    let servingSizeQty: Float?
    let servingSizeUnit: String?

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

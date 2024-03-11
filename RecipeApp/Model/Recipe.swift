//
//  Recipe.swift
//  RecipeApp
//
//  Created by Brandon on 2/9/24.
//

import Foundation

enum RecipeSteps: Int, CaseIterable {
    case start
    case ingredients
    case notes
}

enum RecipeType: String, CaseIterable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case soup = "Soup"
    case salad = "Salad"
    case desert = "Desert"
    case appetizer = "Appetizer"
}

enum Difficulty: String, CaseIterable, Hashable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
}

enum Duration: String, CaseIterable, Hashable {
    case thirtyMinutes = "Thirty Minutes"
    case oneHour = "One Hour"
    case overOneHour = "Over One Hour"
}

enum Amount:String, CaseIterable {
    case oz = "oz"
    case cup = "cup"
    case tbsp = "tbsp"
    case pounds = "lbs"
    case unknown = "Measurement"
}

struct Recipe: Hashable, Identifiable {
    var title: String
    var recipeType: RecipeType
    var difficulty: Difficulty
    var duration: Duration
    var ingredients: [Ingredient]
    var notes: String
    
    var id = NSUUID().uuidString
}

struct Ingredient: Hashable {
    var item: String
    var amount: Int
    var amountType: Amount
}

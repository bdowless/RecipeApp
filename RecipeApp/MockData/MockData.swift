//
//  MockData.swift
//  RecipeApp
//
//  Created by Brandon on 2/9/24.
//

import Foundation
import SwiftUI

struct MockData {
    
    static let frechOnionIngredients = [
        Ingredient(item: "Onion", amount: 2, amountType: .cup),
        Ingredient(item: "Water", amount: 2, amountType: .cup),
        Ingredient(item: "Italian Seasoning", amount: 1, amountType: .tbsp)
    ]
    
    static let frenchOnionNotes = " -Chop the Onions and place them in the pan for 10 min until they brown, add your boiling water and italian seasoning. Wait thirty minutes and your French onion soup is ready"
    
    static let frenchOnion = Recipe(
        title: "French Onion",
        recipeType: .soup,
        difficulty: .easy,
        duration: .oneHour,
        ingredients: frechOnionIngredients,
        notes: frenchOnionNotes
    )
    
    
    static let silpancho = Recipe(
        title: "SilPancho",
        recipeType: .soup,
        difficulty: .easy,
        duration: .thirtyMinutes,
        ingredients: silPanchoIngredients,
        notes: silpannchoNotes
    )
    
    static let silPanchoIngredients = [
        Ingredient(item: "Flat Steak", amount: 2, amountType: .cup),
        Ingredient(item: "Onion", amount: 1, amountType: .cup),
        Ingredient(item: "Tomato", amount: 1, amountType: .cup),
        Ingredient(item: "Searrano Pepper", amount: 1, amountType: .tbsp),
        Ingredient(item: "Vinegar", amount: 4, amountType: .tbsp),
        Ingredient(item: "Potato", amount: 2, amountType: .tbsp),
        Ingredient(item: "Egg", amount: 1, amountType: .cup),
        Ingredient(item: "Rice", amount: 2, amountType: .cup)
    ]
    
    static let silpannchoNotes = "Flatten the steak and put over rice, add salsa at the end and eggs are optional."
    
    static let buffaloMacIngredients = [Ingredient(item: "Cheese", amount: 2, amountType: .cup)]
    
    static let buffaloMac = Recipe(
        title: "Buffalo Mac",
        recipeType: .soup,
        difficulty: .hard,
        duration: .overOneHour,
        ingredients: buffaloMacIngredients,
        notes: "Easy to make, really tasty"
    )
    
    static let allRecipes = [frenchOnion, silpancho, buffaloMac]
}


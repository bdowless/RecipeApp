//
//  RecipeInfoView.swift
//  RecipeApp
//
//  Created by Brandon on 2/21/24.
//

import SwiftUI

struct RecipeInfoView: View {
    var recipe: Recipe
    
    var body: some View {
        VStack {
            Text("\(recipe.title)")
                .font(.title)
            List {
                ForEach(recipe.ingredients, id: \.self) { Ingredient in
                    Text("\(Ingredient.item)")
                }
            }
        }
    }
}

#Preview {
    RecipeInfoView(
        recipe: Recipe(
            title: "French Onion",
            recipeType: .soup,
            difficulty: .easy,
            duration: .oneHour,
            ingredients: [Ingredient(
                item: "",
                amount: 2,
                amountType: .cup
            )],
            notes: ""
        )
    )
}

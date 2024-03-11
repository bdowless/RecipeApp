//
//  RecipeManager.swift
//  RecipeApp
//
//  Created by Brandon on 2/9/24.
//

import Foundation



extension RecipeSteps: Identifiable, Hashable {
    var id: Int { return self.rawValue }
}

class RecipeManager: ObservableObject {
    @Published var recipeType: RecipeType = .appetizer
    @Published var recipeTitle = ""
    @Published var difficulty: Difficulty = .easy
    @Published var duration: Duration = .oneHour
    @Published var notes = ""
    @Published var recipeSteps = [RecipeSteps]()
    @Published var recipeArray = [Recipe]()
    @Published var ingredients = [Ingredient]()
    @Published var recipeTypeArray = [Recipe]()
    
    var currentStep: RecipeSteps?
    
    func clearManager() {
        self.recipeTitle = ""
        self.notes = ""
        self.ingredients = [Ingredient]()
    }
    func addRecipe() {
        let recipe = Recipe(title: self.recipeTitle,  recipeType: self.recipeType,difficulty: self.difficulty, duration: self.duration, ingredients: self.ingredients, notes: self.notes)
        recipeArray.append(recipe)
    }
    
    func recipeByTypeArray(type : RecipeType) {
        recipeTypeArray = recipeArray.filter({ Recipe in
            return Recipe.recipeType == type
        })
    }
    func start() {
        guard let initialStep = RecipeSteps(rawValue: 0) else { return }
        recipeSteps.append(initialStep)
    }
    func navigate() {
        self.currentStep = recipeSteps.last
        
        guard let index = currentStep?.rawValue else { return }
        guard let nextStep = RecipeSteps(rawValue: index + 1) else {
            return
        }
        recipeSteps.append(nextStep)
    }
}

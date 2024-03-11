//
//  AddRecipeFormView.swift
//  RecipeApp
//
//  Created by Brandon on 3/4/24.
//

import SwiftUI

struct AddRecipeFormView: View {
    @Environment(\.dismiss) var dismiss
    @State var amount = 0
    @State var ingredientTitle = ""
    @State var measurment: Amount = .unknown
    @EnvironmentObject var manager: RecipeManager
    @State private var didSelectAddIngredient = false
    
    var body: some View {
        VStack {
            HStack() {
                Image(systemName: "chevron.backward")
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.blue)
                    .onTapGesture {
                        dismiss()
                    }
                Spacer()
            }
            .padding(.horizontal, 15)
            Form {
                Section {
                    TextField("Recipe Title", text: $manager.recipeTitle)
                } header: {
                    Text("Recipe Title")
                        .font(.headline.bold())
                        .foregroundStyle(.black)
                }
                
                RecipeTypeSectionView(recipeType: $manager.recipeType)
                
                DifficultySectionView(difficulty: $manager.difficulty)
                
                if didSelectAddIngredient{
                    AddIngredientFormView(amount: $amount, measurment: $measurment, ingredientTitle: $ingredientTitle)
                } else {
                    Section {
                        ForEach(manager.ingredients, id: \.self) { ingredient in
                            Text("\(ingredient.item)")
                        }
                        Button(action: {
                            didSelectAddIngredient.toggle()
                        }, label: {
                            HStack {
                                Text("Add Ingredient")
                                Spacer()
                                Image(systemName: "plus")
                            }
                        })
                    } header: {
                        Text("Ingredients")
                            .font(.headline.bold())
                            .foregroundStyle(.black)
                    }
                }
            }
            addOrDoneButton(isDone: didSelectAddIngredient)
            
            Spacer()
            
        }
        .background(Color("FormColor"))
    }
}

#Preview {
    AddRecipeFormView()
        .environmentObject(RecipeManager())
}


extension AddRecipeFormView {
    func addOrDoneButton(isDone: Bool) -> some View {
        switch isDone {
        case true:
            return AnyView(Button(action: {
                let ingredient = Ingredient(item: self.ingredientTitle, amount: self.amount, amountType: self.measurment)
                manager.ingredients.append(ingredient)
                didSelectAddIngredient.toggle()
                self.ingredientTitle = ""
                self.amount = 0
                self.measurment = .unknown
            }, label: {
                ButtonModifier(buttonTitle: "ADD")
            }))
        case false:
            return AnyView(Button(action: {
                manager.addRecipe()
                dismiss()
            }, label: {
                ButtonModifier(buttonTitle: "DONE")
            }))
        }
    }
}

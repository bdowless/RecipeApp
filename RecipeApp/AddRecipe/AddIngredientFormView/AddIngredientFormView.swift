//
//  AddIngredientFormView.swift
//  RecipeApp
//
//  Created by Brandon on 3/4/24.
//

import SwiftUI

protocol FormConformance {
    
}

struct AddIngredientFormView: View, FormConformance {
    @Binding var amount: Int
    @Binding var measurment: Amount
    @Binding var ingredientTitle: String
    var body: some View {

            Section {
                TextField("Enter Ingredient", text: $ingredientTitle)
                HStack {
                    Menu(amount > 0 ? "Amount : \(amount)" : "Amount") {
                        ForEach(0..<5, id: \.self) { index in
                            Button(action: {
                                self.amount = index
                            }, label: {
                                Text("\(index)")
                            })
                        }
                    }
                    
                    Spacer()
                    
                    Menu("\(measurment.rawValue)") {
                        ForEach(Amount.allCases, id: \.self) { index in
                            Button(action: {
                                self.measurment = index
                                
                            }, label: {
                                Text("\(index.rawValue)")
                            })
                        }
                    }
                }
            } header: {
                Text("Ingredient Name")
            }

        
    }
}

//#Preview {
//    AddIngredientFormView(ingredientTitle: .constant(""))
//}

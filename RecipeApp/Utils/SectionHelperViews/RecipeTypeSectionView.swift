//
//  RecipeTypeSectionView.swift
//  RecipeApp
//
//  Created by Brandon on 3/5/24.
//

import SwiftUI

// Tried to create a use of a generic type here, to have one picker take in a type and run a loop on that type. Tried having the enums conform to a protocol and make the type the protocol for acceptance...did not work

struct RecipeTypeSectionView: View {
    @Binding var recipeType: RecipeType
    var body: some View {
        Section {
            Picker("RecipeType", selection: $recipeType) {
                ForEach(RecipeType.allCases, id: \.self) { difficulty in
                    Text("\(difficulty.rawValue)")
                }
            }
            .pickerStyle(.automatic)
        } header: {
            Text("Recipe Type")
                .font(.headline.bold())
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    RecipeTypeSectionView(recipeType: .constant(.appetizer))
}

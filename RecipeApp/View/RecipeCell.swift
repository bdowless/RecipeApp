//
//  RecipeCell.swift
//  RecipeApp
//
//  Created by Brandon on 2/9/24.
//

import SwiftUI

struct RecipeCell: View {
    
    @State var recipe: Recipe
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.systemGroupedBackground))
                .shadow(radius: 10)
            VStack(alignment: .center, spacing: 20) {
                
                Image(systemName: customImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 62, height: 62)
                
                
                Text("\(recipe.title)")
                    .font(.headline)
                
                HStack() {
                    Text("\(recipe.duration.rawValue)")
                    
                    Text("\(recipe.difficulty.rawValue)")
                        .foregroundStyle(difficultyColor)
                }
                .font(.caption)
            }
        }
        .frame(width: 150 ,height: 150)
        .cornerRadius(25)
        .shadow(radius: 4)
        .padding()
    }
}

#Preview {
    RecipeCell(recipe: Recipe(title: "Frech Onion",  recipeType: .soup, difficulty: .easy, duration: .oneHour, ingredients: [], notes: "Easy to cook and Tasty"))
}

extension RecipeCell {
    
    var customImage: String {
        switch recipe.recipeType {
        case .breakfast:
            return "lungs"
        case .lunch:
            return "heart"
        case .dinner:
            return "microbe.circle"
        case .soup:
            return "eye.circle"
        case .salad:
            return "sun.fill"
        case .desert:
            return "fanblades"
        case .appetizer:
            return "lamp.desk"
        }
    }
    
    var difficultyColor: Color {
        switch recipe.difficulty {
        case .easy:
            return .green
        case .medium:
            return .blue
        case .hard:
            return .red
        }
    }
}

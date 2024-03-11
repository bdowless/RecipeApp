//
//  RecipeHomeView.swift
//  RecipeApp
//
//  Created by Brandon on 3/7/24.
//

import SwiftUI

struct RecipeHomeView: View {
    
    @EnvironmentObject var manager: RecipeManager
    @State private var recipeTypeSelected: RecipeType = .appetizer
    
    let columns: [GridItem] = [GridItem(.fixed(10))]
    var body: some View {
        VStack(alignment: .leading) {
            Menu("Filter by: \(recipeTypeSelected.rawValue) > ") {
                ForEach(RecipeType.allCases, id: \.self) { index in
                    Button(action: {
                        self.recipeTypeSelected = index
                        manager.recipeByTypeArray(type: index)
                        
                    }, label: {
                        Text("\(index.rawValue)")
                    })
                }
            }
            ScrollView(.horizontal) {
                    LazyHGrid(rows: columns, content: {
                        ForEach(manager.recipeTypeArray) { Recipe in
                                RecipeCell(recipe: Recipe)
        //                            .background(Color.purple.opacity(0.1))
        //                            .cornerRadius(20)
                            }
                        
                    })
                    .background(Color.purple.opacity(0.1))
                    .cornerRadius(20)
            }
            Text("All Recipes")
                .foregroundStyle(.blue)
            ScrollView(.horizontal) {
                    LazyHGrid(rows: columns, content: {
                        ForEach(manager.recipeArray) { Recipe in
                                RecipeCell(recipe: Recipe)
                            }
                        
                    })
                    .cornerRadius(20)
            }
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    RecipeHomeView()
        .environmentObject(RecipeManager())
}

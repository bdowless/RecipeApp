//
//  RecipeListView.swift
//  RecipeApp
//
//  Created by Brandon on 2/9/24.
//

import SwiftUI

struct RecipeListView: View {
    @State var welcomeViewDismisal = false
    @State private var searchbarText = ""
    @EnvironmentObject var manager: RecipeManager
//    @StateObject var manager = RecipeManager()
    @State var showRecipeCreationFlow = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())]
    
    var body: some View {
        NavigationStack() {
            if  welcomeViewDismisal == false {
                WelcomeView(WelcomeViewisOver: $welcomeViewDismisal)
            } else if manager.recipeArray.isEmpty {
                VStack(spacing: 50) {
                    Text("Add your First Recipe!")
                       
                    NavigationLink(destination: AddRecipeFormView().environmentObject(manager)) {
                        Text("Get Started")
                    }
                }
                .font(.title.bold())
            }
        
                LazyVGrid(columns: columns) {
                    ForEach(manager.recipeArray) { recipe in
                        NavigationLink(value: recipe) {
                            RecipeCell(recipe: recipe)
                        }
                    }
                }
                .searchable(text: $searchbarText)
       

                .navigationDestination(for: Recipe.self, destination: { recipe in
                    RecipeInfoView(recipe: recipe)
                })
            
                .sheet(isPresented: $showRecipeCreationFlow, content: {
                    RecipeTitleView()
                        .environmentObject(manager)
                })
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: AddRecipeFormView().environmentObject(manager)) {
                            Text("Add Recipe")
                        }
                    }
                }
                
            
        }
    }
}

#Preview {
    RecipeListView()
        .environmentObject(RecipeManager())
}

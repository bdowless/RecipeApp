//
//  HomeTabBarView.swift
//  RecipeApp
//
//  Created by Brandon on 3/6/24.
//

import SwiftUI

struct HomeTabBarView: View {
    @StateObject var recipeManager = RecipeManager()
    var body: some View {
        TabView {
            RecipeHomeView()
                .environmentObject(recipeManager)
            .tabItem {
                Image(systemName: "person")
            }
            AddRecipeView()
                .environmentObject(recipeManager)
            .tabItem {
                Image(systemName: "plus")
            }
            RecipeTitleView()
                .environmentObject(recipeManager)
                .tabItem {
                    Image(systemName: "house")
                }
            
            
        }
    }
}

#Preview {
    HomeTabBarView()
    
}

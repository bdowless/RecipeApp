//
//  AddRecipeView.swift
//  RecipeApp
//
//  Created by Brandon on 2/14/24.
//
//
import SwiftUI

struct RecipeTitleView: View {
    @EnvironmentObject var manager: RecipeManager
    
    var body: some View {
        
            VStack(spacing: 5) {
                
                Text("Enter Your Recipe Name")
                    .font(.title.bold())
                
                TextField("", text: $manager.recipeTitle)
                    .frame(width: 300, height: 40)
                    .cornerRadius(15)
                    .font(.headline)
                
                Divider()
                    .frame(height: 1)
                    .overlay(.green)
                
                Spacer()
                
                NavigationLink(destination: LoginView ()) {
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 60)
                            .padding(.horizontal, 30)
                            .foregroundStyle(.white)
                            .shadow(color: .green, radius: 3)
                        
                        Text("Next")
                    }
                    .foregroundStyle(.green)
                    .font(.title2)
                    .bold()
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .foregroundStyle(.green)
        
    }
}

#Preview {
    RecipeTitleView()
        .environmentObject(RecipeManager())
}

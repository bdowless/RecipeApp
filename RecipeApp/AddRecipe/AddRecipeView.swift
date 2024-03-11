//
//  AddRecipeView.swift
//  RecipeApp
//
//  Created by Brandon on 3/7/24.
//

import SwiftUI

struct AddRecipeView: View {
    
 @State private var pulse = false
    
 @EnvironmentObject var manager: RecipeManager
 @State private var presentAddRecipeForm = false
    var body: some View {
        Button(action: {
            presentAddRecipeForm.toggle()
            manager.clearManager()
        }, label: {
            ZStack {
                Circle()
                    .stroke(lineWidth: 20)
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.blue)
                    .scaleEffect(pulse ? 2 : 1)
                    .opacity(pulse ? 0.1 : 1)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true).speed(0.5))
                    .onAppear() {
                        pulse.toggle()
                    }
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.blue)
                    .shadow(radius: 25)
                
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 90))
                    .foregroundStyle(.white)
                    .shadow(radius: 25)
            }
        })
        .fullScreenCover(isPresented: $presentAddRecipeForm, content: {
            AddRecipeFormView()
                .environmentObject(manager)
        })
    }
}

#Preview {
    AddRecipeView()
        .environmentObject(RecipeManager())
}

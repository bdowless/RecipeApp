//
//  ButtonModifier.swift
//  RecipeApp
//
//  Created by Brandon on 3/5/24.
//

import SwiftUI

struct ButtonModifier: View {
    var buttonTitle: String
    var body: some View {
        Text(buttonTitle)
            .font(.headline.bold())
            .frame(width: 200, height: 50)
            .background(.blue)
            .cornerRadius(25)
            .foregroundStyle(.white)
            .foregroundStyle(.white)
    }
}

#Preview {
    ButtonModifier(buttonTitle: "")
}

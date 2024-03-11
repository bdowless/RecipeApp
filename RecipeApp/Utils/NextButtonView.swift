//
//  NextButtonView.swift
//  RecipeApp
//
//  Created by Brandon on 2/22/24.
//

import SwiftUI

struct NextButtonView: View {
    let buttontitle: String
    var body: some View {
        
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 60)
                .padding(.horizontal, 30)
                .foregroundStyle(.white)
                .shadow(color: .green, radius: 3)
            
            Text("\(buttontitle)")
        }
        .foregroundStyle(.green)
        .font(.title2)
        .bold()
    }
}

//#Preview {
//    NextButtonView()
//}

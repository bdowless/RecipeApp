//
//  SectionHelperView.swift
//  RecipeApp
//
//  Created by Brandon on 3/5/24.
//

import SwiftUI

struct DifficultySectionView: View {
    @Binding var difficulty: Difficulty

    var body: some View {
        Section {
            Picker("Difficulty", selection: $difficulty) {
                ForEach(Difficulty.allCases, id: \.self) { difficulty in
                    Text("\(difficulty.rawValue)")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        } header: {
            Text("Difficulty")
                .font(.headline.bold())
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    DifficultySectionView(difficulty: .constant(.easy))
}

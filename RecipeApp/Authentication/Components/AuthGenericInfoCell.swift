//
//  AuthHelperView.swift
//  RecipeApp
//
//  Created by Brandon on 2/26/24.
//

import SwiftUI

struct AuthGenericInfoCell: View {
    @Binding var text: String
    var placeholder: String
    var title: String
    var isSecureTextField: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("\(title)")
                .fontWeight(.semibold)
                .foregroundStyle(Color(.darkGray))
            if isSecureTextField {
                SecureField("\(placeholder)", text: $text)
            } else {
                TextField("\(placeholder)", text: $text)
            }
            
            Divider()
                .foregroundColor(.black)
        }
        .padding()
    }
}

#Preview {
    AuthGenericInfoCell(text: .constant(""), placeholder: "Enter Email", title: "Enter Email", isSecureTextField: false)
}

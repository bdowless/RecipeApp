//
//  RegistrationView.swift
//  RecipeApp
//
//  Created by Brandon on 2/29/24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var authViewModel = AuthViewModel()
    @State var showAlert = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(spacing: 12) {
            AuthGenericInfoCell(text: $authViewModel.fullname, placeholder: "FullName", title: "Enter Full Name", isSecureTextField: false)
            
            AuthGenericInfoCell(text: $authViewModel.email, placeholder: "Email", title: "Enter Email", isSecureTextField: false)
            
            AuthGenericInfoCell(text: $authViewModel.password, placeholder: "Password", title: "Enter Password", isSecureTextField: true)
            
            AuthGenericInfoCell(text: $authViewModel.confirmPassword, placeholder: "Password", title: "Confirm Password", isSecureTextField: true)
            
            
            
            
            Button(action: {
                showAlert = formIsValid
            }, label: {
                HStack(spacing: 12) {
                    Text("SIGN UP")
                        .font(.headline)
                    
                    Image(systemName: "arrow.right")
                }
                .frame(width: 320, height: 50)
                .background(Color.green)
                .cornerRadius(20)
                .foregroundStyle(.white)
                .padding()
            })
        }
        
        Spacer()
        
        Button(action: {
            dismiss()
        }, label: {
            HStack() {
                Text("Already have an account?")
                
                Text("Sign In")
                    .bold()
            }
        })
        
        .alert("Error", isPresented: $showAlert) {
            Text("Password's Do Not Match!")
                .onTapGesture {
                    dismiss()
                }
        }
    }
}


extension RegistrationView {
        var formIsValid: Bool {
            return authViewModel.passwordsDoNotMatch
        }
}

//#Preview {
//    RegistrationView(dismiss: )
//}

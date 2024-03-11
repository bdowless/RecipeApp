//
//  LoginView.swift
//  RecipeApp
//
//  Created by Brandon on 2/26/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationStack {
            VStack() {
                Image("logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 150)
                
                VStack(spacing: 12) {
                    AuthGenericInfoCell(text: $email, placeholder: "Email", title: "Enter Email", isSecureTextField: false)
                    
                    AuthGenericInfoCell(text: $password, placeholder: "Password", title: "Enter Password", isSecureTextField: true)
                    
                    HStack {
                        Spacer()
                        
                        Text("Forgot Password?")
                            .font(.caption)
                            .foregroundStyle(.blue)
                    }
                    Button(action: {
                        
                    }, label: {
                        HStack(spacing: 12) {
                            Text("SIGN IN")
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
                
                NavigationLink {
                    RegistrationView()
                } label: {
                    HStack() {
                        Text("Dont have an account?")
                        
                        Text("Sign Up")
                            .bold()
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
}

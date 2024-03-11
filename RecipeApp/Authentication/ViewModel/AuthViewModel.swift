//
//  AuthViewModel.swift
//  RecipeApp
//
//  Created by Brandon on 2/29/24.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var fullname = ""
    @Published var confirmPassword = ""
    @Published var email = ""
    @Published var password = ""
    
    var passwordsDoNotMatch: Bool {
        if self.password == self.confirmPassword {
            return false
        } else {
            return true
        }
    }
}

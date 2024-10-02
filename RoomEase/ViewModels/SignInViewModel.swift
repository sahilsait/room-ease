//
//  SignInViewModel.swift
//  RoomEase
//
//  Created by Sahil Sait on 01/10/24.
//

import SwiftUI
import AuthenticationServices


struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
}

class SignInViewModel: ObservableObject {
    @Published var isSignedIn = false
    @Published var alertItem: AlertItem?
    
    func handleSignInWithAppleResult(_ result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let authResults):
            guard let appleIDCredential = authResults.credential as? ASAuthorizationAppleIDCredential else {
                self.alertItem = AlertItem(title: "Sign In Failed", message: "Unable to obtain Apple ID Credential")
                return
            }
            // Here you would typically send the credential to your server
            let userId = appleIDCredential.user
            let userFullName = appleIDCredential.fullName
            let userEmail = appleIDCredential.email
            
            print("User ID: \(userId)")
            print("User Name: \(userFullName?.givenName ?? "") \(userFullName?.familyName ?? "")")
            print("User Email: \(userEmail ?? "")")
            
            self.isSignedIn = true
        case .failure(let error):
            self.alertItem = AlertItem(title: "Sign In Failed", message: error.localizedDescription)
        }
    }
}

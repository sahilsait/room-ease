//
//  SignInView.swift
//  RoomEase
//
//  Created by Sahil Sait on 01/10/24.
//

import SwiftUI
import AuthenticationServices

struct SignInView: View {
    @StateObject private var viewModel = SignInViewModel()
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            Text("RoomEase")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("🏠")
                .font(.system(size: 100))
            
            SignInWithAppleButton(
                .signIn,
                onRequest: { request in
                    request.requestedScopes = [.fullName, .email]
                },
                onCompletion: { result in
                    viewModel.handleSignInWithAppleResult(result)
                }
            )
            .frame(height: 50)
            .padding()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: Text(alertItem.title), message: Text(alertItem.message), dismissButton: .default(Text("OK")))
        }
        .onChange(of: viewModel.isSignedIn) { isSignedIn in
            if isSignedIn {
                appState.isAuthenticated = true
            }
        }
    }
}


#Preview {
    SignInView()
}

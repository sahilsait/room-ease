//
//  RoomEaseApp.swift
//  RoomEase
//
//  Created by Sahil Sait on 01/10/24.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var isAuthenticated = false
    @Published var hasHome = false
    @Published var currentUser: User?
}

@main
struct RoomEaseApp: App {
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            if !appState.isAuthenticated {
                SignInView()
                    .environmentObject(appState)
            } else if !appState.hasHome {
                HomeSetupView()
                    .environmentObject(appState)
            } else {
                HomepageView()
                    .environmentObject(appState)
            }
        }
    }
}


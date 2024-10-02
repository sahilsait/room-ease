//
//  HomeViewModel.swift
//  RoomEase
//
//  Created by Sahil Sait on 01/10/24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var homes: [Home] = []
    @Published var selectedHome: Home?
    @Published var error: String?
    
    func createHome(name: String, user: User) {
        let newHome = Home(id: UUID().uuidString, name: name, members: [user])
        homes.append(newHome)
        selectedHome = newHome
    }
    
    func joinHome(withCode code: String, user: User) {
        // In a real app, you'd validate the code and fetch the home details from a server
        guard let home = homes.first(where: { $0.id == code }) else {
            error = "Invalid home code"
            return
        }
        
        var updatedHome = home
        updatedHome.members.append(user)
        
        if let index = homes.firstIndex(where: { $0.id == home.id }) {
            homes[index] = updatedHome
        }
        
        selectedHome = updatedHome
    }
}

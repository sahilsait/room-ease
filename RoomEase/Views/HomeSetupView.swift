//
//  HomeSetup.swift
//  RoomEase
//
//  Created by Sahil Sait on 01/10/24.
//

import SwiftUI

struct HomeSetupView: View {
    @StateObject private var viewModel = HomeViewModel()
    @EnvironmentObject var appState: AppState
    @State private var homeName = ""
    @State private var joinCode = ""
    @State private var isCreating = true
    
    var body: some View {
        VStack {
            Picker("", selection: $isCreating) {
                Text("Create Home").tag(true)
                Text("Join Home").tag(false)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if isCreating {
                TextField("Home Name", text: $homeName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Create Home") {
                    viewModel.createHome(name: homeName, user: appState.currentUser!)
                }
                .disabled(homeName.isEmpty)
            } else {
                TextField("Join Code", text: $joinCode)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Join Home") {
                    viewModel.joinHome(withCode: joinCode, user: appState.currentUser!)
                }
                .disabled(joinCode.isEmpty)
            }
        }
//        .alert(item: $viewModel.error) { error in
//            Alert(title: Text("Error"), message: Text(error), dismissButton: .default(Text("OK")))
//        }
//        .onChange(of: viewModel.selectedHome) { home in
//            if home != nil {
//                appState.hasHome = true
//            }
//        }
    }
}

#Preview {
    HomeSetupView()
}

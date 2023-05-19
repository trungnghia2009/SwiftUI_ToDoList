//
//  ContentView.swift
//  ToDoList
//
//  Created by trungnghia on 18/05/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewViewModel
    
    init(viewModel: MainViewViewModel = MainViewViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            // Signed in
            accountView
        } else {
            NavigationView {
                LoginView()
            }
        }
    }
    
    @ViewBuilder
    private var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

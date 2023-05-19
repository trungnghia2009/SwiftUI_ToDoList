//
//  ProfileView.swift
//  ToDoList
//
//  Created by trungnghia on 18/05/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewViewModel
    
    init(viewModel: ProfileViewViewModel = ProfileViewViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello guy!!")
                
                
                
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        
    }
}

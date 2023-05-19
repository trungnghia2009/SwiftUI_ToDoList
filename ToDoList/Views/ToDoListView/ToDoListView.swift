//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by trungnghia on 18/05/2023.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    
    private let userId: String
    
    init(viewModel: ToDoListViewViewModel = ToDoListViewViewModel(), userId: String) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.isShowNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.isShowNewItemView) {
                NewItemView(newItemPresented: $viewModel.isShowNewItemView)
            }
            
        }
        
        
    }
}

struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            ToDoListView(userId: "Test")
                .tabItem {
                    Label("home", systemImage: "house")
                }
        }
        
    }
}

//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by trungnghia on 18/05/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    @State var currentItemId = ""
    
    init(userId: String) {
        _items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        _viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                            
                            Button("Edit") {
                                self.currentItemId = item.id
                                viewModel.isShowEditItemView = true
                            }
                            .tint(.cyan)
                        }
                }
                .listStyle(PlainListStyle())
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
            .sheet(isPresented: $viewModel.isShowEditItemView) {
                EditItemView(viewModel: EditItemViewViewModel(id: currentItemId), newItemPresented: $viewModel.isShowEditItemView)
            }
            
        }
        
        
    }
}

struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            ToDoListView(userId: "VQAwmAHdemOIInKJtYIZrtqKV8v2")
                .tabItem {
                    Label("home", systemImage: "house")
                }
        }
        
    }
}

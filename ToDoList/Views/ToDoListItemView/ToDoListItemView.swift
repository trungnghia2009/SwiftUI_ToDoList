//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by trungnghia on 18/05/2023.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel: ToDoListItemViewViewModel
    
    init(viewModel: ToDoListItemViewViewModel = ToDoListItemViewViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView()
    }
}

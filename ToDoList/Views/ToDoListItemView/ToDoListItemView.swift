//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by trungnghia on 18/05/2023.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel: ToDoListItemViewViewModel
    let item: ToDoListItem
    
    init(
        viewModel: ToDoListItemViewViewModel = ToDoListItemViewViewModel(),
        item: ToDoListItem
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.item = item
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                // Action
                print("Tapping on item: \(item.title)")
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            }
            .padding(.trailing, 20)

        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ToDoListItemView(item: ToDoListItem(
                id: "id",
                title: "Task 1",
                dueDate: Date().addingTimeInterval(86400).timeIntervalSince1970,
                createdDate: Date().timeIntervalSince1970,
                isDone: false
            ))
        }
        .frame(width: .infinity, height: 100)
        .border(.blue, width: 1)
        
    }
}

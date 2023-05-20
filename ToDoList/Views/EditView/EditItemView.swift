//
//  EditItemView.swift
//  ToDoList
//
//  Created by trungnghia on 20/05/2023.
//

import SwiftUI

struct EditItemView: View {
    @StateObject var viewModel: EditItemViewViewModel
    @Binding var newItemPresented: Bool
    
    var body: some View {
            VStack {
                Text("Edit Item")
                    .font(.system(size: 32))
                    .bold()
                    .padding(.top, 100)
                
                Form {
                    //Title
                    TextField("Title", text: $viewModel.title)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    // Due Date
                    DatePicker("Due Date", selection: $viewModel.dueDate)
                        .datePickerStyle(GraphicalDatePickerStyle())
                    
                    // Button
                    TLButton(
                        title: "Save",
                        backgroundColor: .pink
                    ) {
                        if viewModel.canSave {
                            viewModel.save()
                            newItemPresented = false
                        } else {
                            viewModel.showAlert = true
                        }
                        
                    }
                    .padding()
                }
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in the all fields and select due date that is today or newer")
                )
            }
            .onAppear {
                viewModel.getItemInfo()
            }
    }
}

struct EditItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}

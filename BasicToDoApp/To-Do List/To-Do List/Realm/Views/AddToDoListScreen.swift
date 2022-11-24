//
//  AddToDoListScreen.swift
//  To-Do List
//
//  Created by Macbook Pro 2015 on 17/8/22.
//

import SwiftUI
import RealmSwift

struct AddToDoListScreen: View {
    @State var textFieldText:String =  ""
    @State var decriptionFieldText = "Description"
    @Environment(\.dismiss) private var dismiss
    @ObservedResults(ToDoShopingList.self) var toDoShoppingList
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    TextField("Type something here...", text: $textFieldText)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                    TextEditor(text: $decriptionFieldText)
                        //.multilineTextAlignment(.center)
                        //.textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                        .frame(height: 100)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                    Button {
                        let toDoShoppingList = ToDoShopingList()
                        toDoShoppingList.title = textFieldText
                        toDoShoppingList.address = decriptionFieldText
                        $toDoShoppingList.append(toDoShoppingList)
                        dismiss()
                    }label: {
                        Text("Save" .uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }
                }
            }
            .navigationTitle("Add an items 🖊")
        }
    }
}

struct AddToDoListScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoListScreen()
    }
}

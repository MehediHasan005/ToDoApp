//
//  MainContentView.swift
//  To-Do List
//
//  Created by Macbook Pro 2015 on 17/8/22.
//

import SwiftUI
import RealmSwift

struct MainContentView: View {
    @ObservedResults(ToDoShopingList.self) var toDoShoppingList
    @State private var isPresented : Bool = false
    var body: some View {
        NavigationView {
            if toDoShoppingList.isEmpty {
                Text("To_Do is empty")
            }
            List {
                ForEach(toDoShoppingList , id: \.id) { toDoList in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(toDoList.title)
                        Text(toDoList.address)
                            .opacity(0.4)
                    }
                    
                }.onDelete(perform: $toDoShoppingList.remove)
            }
                    .navigationTitle("To-Do App")
            }
                
            .sheet(isPresented: $isPresented, content: {
                AddToDoListScreen()
            })
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Button {
                            isPresented.toggle()
                        }label: {
                            Image(systemName: "plus")
                        }
                    })
                }
        }
    }


struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}

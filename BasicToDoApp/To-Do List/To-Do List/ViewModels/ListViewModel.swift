//
//  ListViewModel.swift
//  To-Do List
//
//  Created by Macbook Pro 2015 on 3/8/22.
//

import Foundation
class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemKey: String = "items_list"
    init() {
        getItems()
    }
    func getItems() {
//        let newItems = [
//            ItemModel(title: "This is first items!", isCompleted: false),
//            ItemModel(title: "This is second!", isCompleted: true),
//            ItemModel(title: "Third!", isCompleted: false)
//        ]
//        items.append(contentsOf: newItems)
        guard let data = UserDefaults.standard.data(forKey: itemKey) else{
            return
        }
        guard let saveItems = try? JSONDecoder().decode([ItemModel].self , from: data) else{return}
        self.items = saveItems
    }
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet , to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String , description: String) {
        let newItem = ItemModel(title: title,description: description, isCompleted: false)
        items.append(newItem)
    }
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            
            items[index] = item.updateCompletion()
        }
    }
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}

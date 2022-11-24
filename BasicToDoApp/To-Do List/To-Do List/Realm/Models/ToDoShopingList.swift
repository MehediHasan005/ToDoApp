//
//  ToDoShopingList.swift
//  To-Do List
//
//  Created by Macbook Pro 2015 on 18/8/22.
//

import Foundation
import RealmSwift

class ToDoShopingList: Object , Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var address: String
    
    override class func primaryKey() -> String? {
        "id"
    }
}

//
//  Task.swift
//  To-Do List
//
//  Created by Macbook Pro 2015 on 20/8/22.
//

import Foundation
import RealmSwift

class Task: Object , ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var details = ""
    @Persisted var completed = false
}

//
//  RealmManager.swift
//  To-Do List
//
//  Created by Macbook Pro 2015 on 20/8/22.
//

import Foundation
import RealmSwift
import SwiftUI


class RealmManager : ObservableObject {
    private(set) var localRealm : Realm?
    @Published private(set) var tasks: [Task] = []
    
    init() {
        openRealm()
        getTasks()
    }
    
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1 )
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
        }catch {
            print("Error opening realm: \(error)")
        }
    }
    func addTask(taskTitle: String , taskDetails: String  ) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newTask = Task(value: ["title" : taskTitle , "details" : taskDetails  , "completed" : false])
                    
                    localRealm.add(newTask)
                    print("Added new task to realm .\(newTask)")
                }
            }catch {
                print("error adding task to realm .\(error)")
            }
        }
    }
    func getTasks() {
        if let localRealm = localRealm {
            let allTask = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTask.forEach { task in
                tasks.append(task)
            }
        }
    }
    func updateTask(id: ObjectId , completed: Bool) {
        if let localRealm = localRealm {
            do {
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else{return}
                
                try localRealm.write {
                    taskToUpdate[0].completed = completed
                    getTasks()
                    print("Updated task id : \(id)! completed status \(completed)")
                }
            } catch {
                print("Error updating task \(id) to realm : \(error)")
            }
        }
    }
    func deleteTask(id: ObjectId ) {
        if let localRealm = localRealm {
            do {
                let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToDelete.isEmpty else{return}
                try localRealm.write {
                    localRealm.delete(taskToDelete)
                    getTasks()
                    print("Delete to id : \(id)")
                }
            }catch {
                print("Error deleting task iid: \(id) form realm \(error)")
            }
        }
    }
    func editTask(id: ObjectId ,taskTitle: String , taskDetails: String ) {
        if let localRealm = localRealm {
            do {
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else{return}
                
                try localRealm.write {
                    taskToUpdate[0].title = taskTitle
                    taskToUpdate[0].details = taskDetails
                    //taskToUpdate[0].completed = completed
                    getTasks()
                    print("Updated task id : \(id)! title status \(taskTitle) , description status \(taskDetails)")
                }
            } catch {
                print("Error updating task \(id) to realm : \(error)")
            }
        }
    }
}


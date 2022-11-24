//
//  TasksView.swift
//  To-Do List
//
//  Created by Macbook Pro 2015 on 23/8/22.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State var alertTitle: String = ""
    @State private var alertIsPresented = false
    @State private var showAddTaskView = false
    @State var selectedTask : Task = Task()
    var text = ""
    var body: some View {
        
        VStack {
            Text("My Tasks")
                .font(.title3).bold()
                .padding()
                .frame(maxWidth: .infinity ,  alignment: .leading)
            Text(getCurrentTime())
                .font(.title3).bold()
                //.padding(.top , 40)
                .frame(maxWidth: .infinity ,  alignment: .leading)

            
            List {
                ForEach(realmManager.tasks , id: \.id) { task in
                    if !task.isInvalidated {
                        TaskRow(task: task.title, details: task.details, completed: task.completed)
                            .onTapGesture {
                                
                                self.alertIsPresented = true
                                //realmManager.updateTask(id: task.id, completed: !task.completed)
                            }
                            .alert(isPresented: $alertIsPresented, content: {
                                Alert(title: task.completed ?  Text("Would you like to incomplete this task?") : Text("Would you like to  complete this task?"), primaryButton: .default(Text("Yes"), action: {realmManager.updateTask(id: task.id, completed: !task.completed)}), secondaryButton: .default(Text("No"), action: {realmManager.updateTask(id: task.id, completed: task.completed)}))
                            })
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    realmManager.deleteTask(id: task.id)
                                }label: {
                                    Image(systemName: "trash")
                                }
                            }
                            .swipeActions(edge: .leading) {
                                Button() {
                                    
                                  // UpdateTask(textFieldText: task.title, decriptionFieldText: task.details)
                                    self.selectedTask = task
                                    print("shgfsff", self.selectedTask)
                                    showAddTaskView.toggle()
                                    
                                }label: {
                                    Text("Edit")
                                        .foregroundColor(Color.green)
                                }
                            }
                    }
                }
            }
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
        .sheet(isPresented: $showAddTaskView) {
//            guard let selectedTask1 = selectedTask else {
////            UpdateTask(task: self.selectedTask!)
////                    .environmentObject(realmManager)
//            }

            UpdateTask(task: self.selectedTask)
                .environmentObject(realmManager).onAppear()
        }
    }
    func getCurrentTime() ->String {
        let date = Date()
        let calender = Calendar.current
        let day = calender.component(.day, from: date)
        let month = calender.component(.month, from: date)
        let year = calender.component(.year, from: date)
        let hour = calender.component(.hour, from: date)
        let minutes = calender.component(.minute, from: date)
        var minutesTwo = "\(minutes)"
        if (minutesTwo.count == 1) {
            minutesTwo = "0\(minutes)"
        }
        var hourTwo = "\(hour)"
        if (hourTwo.count == 1) {
            hourTwo = "0\(hour)"
        }
        var monthTwo = "\(month)"
        if (monthTwo.count == 1) {
            monthTwo = "0\(month)"
        }
        
        let thedate = "\(day)/\(monthTwo)/\(year)"
        return thedate
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}

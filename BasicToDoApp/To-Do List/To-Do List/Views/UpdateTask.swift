//
//  UpdateTask.swift
//  To-Do List
//
//  Created by Macbook Pro 2015 on 26/8/22.
//

import SwiftUI

struct UpdateTask: View {
    @State var task: Task
    //@State var decriptionFieldText : String
    @EnvironmentObject var realmManager: RealmManager
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .leading , spacing: 20) {
            Text("Edit Task")
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Type something here...", text: $task.title)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
            TextEditor(text: $task.details)
                //.multilineTextAlignment(.center)
                //.textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .frame(height: 100)
                .frame(maxWidth: .infinity)
                //.background(Color(UIColor.secondarySystemBackground))
                //.foregroundColor(.black)
                .background(Color.gray)
                .cornerRadius(10)
            Button {
                print("Print message")
                if task.title != "" {
                    //realmManager.addTask(taskTitle: textFieldText, taskDetails: decriptionFieldText )
                   //TaskRow(task: task.title, details: task.details, completed: task.completed)
                   //realmManager.editTask(id: , taskTitle: <#T##String#>, taskDetails: <#T##String#>)
                }
                realmManager.getTasks()
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
        .padding(.top , 40)
        .padding(.horizontal)
        //.background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
        .disableAutocorrection(true)
        .onAppear(){
            realmManager.getTasks()
            print("Print message")
        }
    }
}

//struct UpdateTask_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateTask()
//    }
//}

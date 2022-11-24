//
//  AddTaskView.swift
//  To-Do List
//
//  Created by Macbook Pro 2015 on 23/8/22.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    //@StateObject var realmManager = RealmManager()
    @State var textFieldText:String =  ""
    @State var decriptionFieldText = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .leading , spacing: 20) {
            Text("Create a new task")
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Type something here...", text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
            TextEditor(text: $decriptionFieldText)
                //.multilineTextAlignment(.center)
                //.textFieldStyle(.roundedBorder)
                //.padding(.horizontal)
                .frame(height: 100)
                .frame(maxWidth: .infinity)
                //.background(Color(UIColor.secondarySystemBackground))
                //.foregroundColor(.black)
                .background(.gray)
                .colorMultiply(.gray)
                .cornerRadius(10)
            Button {
                print("Print message")
               if textFieldText != "" {
                   realmManager.addTask(taskTitle: textFieldText, taskDetails: decriptionFieldText)
                   //TaskRow(task: task.title, details: task.details, completed: task.completed)
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

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}

//
//  AddView.swift
//  To-Do List
//
//  Created by Macbook Pro 2015 on 3/8/22.
//

import SwiftUI

struct AddView: View {
    //@Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var realmManager: RealmManager
    @Environment(\.dismiss) var dismiss
    //@EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText:String =  ""
    @State var decriptionFieldText = "Description"
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
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
                    print("Print message")
                   if textFieldText != "" {
                       //realmManager.addTask(taskTitle: textFieldText, taskDetails: decriptionFieldText)
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
            .disableAutocorrection(true)
            .padding(14)
        }
        .navigationTitle("Add an items 🖊")
        .alert(isPresented:$showAlert , content: getAlert)
    }
    func saveButtonPressed() {
        if textIsAppropriate() {
            //realmManager.addTask(taskTitle: textFieldText, taskDetails: decriptionFieldText )
            
        }
    }
    func textIsAppropriate()-> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new to-do list must be 3 charactars long!"
            showAlert.toggle()
            return false
        }else {
            return true
        }
    }
    func getAlert()-> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
            .environmentObject(RealmManager())
    }
}

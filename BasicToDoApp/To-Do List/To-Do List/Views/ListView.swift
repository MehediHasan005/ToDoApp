//
//  ListView.swift
//  To-Do List
//
//  Created by Macbook Pro 2015 on 3/8/22.
//
/*
upadet
delete
 add
 edit
*/

import SwiftUI

struct ListView: View {
    //@EnvironmentObject var listViewModel: ListViewModel
    @StateObject var realmManager = RealmManager()
    @State var showPopUp : Bool = false
    var body: some View {
        ZStack {
            if realmManager.tasks.isEmpty {
                NoItemView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach (realmManager.tasks , id: \.id ) { task in
                        if !task.isInvalidated {
                            TaskRow(task: task.title, details: task.details, completed: task.completed)
                                
                            
                                .onTapGesture {
                                    realmManager.updateTask(id: task.id, completed: !task.completed)
                                }
                                .swipeActions(edge: .trailing) {
                                    Button(role: .destructive) {
                                        realmManager.deleteTask(id: task.id)
                                    }label: {
                                        Image(systemName: "trash")
                                    }
                                }
                        }
                        
                    }
                }
                .listStyle(PlainListStyle())

            }
        }
        .navigationTitle("To-Do List 📝")
        .navigationBarItems(
            leading:EditButton() ,
            trailing:NavigationLink("Add", destination: AddView() .environmentObject(realmManager)) )
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(RealmManager())
    }
}
struct EditText: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @Binding var showPopUp : Bool
    @State var textFieldText:String =  ""
    @State var decriptionFieldText = "Description"
    var body: some View {
        ZStack{
            if showPopUp{
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showPopUp = false
                    }
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
                            saveButtonPress()
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
                
                
            }
        }
    }
    func saveButtonPress() {
        listViewModel.addItem(title: textFieldText , description: decriptionFieldText)
        
    }
}

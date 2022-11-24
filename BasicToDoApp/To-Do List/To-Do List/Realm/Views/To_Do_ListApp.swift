//
//  To_Do_ListApp.swift
//  To-Do List
//
//  Created by Macbook Pro 2015 on 3/8/22.
//

import SwiftUI
/*
 MVVM Architecture
 Model - data point
 View- Ui
 ViewModel - manage models form view
 
 */
@main
struct To_Do_ListApp: App {
    //@StateObject var listViewModel: ListViewModel = ListViewModel()
    @StateObject var realmManager = RealmManager()
    var body: some Scene {
        WindowGroup {
            //NavigationView {
               // let _ = UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                //let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
                ContentView()
           // }
            //.environmentObject(realmManager)
        }
    }
}

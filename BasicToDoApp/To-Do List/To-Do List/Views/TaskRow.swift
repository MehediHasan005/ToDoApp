//
//  TaskRow.swift
//  To-Do List
//
//  Created by Macbook Pro 2015 on 23/8/22.
//

import SwiftUI

struct TaskRow: View {
    var task: String
    var details: String
    var completed: Bool
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName:  completed ? "checkmark.circle" : "circle")
            VStack (spacing: 5) {
                HStack {
                    Text(task)
                    Spacer()
                }
                HStack {
                    Text(details)
                    Spacer()
                }
            }
            
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "Hello", details: "welcome" , completed: true)
    }
}


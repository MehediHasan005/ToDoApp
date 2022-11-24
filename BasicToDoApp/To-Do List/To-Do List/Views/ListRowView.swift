//
//  ListRowView.swift
//  To-Do List
//
//  Created by Macbook Pro 2015 on 3/8/22.
//

import SwiftUI

struct ListRowView: View {
    @EnvironmentObject var realmManager: RealmManager
    let item: ItemModel
    var body: some View {
        HStack {
            VStack{
                Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                    .foregroundColor(item.isCompleted ? .green : .red)
                Spacer()
            }
            
            VStack(spacing: 10) {
                HStack {
                    Text(item.title)
                        .font(.title2)
                    Spacer()
                }
                VStack(spacing: 5) {
                    HStack{
                        Text("Description:")
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    HStack {
                        Text(item.description)
                            .font(.system(size: 14))
                            //.padding(.horizontal , 16)
                        Spacer()
                    }
                }
            }
            .padding(.horizontal , 10)
                
            Spacer()
        }
        .font(.title2)
        .padding(.vertical , 8)
    }


}


struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "First item!",description: "Fist description", isCompleted: false)
    static var item2 = ItemModel(title: "Second item",description: "Second description", isCompleted: true)
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}

//
//  SmallAddButton.swift
//  To-Do List
//
//  Created by Macbook Pro 2015 on 23/8/22.
//

import SwiftUI

struct SmallAddButton: View {
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50)
                .foregroundColor(Color.green)
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
        .frame(height: 50)
    }
}

struct SmallAddButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallAddButton()
    }
}

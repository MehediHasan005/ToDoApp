//
//  NoItemView.swift
//  To-Do List
//
//  Created by Macbook Pro 2015 on 3/8/22.
//

import SwiftUI

struct NoItemView: View {
    
    @State var animate: Bool = false
    @StateObject var realmManager = RealmManager()
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There is no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("You are a productive person? I think you should click the add button and add a bunch of items to yours todo list! ")
                    .padding(.bottom , 20)
                NavigationLink (destination: AddView() .environmentObject(realmManager), label: {
                    Text("Add something")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.purple : Color.accentColor)
                        .cornerRadius(10)
                })
                .padding(.horizontal , animate ? 30 : 50)
                .shadow(
                    color: animate ? Color.purple : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10 ,
                    x: 0,
                    y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform:  addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func addAnimation() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5 ) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemView()
                .navigationTitle("Title")
        }
    }
}

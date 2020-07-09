//
//  ContentView.swift
//  side menu
//
//  Created by Usman Mukhtar on 09/07/2020.
//  Copyright © 2020 Usman Mukhtar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var index = "Home"
    @State var show = false
    
    var body: some View {
        ZStack {
            (self.show ? Color.yellow : Color.clear).edgesIgnoringSafeArea(.all)
            
            ZStack(alignment: . leading) {
                VStack (alignment: .leading, spacing: 25){
                    
                    VStack (alignment: .leading, spacing: 10){
                        Image("user")
                        .resizable()
                        .frame(width: 65, height: 65)
                            
                        Text("Techlearnable")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 50)

                    List(data) { i in
                        Button(action: {
                        }) {
                            HStack {
                                Image(systemName: i.icon)
                                    .foregroundColor(Color.white)

                                Text(i.name)
                                    .padding(.leading)
                                    .foregroundColor(.white)
                            }.padding(.vertical)
                        }
                    }.onAppear {
                        UITableView.appearance().separatorStyle = .none
                        UITableView.appearance().backgroundColor = .clear
                        UITableViewCell.appearance().backgroundColor = .clear
                    }
                    
                    Spacer()
                }
                .padding(.leading)
                .padding(.top)
                
                ZStack(alignment: .topTrailing) {

                    Home(show: self.$show)
                        .scaleEffect(self.show ? 0.8 : 1)
                        .offset(x: self.show ? (UIScreen.main.bounds.width - 100) : 0)
                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    @Binding var show: Bool
    var body : some View {
        VStack(spacing: 0){
            ZStack{
                HStack{
                    Button(action: {
                        withAnimation(.spring()) {
                            self.show.toggle()
                        }
                    }) {
                        (self.show ? Image(systemName: "xmark") : Image("menu"))
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.black)
                    }
                    Spacer()
                }
                
                Text("Side Menu App")
                    .fontWeight(.bold)
                    .font(.title)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            Spacer()
            
            Text("Your Content")
            
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(20)
    }
}

var data = [
    Menu(name: "Home", icon: "house.fill"),
    Menu(name: "Features", icon: "pencil.slash"),
    Menu(name: "Settings", icon: "gear"),
    Menu(name: "Help", icon: "questionmark.circle.fill"),
    Menu(name: "Logout", icon: "arrow.left.square.fill"),
    
]

struct Menu: Identifiable{
    var id = UUID()
    var name : String
    var icon: String
}

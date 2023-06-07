//
//  ContentView.swift
//  DevBasic
//
//  Created by duck on 2023/06/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView { // ✨
            List {
                CustomCell(cellNum: 2)
                CustomCell(cellNum: 3)
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("List View")
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

}
 
struct CustomCell: View {
    var cellNum: Int
 
    var body: some View {
        HStack {
            // ✨ 반드시 ! NavigationLink 로 감싸줘야함.
            NavigationLink(destination: DetailView()) {
                Image(systemName: "tortoise.fill")
                Text("\(cellNum)")
            }
        }
    }
}
 
// Cell을 선택했을 때 이동될 View.
struct DetailView: View {
    var body: some View {
        Image("펭수")
    }
}
    
    


//
//  ContentView.swift
//  DevBasic
//
//  Created by duck on 2023/06/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            NavigationView { // ✨
                List {
                    Section(header: Text("UI")){
                        CustomCell(cellNum: "Bound와 Frame의 차이")
                        CustomCell(cellNum: "StackView란?")
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("iOS")
            }
            .tabItem {
                Image(systemName: "ipad.and.iphone")
                Text("iOS")
            }
            NavigationView { // ✨
                List {
                    CustomCell(cellNum: "객체지향프로그래밍이란?")
                    CustomCell(cellNum: "함수형프로그래밍이란?")
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("CS")
            }
            .tabItem {
                Image(systemName: "display.trianglebadge.exclamationmark")
                Text("CS")
            }
            
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

}
 
struct CustomCell: View {
    var cellNum: String
 
    var body: some View {
        HStack {
            // ✨ 반드시 ! NavigationLink 로 감싸줘야함.
            NavigationLink(destination: DetailView()) {
                Image(systemName: "tortoise.fill")
                Text(cellNum)
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
    
    


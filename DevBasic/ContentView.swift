//
//  ContentView.swift
//  DevBasic
//
//  Created by duck on 2023/06/07.
//

import SwiftUI
import FirebaseFirestore

struct QAList {
    let question: [String]
    let answer: [String]
}


struct User {
    let yes: String
    let no: String
}


struct ContentView: View {
    @State private var users: [User] = []
    
    
    @State private var q: [String] = [""]
    @State private var a: [String] = [""]
    
    var body: some View {
        List(q, id: \.self) { question in
            VStack(alignment: .leading) {
                Text(question)
            }
        }
        .onAppear {
            fetchUsers()
        }
    }
    
    func fetchUsers() {
        UserService().fetchUsers { users in
            self.users = users
            print(self.users)
        }
        FireStoreService().fetchUsers { qa in
            self.q = qa.question
            self.a = qa.answer
            
        }
    }
}


//struct ContentView: View {
//
//    @EnvironmentObject var firestoreManager: FireStoreManager
//
//
//
//    @State private var array : [QA] = []
//
////    func fetchUsers(){
////        FireStoreManager().fetchData{ qa in
////            self.array = qa
////
////        }
////    }
//
//    var body: some View {
//        TabView{
//            NavigationView { // ✨
//                List(array, id: \.self) { name in
//                    Section(header: Text("UI")){
//
//                        Content(content: name)
////                        Content(content: "StackView란?")
//
////                        Content(content: firestoreManager.question)
//                    }
//                }
//                .listStyle(GroupedListStyle())
//                .navigationBarTitle("iOS")
//
//            }
//            .tabItem {
//                Image(systemName: "ipad.and.iphone")
//                Text("iOS")
//            }
//            NavigationView { // ✨
//                List {
////                    Content(content: "객체지향프로그래밍이란?")
////                    Content(content: "함수형프로그래밍이란?")
//                }
//                .listStyle(GroupedListStyle())
//                .navigationBarTitle("CS")
//            }
//            .tabItem {
//                Image(systemName: "display.trianglebadge.exclamationmark")
//                Text("CS")
//            }
//        }
//    }
//    //    struct ContentView_Previews: PreviewProvider {
//    //        static var previews: some View {
//    //            ContentView()
//    //        }
//    //    }
//
//}
//
//struct Content: View {
//    var content: String
//
//    var body: some View {
//        // ✨ 반드시 ! NavigationLink 로 감싸줘야함.
//        NavigationLink(destination: DetailView()) {
//            Text(content)
//        }
//
//    }
//}
//
//
//// Cell을 선택했을 때 이동될 View.
//struct DetailView: View {
//    @EnvironmentObject var firestoreManager: FireStoreManager
//    var body: some View {
//        Content(content: "다음 뷰")
//    }
//}




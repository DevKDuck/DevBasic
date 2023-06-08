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

struct ContentView: View {
    
    @State private var questions: [String] = [""]
    @State private var answers: [String] = [""]
    @State private var selectedRow: Int? = nil
    
    var body: some View {
        
        TabView{
            NavigationView{
                List{
                    Section(header: Text("UI관련")){
                        
                        ForEach(questions.indices, id:\.self){ index in
                            NavigationLink(destination: Text(answers[index]), tag: index, selection: $selectedRow){
                                Text(questions[index])
                            }
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("iOS")
                .onAppear {
                    fetchQA()
                }
                
            }
            .tabItem{
                Image(systemName: "ipad.and.iphone")
                Text("iOS")
            }
            
        }
    }
    
    func fetchQA() {
        FireStoreService().fetchUsers { qa in
            self.questions = qa.question
            self.answers = qa.answer
            
        }
    }
}


//// Cell을 선택했을 때 이동될 View.
struct DetailView: View {
    //    @EnvironmentObject var firestoreManager: FireStoreManager
    
    @State private var answers: [String] = [""]
    
    var body: some View {
        ForEach(answers, id:\.self){ answer in
            Text(answer)
        }.onAppear{
            fetchAnswer()
        }
    }
    
    func fetchAnswer(){
        FireStoreService().fetchUsers { qa in
            self.answers = qa.answer
        }
    }
    
}


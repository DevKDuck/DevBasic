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

struct ContentScrollView: View{
    var content: String
    
    var body: some View{
        ScrollView{
            Text(content)
                .padding()
        }
    }
}

struct ContentView: View {
    
    @State private var questionsToUI: [String] = [""]
    @State private var answersToUI: [String] = [""]
    @State private var questionsToiOS: [String] = [""]
    @State private var answersToiOS: [String] = [""]
    @State private var questionsToSwift: [String] = [""]
    @State private var answersToSwift: [String] = [""]
    @State private var questionsToRxSwift: [String] = [""]
    @State private var answersToRxSwift: [String] = [""]
    
    @State private var questionsToReference: [String] = [""]
    @State private var answersToReference: [String] = [""]
    @State private var questionsToFunctionalProgramming: [String] = [""]
    @State private var answersToFunctionalProgramming: [String] = [""]
    @State private var questionsToArchitecture: [String] = [""]
    @State private var answersToArchitecture: [String] = [""]
    @State private var questionsToRelease: [String] = [""]
    @State private var answersToRelease: [String] = [""]
    
    @State private var questionsToSwiftUICombine: [String] = [""]
    @State private var answersToSwiftUICombine: [String] = [""]
    
    @State private var questionsToCSCommon: [String] = [""]
    @State private var answersToCSCommon: [String] = [""]
    
    @State private var questionsToNetwork: [String] = [""]
    @State private var answersToNetwork: [String] = [""]
    
    @State private var questionsToDataStructure: [String] = [""]
    @State private var answersToDataStructure: [String] = [""]
    
    @State private var isLoading = true
    
    
    
    var body: some View {
        
        TabView{
            NavigationView{
                if isLoading{
                    ProgressView().progressViewStyle(CircularProgressViewStyle())
                        .padding()
                }
                else{
                    List{
                        Section(header: Text("UI관련")){
                            ForEach(questionsToUI.indices, id:\.self){ index in
                                NavigationLink(destination: ContentScrollView(content: answersToUI[index]),label:{
                                    Text(questionsToUI[index])
                                }
                                )}
                        }
                        Section(header: Text("iOS")){
                            
                            ForEach(questionsToiOS.indices, id:\.self){ index in
                                NavigationLink(destination: ContentScrollView(content: answersToiOS[index]), label:{
                                    Text(questionsToiOS[index])
                                }
                                )}
                        }
                    }
                    .listStyle(GroupedListStyle())
                    .navigationBarTitle("iOS")
                }
            }
            .tabItem{
                Image(systemName: "applelogo")
                Text("iOS")
            }
            NavigationView{
                List{
                    Section(header: Text("Swift")){
                        
                        ForEach(questionsToSwift.indices, id:\.self){ index in
                            NavigationLink(destination: ContentScrollView(content:answersToSwift[index]),label:{
                                Text(questionsToSwift[index])
                                
                            }
                            )}
                    }
                    
                    Section(header: Text("RxSwift")){
                        
                        ForEach(questionsToRxSwift.indices, id:\.self){ index in
                            NavigationLink(destination: ContentScrollView(content:answersToRxSwift[index]),label:{
                                Text(questionsToRxSwift[index])
                                
                            }
                            )}
                    }
                    
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("Swift")
            }
            .tabItem{
                Image(systemName: "swift")
                Text("Swift")
            }
            
            NavigationView{
                List{
                    Section(header: Text("Computer Science ")){
                        ForEach(questionsToCSCommon.indices, id:\.self){ index in
                            NavigationLink(destination: ContentScrollView(content: answersToCSCommon[index]), label:{
                                Text(questionsToCSCommon[index])
                            })
                        }
                        
                    }
                    
                    Section(header: Text("Network")){
                        
                        ForEach(questionsToNetwork.indices, id:\.self){ index in
                            NavigationLink(destination: ContentScrollView(content:answersToNetwork[index]),label:{
                                Text(questionsToNetwork[index])
                            }
                            )}
                    }
                    Section(header: Text("DataStructure")){
                        
                        ForEach(questionsToDataStructure.indices, id:\.self){ index in
                            NavigationLink(destination: ContentScrollView(content:answersToDataStructure[index]),label:{
                                Text(questionsToDataStructure[index])
                            }
                            )}
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("Computer Science")
            }
            .tabItem{
                Image(systemName: "desktopcomputer")
                Text("Computer Science")
            }
            
            NavigationView{
                List{
                    Section(header: Text("Reference")){
                        
                        ForEach(questionsToReference.indices, id:\.self){ index in
                            NavigationLink(destination: ContentScrollView(content:answersToReference[index]),label:{
                                Text(questionsToReference[index])
                            }
                            )}
                    }
                    
                    Section(header: Text("Functional Programming")){
                        
                        ForEach(questionsToFunctionalProgramming.indices, id:\.self){ index in
                            NavigationLink(destination: ContentScrollView(content:answersToFunctionalProgramming[index]),label:{
                                Text(questionsToFunctionalProgramming[index])
                                
                            }
                            )}
                    }
                    
                    Section(header: Text("Architecture")){
                        
                        ForEach(questionsToArchitecture.indices, id:\.self){ index in
                            NavigationLink(destination: ContentScrollView(content:answersToArchitecture[index]),label:{
                                Text(questionsToArchitecture[index])
                            }
                            )}
                    }
                    
                    Section(header: Text("Release")){
                        
                        ForEach(questionsToRelease.indices, id:\.self){ index in
                            NavigationLink(destination: ContentScrollView(content:answersToRelease[index]),label:{
                                Text(questionsToRelease[index])
                                
                            }
                            )}
                    }
                    Section(header: Text("SwiftUI+Combine")){
                        
                        ForEach(questionsToSwiftUICombine.indices, id:\.self){ index in
                            NavigationLink(destination: ContentScrollView(content:answersToSwiftUICombine[index]),label:{
                                Text(questionsToSwiftUICombine[index])
                                
                            }
                            )}
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("Etc")
 
            }
            .tabItem{
                Image(systemName: "ellipsis.circle")
                Text("Etc")
            }
            
        }
        .onAppear {
            fetchQA()
        }
    }
    
    
    func fetchQA() {
//                setData()
        
        FireStoreService().fetchData(collec: "iOS", doc: "UI") { qa in
            self.questionsToUI = qa.question
            self.answersToUI = qa.answer
        }
        
        FireStoreService().fetchData(collec: "iOS",doc: "iOS") { qa in
            self.questionsToiOS = qa.question
            self.answersToiOS = qa.answer
        }
        
        FireStoreService().fetchData(collec: "Swift",doc: "주요 문법") { qa in
            self.questionsToSwift = qa.question
            self.answersToSwift = qa.answer
        }
        
        FireStoreService().fetchData(collec: "Swift",doc: "RxSwift") { qa in
            self.questionsToRxSwift = qa.question
            self.answersToRxSwift = qa.answer
        }
        
        FireStoreService().fetchData(collec: "Etc",doc: "참조") { qa in
            self.questionsToReference = qa.question
            self.answersToReference = qa.answer
        }
        
        FireStoreService().fetchData(collec: "Etc",doc: "Functional Programming") { qa in
            self.questionsToFunctionalProgramming = qa.question
            self.answersToFunctionalProgramming = qa.answer
        }
        
        FireStoreService().fetchData(collec: "Etc",doc: "Architecture") { qa in
            self.questionsToArchitecture = qa.question
            self.answersToArchitecture = qa.answer
        }
        
        FireStoreService().fetchData(collec: "Etc",doc: "Release") { qa in
            self.questionsToRelease = qa.question
            self.answersToRelease = qa.answer
        }
        
        FireStoreService().fetchData(collec: "Etc",doc: "SwiftUI + Combine") { qa in
            self.questionsToSwiftUICombine = qa.question
            self.answersToSwiftUICombine = qa.answer
        }
        FireStoreService().fetchData(collec: "CS",doc: "공통") { qa in
            self.questionsToCSCommon = qa.question
            self.answersToCSCommon = qa.answer
        }
        
        FireStoreService().fetchData(collec: "CS",doc: "네트워크") { qa in
            self.questionsToNetwork = qa.question
            self.answersToNetwork = qa.answer
        }
        
        FireStoreService().fetchData(collec: "CS",doc: "자료구조") { qa in
            self.questionsToDataStructure = qa.question
            self.answersToDataStructure = qa.answer
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.isLoading = false
        }
        
    }
}


//func setData(){
//    let db = Firestore.firestore()
//
//}





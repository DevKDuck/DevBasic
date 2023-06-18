//
//  QAView.swift
//  DevBasic
//
//  Created by duck on 2023/06/18.
//

import SwiftUI
import Combine
import Firebase
import FirebaseFirestore


struct QAView: View{
    @ObservedObject var viewModel: QaListViewModel
    
    var body: some View{
        TabView{
            NavigationView{
                List{
                    Section(header: Text("UI관련")){
                        Text("H")
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
    }
}

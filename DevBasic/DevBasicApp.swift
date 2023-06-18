//
//  DevBasicApp.swift
//  DevBasic
//
//  Created by duck on 2023/06/07.
//

//import SwiftUI
//
//@main
//struct DevBasicApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}

import SwiftUI
import FirebaseCore
import FirebaseFirestore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct DevBasicApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    @StateObject var firestoreManager = FireStoreManager()
    let qA = QAList(question: [""], answer: [""])
    
//    let viewModel = QaListViewModel(qa: qA)
  var body: some Scene {
    WindowGroup {
      NavigationView {
//        ContentView()
//          QAView(viewModel: )
//              .environmentObject(firestoreManager)
          
      }
    }
  }
}

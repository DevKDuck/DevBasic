//
//  FirebaseManager.swift
//  DevBasic
//
//  Created by duck on 2023/06/07.
//

import Firebase

//class FireStoreManager: ObservableObject {
//    @Published var freeboardTitle: String = ""
//    @Published var freeboardNickName: String = ""
//
//    func fetchData() {
//        let db = Firestore.firestore()
//        let docRef = db.collection("freeboard").document("NDV8FGEUcp7mt5R892bM")
//        docRef.getDocument { (document, error) in
//            guard error == nil else {
//                print("error", error ?? "")
//                return
//            }
//
//            if let document = document, document.exists {
//                let data = document.data()
//                if let data = data {
//                    print("data", data)
//                    self.freeboardTitle = data["title"] as? String ?? ""
//                    self.freeboardNickName = data["nickname"] as? String ?? ""
//                }
//            }
//        }
//    }
//
//    init() {
//        fetchData()
//    }
//}

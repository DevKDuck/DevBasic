//
//  FirebaseManager.swift
//  DevBasic
//
//  Created by duck on 2023/06/07.
//

import SwiftUI
import Combine
import Firebase
import FirebaseFirestore


class FireStoreService{
    private let db = Firestore.firestore()
    
    func fetchData(collec: String, doc: String, completion: @escaping (QAList) -> Void) {
        db.collection(collec).document(doc).getDocument { (snapshot, error) in
            var qa = QAList(question: [""], answer: [""])
            
            if let data = snapshot?.data(){
                if let q = data["Question"] as? [String], let a = data["Answer"] as? [String]{
                    qa = QAList(question: q, answer: a)
                }
            }
            completion(qa)
        }
    }
}


class QaListViewModel: ObservableObject{
    @Published var qa: QAList
    
    init(qa: QAList) {
        self.qa = qa
    }
    
    var question: [String]{
        return qa.question
    }
    
    var answer: [String]{
        return qa.answer
    }
    
    
    func updateData(collec: String, doc: String, completion: @escaping (QAList) -> Void) {
        let db = Firestore.firestore()

        db.collection(collec).document(doc).getDocument { (snapshot, error) in

            if let data = snapshot?.data(){
                if let q = data["Question"] as? [String], let a = data["Answer"] as? [String]{
                    self.qa.question = q
                    self.qa.answer = a

                }
            }
            completion(self.qa)
        }
    }
    
}

        
    

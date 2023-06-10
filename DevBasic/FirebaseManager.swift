//
//  FirebaseManager.swift
//  DevBasic
//
//  Created by duck on 2023/06/07.
//

import Firebase
import FirebaseFirestore

class FireStoreService{
    private let db = Firestore.firestore()
    
    func fetchiOS_UI(completion: @escaping (QAList) -> Void) {
        db.collection("iOS").document("UI").getDocument { (snapshot, error) in
            var qa = QAList(question: [""], answer: [""])
            
            if let data = snapshot?.data(){
                if let q = data["Question"] as? [String], let a = data["Answer"] as? [String]{
                    qa = QAList(question: q, answer: a)
                }
            }
            completion(qa)
        }
    }
    
    
    func fetchiOS_iOS(completion: @escaping (QAList) -> Void) {
        db.collection("iOS").document("iOS").getDocument { (snapshot, error) in
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
        
        
        
        
//        db.collection("iOS").getDocuments { (snapshot, error) in
//            var qa = QAList(question: [""], answer: [""])
//
//            if let documetns = snapshot?.documents{
//                for documents in documetns{
//                    let data = documents.data()
//                    if let q = data["Question"] as? [String], let a = data["Answer"] as? [String]{
//                        qa = QAList(question: q, answer: a)
//                    }
//                }
//            }
//            completion(qa)
//        }
        
//    }
//}

//    func setData(){
//        let db = Firestore.firestore()
//        db.collection("iOS").document("UI").updateData(
//            ["Answer" : FieldValue.arrayUnion(
//                ["`Bounds`와 `Frame`은 iOS 개발에서 뷰의 크기와 위치를 나타내는 두 가지 속성입니다. 각각의 의미와 사용 방법은 다음과 같습니다:\n1. Bounds:\n - `Bounds`는 뷰의 로컬 좌표 시스템에서 사용되며, 뷰의 크기와 위치를 정의합니다.\n- `Bounds`는 해당 뷰의 내부 공간을 나타내며, 기본적으로 (0, 0) 좌표를 기준으로 상대적인 크기와 위치를 가지게 됩니다.\n- `Bounds`는 뷰의 자식 뷰의 배치와 레이아웃에 영향을 줍니다. 자식 뷰는 부모 뷰의 `Bounds` 내에서 위치와 크기를 결정합니다.\n- `Bounds`는 `CGRect` 타입으로 표현되며, `origin`과 `size` 속성을 사용하여 조작할 수 있습니다.\n\n\n2. Frame:\n- `Frame`은 뷰의 슈퍼뷰의 좌표 시스템에서 사용되며, 뷰의 절대적인 크기와 위치를 정의합니다.\n- `Frame`은 해당 뷰가 슈퍼뷰의 좌표 시스템에서 차지하는 영역을 나타냅니다.\n- `Frame`은 슈퍼뷰의 좌표 시스템을 기준으로 절대적인 크기와 위치를 가지며, 부모 뷰 내에서 정확한 위치를 지정합니다.\n- `Frame`은 `CGRect` 타입으로 표현되며, `origin`과 `size` 속성을 사용하여 조작할 수 있습니다.\n\n간단히 말하면, `Bounds`는 뷰 자체의 내부 공간을 나타내고, `Frame`은 부모 뷰의 좌표 시스템에서 뷰의 위치와 크기를 나타냅니다. 이 두 속성은 뷰의 레이아웃과 위치 조정을 위해 사용되며, 올바른 크기와 위치를 설정하여 UI를 구성하는 데 도움이 됩니다.",
//                 "`UIStackView`는 iOS 개발에서 사용되는 컨테이너 뷰로, 다른 뷰들을 수평 또는 수직으로 정렬하는 데 사용됩니다. `UIStackView`의 주요 장점은 다음과 같습니다:\n1. 간편한 레이아웃 관리: `UIStackView`는 내부의 뷰들을 자동으로 정렬해주기 때문에 수동으로 레이아웃을 관리하는 번거로움을 줄여줍니다. 뷰의 크기 조정, 위치 조정 등을 수행할 때 자동으로 갱신되므로 코드를 간결하게 유지할 수 있습니다.\n\n2. 유연한 정렬 옵션: `UIStackView`는 `alignment`, `distribution`, `spacing`과 같은 속성을 제공하여 뷰들을 유연하게 정렬할 수 있습니다. 예를 들어, 뷰들을 수평 정렬할 때 각 뷰의 크기를 일정하게 유지하거나, 뷰들 사이의 간격을 조정할 수 있습니다.\n\n3. 다양한 뷰 타입과의 호환성: `UIStackView`는 다양한 종류의 뷰와 함께 사용될 수 있습니다. `UILabel`, `UIButton`, `UIImageView`, `UITextField` 등 다른 뷰들을 `UIStackView`에 추가하여 유연하게 구성할 수 있습니다.\n\n4. 동적인 변경 지원: `UIStackView`는 런타임 시 동적인 변경을 쉽게 처리할 수 있습니다. 뷰의 추가, 제거, 숨김 처리 등을 통해 동적인 UI 변화를 구현할 수 있습니다.\n\n5. Auto Layout과의 통합: `UIStackView`는 Auto Layout 시스템과 통합되어 사용될 수 있습니다. Auto Layout을 사용하여 `UIStackView`의 크기와 위치를 정의할 수 있으며, `UIStackView` 내부의 뷰들도 Auto Layout을 활용하여 더 복잡한 레이아웃을 구성할 수 있습니다.\n\n`UIStackView`는 인터페이스 구성 요소를 간단하게 정렬하고 관리하는 데 매우 유용한 도구입니다. 코드의 가독성을 높이고 레이아웃 작업을 간소화하기 위해 `UIStackView`를 활용하는 것이 좋습니다.",
//                 "Autolayout Constraint의 Priority(우선순위)는 뷰의 레이아웃을 관리하는 동안 제약 조건의 중요도를 지정하는 데 사용됩니다. Priority는 다음과 같은 몇 가지 중요한 역할을 합니다:\n\n1. 제약 충돌 해결: 여러 개의 제약 조건이 서로 충돌할 때, Priority를 사용하여 충돌을 해결할 수 있습니다. 낮은 Priority를 가진 제약 조건은 고정적인 제약을 나타내는 반면, 높은 Priority를 가진 제약 조건은 유연하고 우선적인 제약을 나타냅니다. 시스템은 Priority를 고려하여 제약 충돌을 해결하고 최적의 레이아웃을 구성합니다.\n\n2. 동적 레이아웃 조정: Priority를 조정함으로써 동적으로 뷰의 레이아웃을 조정할 수 있습니다. 예를 들어, Priority를 낮게 설정한 제약 조건은 일시적으로 무시되거나 덜 적용되므로, 다른 제약 조건에 우선시될 수 있습니다. 이를 통해 특정 조건에 따라 뷰의 크기, 위치, 간격 등을 동적으로 조정할 수 있습니다.\n\n3. 유연한 레이아웃 구성: Priority를 다양하게 조정함으로써 유연하고 다양한 레이아웃 구성을 할 수 있습니다. 제약 조건의 Priority를 조절하여 뷰의 크기, 위치, 우선순위 등을 제어할 수 있습니다. 이를 통해 다양한 디바이스 크기, 오리엔테이션 등에 유연하게 대응할 수 있습니다.\n\nAutolayout Constraint의 Priority는 1부터 1000까지의 범위를 가집니다. 1000은 필수적인 제약을 나타내는 최고 우선순위이며, 1은 최저 우선순위를 나타냅니다. 기본적으로 Priority는 1000으로 설정되며, 필요에 따라 낮은 우선순위로 조정할 수 있습니다.\n\nPriority는 Interface Builder에서도 조정할 수 있으며, 코드로도 설정 가능합니다. `NSLayoutConstraint` 클래스의 `priority` 속성을 통해 Priority 값을 설정할 수 있습니다.\n\nPriority를 올바르게 설정하면 뷰의 레이아웃을 유연하게 조정하고, 제약 충돌을 효과적으로 해결할 수 있습니다.",
//                 "UITableView의 각 셀의 높이를 설정하는 방법은 다음과 같습니다:\n\n1. UITableViewDelegate 프로토콜을 채택하여 사용자 정의 높이를 설정할 수 있습니다. `tableView(_:heightForRowAt:)` 메서드를 구현하여 각 행(셀)의 높이를 반환합니다. 이 메서드는 특정 행의 높이를 동적으로 지정할 수 있습니다. 예를 들어, 행의 인덱스 또는 특정 데이터에 따라 높이를 다르게 설정할 수 있습니다.\n\n2. UITableViewAutomaticDimension과 함께 UITableView의 rowHeight 속성을 설정하여 자동으로 셀 높이를 조정할 수도 있습니다. 이 경우, UITableView에 있는 셀의 높이는 콘텐츠에 맞게 자동으로 조정됩니다. 자동으로 조정하려면 다음과 같이 속성을 설정합니다:\n\n그리고 각 셀의 레이아웃을 올바르게 설정해야 합니다. 셀 내부의 콘텐츠들이 올바르게 제약 조건을 가지고 있어야 자동 높이 조정이 제대로 작동합니다. 즉, 셀 내부의 뷰들에 대한 Top, Bottom, Leading, Trailing의 제약 조건을 올바르게 설정해야 합니다. 또한, 셀의 contentView의 Autoresizing Mask를 유연하게 설정해야 합니다.\n\n위의 방법 중 하나를 선택하여 UITableView의 각 셀의 높이를 설정할 수 있습니다. 동적인 높이를 설정하려면 UITableViewDelegate의 메서드를 사용하거나 자동으로 조정하려면 UITableView의 rowHeight 속성을 사용하는 것이 일반적인 방법입니다.",
//                 "`Left Constraint`와 `Leading Constraint`은 Auto Layout에서 뷰의 가로 방향(수평) 위치를 지정하는 제약 조건입니다. 하지만 두 제약 조건에는 약간의 차이점이 있습니다:\n\n1. Left Constraint:\n- `Left Constraint`는 뷰의 가로 방향 위치를 지정할 때, 왼쪽 여백(leading margin)을 기준으로 합니다.\n- 왼쪽 여백은 뷰의 좌측 가장자리와 슈퍼뷰의 좌측 가장자리 사이의 거리를 나타냅니다.\n\n- 기본적으로 `Left Constraint`는 왼쪽을 기준으로 하기 때문에, 왼쪽에서 오른쪽으로 정렬된 언어(영어, 한국어 등)의 레이아웃에 주로 사용됩니다.\n\n2. Leading Constraint:\n- `Leading Constraint`는 뷰의 가로 방향 위치를 지정할 때, 앞부분(leading edge)을 기준으로 합니다.\n- 앞부분은 뷰의 주된 콘텐츠가 시작되는 가장자리를 나타냅니다. 기본적으로 왼쪽 가장자리와 동일한 위치입니다.\n- `Leading Constraint`는 주로 왼쪽에서 오른쪽이 아닌, 오른쪽에서 왼쪽으로 정렬된 언어(아랍어, 히브리어 등)의 레이아웃에 사용됩니다.\n\n                 주의해야 할 점은 `Left Constraint`와 `Leading Constraint`는 다양한 상황에서 유연하게 사용될 수 있지만, 정확한 결과를 얻기 위해서는 레이아웃에 영향을 주는 다른 제약 조건과 함께 고려되어야 합니다. 뷰의 방향성, 언어 설정 등을 고려하여 올바른 제약 조건을 선택하여 사용해야 합니다."
//                ])])


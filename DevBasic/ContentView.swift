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
    
    @State private var questionsToUI: [String] = [""]
    @State private var answersToUI: [String] = [""]
    @State private var questionsToiOS: [String] = [""]
    @State private var answersToiOS: [String] = [""]
    @State private var questionsToSwift: [String] = [""]
    @State private var answersToSwift: [String] = [""]

    
    @State private var selectedRow: Int? = nil
    
    var body: some View {
        
        TabView{
            NavigationView{
                List{
                    Section(header: Text("UI관련")){
                        
                        ForEach(questionsToUI.indices, id:\.self){ index in
                            NavigationLink(destination: Text(answersToUI[index]), tag: index, selection: $selectedRow){
                                Text(questionsToUI[index])
                                
                            }
                        }
                    }
                    Section(header: Text("iOS")){
                        ForEach(questionsToiOS.indices, id:\.self){ index in
                            NavigationLink(destination: Text(answersToiOS[index]), tag: index, selection: $selectedRow){
                                Text(questionsToiOS[index])
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
            NavigationView{
                List{
                    Section(header: Text("Swift")){
                        ForEach(questionsToSwift.indices, id:\.self){ index in
                            NavigationLink(destination: Text(answersToSwift[index]), tag: index, selection: $selectedRow){
                                Text(questionsToSwift[index])
                                
                            }
                        }
                    }
                    
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("Swift")
                .onAppear {
//                    fetchQA()
                }
            }
            .tabItem{
                Image(systemName: "swift")
                Text("Swift")
            }
            
            NavigationView{
                List{
                    Section(header: Text("Computer Science")){
                        
                    }
                    .listStyle(GroupedListStyle())
                    .navigationBarTitle("Computer Science")
                    .onAppear{
                        
                    }
                }
            }
            .tabItem{
                Image(systemName: "desktopcomputer")
                Text("Computer Science")
            }
            
            NavigationView{
                List{
                    Section(header: Text("SwiftUI")){
                        
                    }
                    .listStyle(GroupedListStyle())
                    .navigationBarTitle("SwiftUI")
                    .onAppear{
                        
                    }
                }
            }
            .tabItem{
                Image(systemName: "swift")
                Text("SwiftUI")
            }

        }
    }
    
    func fetchQA() {
//        setData()
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
    }
}



func setData(){
    let db = Firestore.firestore()
    db.collection("Swift").document("주요 문법").setData(
        ["Question" : FieldValue.arrayUnion(
            [
             "Struct(구조체)란?",
             "Class(클래스)란?",
             "Enum(열거형)이란?",
             "Generic(제네릭)이란?",
             "Closure(클로저)란?",
             "Escaping Closure란?",
             "Optional(옵셔널)이란?",
             "property wrapper란?",
             "접근 제어자란?",
             "Extension이란?",
             "mutating이란?",
             "Protocol이란?",
             "Codable이란?",
             "DelegatePattern이란?"
            ]),
         "Answer" : FieldValue.arrayUnion(
            [
                "iOS에서 Struct는 값 타입(value type)으로서 사용되는 데이터 구조입니다. Struct는 여러 속성(properties)과 메서드(methods)를 가지며, 연관된 데이터를 그룹화하여 표현하는 데 사용됩니다. Struct는 클래스(class)와 유사한 기능을 제공하지만, 차이점도 있습니다.\n\n Struct의 주요 특징과 역할은 다음과 같습니다:\n\n 1. 값 타입: Struct는 값 타입으로서 동작합니다. 이는 Struct 인스턴스가 할당된 변수 또는 상수에는 해당 Struct의 복사본이 저장되며, 서로 독립적으로 동작합니다. 값 타입의 인스턴스는 스택에 저장되기 때문에 복사되고 전달되는 방식이 기본적으로 값에 의한 복사(pass-by-value)입니다.\n\n 2. 데이터 그룹화: Struct는 연관된 데이터를 그룹화하여 표현하는 데 사용됩니다. 예를 들어, 사용자 정보를 담고 있는 구조체인 User를 만들어서 사용자의 이름, 나이, 이메일 등의 속성을 함께 저장할 수 있습니다. 이를 통해 코드의 가독성과 유지 보수성을 향상시킬 수 있습니다.\n\n 3. 속성과 메서드: Struct는 속성과 메서드를 가질 수 있습니다. 속성은 Struct의 상태를 나타내는 값이며, 메서드는 Struct에 적용되는 동작을 정의합니다. 예를 들어, User Struct에서는 name 속성과 introduce() 메서드를 정의하여 사용자의 이름과 소개글을 출력할 수 있습니다.\n\n 4. 초기화: Struct는 초기화(init) 메서드를 사용하여 인스턴스를 생성하고 초기 상태를 설정할 수 있습니다. 초기화 메서드를 정의하고 호출하여 Struct의 속성을 초기화할 수 있습니다.\n\n 5. 상속 불가능: Struct는 상속을 지원하지 않습니다. 클래스와 달리 다른 Struct나 클래스를 상속할 수 없습니다. 이는 Struct가 값 타입이기 때문에 복잡한 상속 계층 구조를 피하고 간단하고 독립적인 구조를 유지할 수 있도록 합니다.\n\n Struct는 간단한 데이터 구조를 표현하고자 할 때 주로 사용됩니다. 예를 들어, 위치 정보, 시간 정보, 색상 정보 등을 담는 Struct를 정의하여 활용할 수 있습니다. 값 타입으로서의 특성과 독립적인 구조를 가지므로 코드의 안정성과 성능을 개선할 수 있습니다.",
                
                "iOS에서 Class는 참조 타입(reference type)으로서 사용되는 객체 지향 프로그래밍의 핵심 요소입니다. Class는 속성(properties)과 메서드(methods)로 구성된 데이터 타입으로, 객체를 생성하고 사용하기 위한 청사진(blueprint) 역할을 합니다.\n\n iOS에서 Class의 주요 특징과 역할은 다음과 같습니다: \n\n 1. 참조 타입: Class는 참조 타입으로 동작합니다. 이는 Class 인스턴스가 변수나 상수에 할당될 때, 해당 인스턴스의 참조가 저장되고 공유됩니다. 따라서 여러 변수가 동일한 Class 인스턴스를 참조할 수 있으며, 하나의 인스턴스 변경이 다른 변수에 영향을 줄 수 있습니다.\n\n 2. 객체 생성과 초기화: Class는 객체(Object)를 생성하고 초기화하는 기능을 제공합니다. 객체는 Class의 인스턴스로, 객체는 Class의 청사진에 따라 생성되며 데이터를 가지고 특정 동작을 수행할 수 있습니다. 객체를 생성하고 초기화하기 위해 초기화 메서드(init)를 사용할 수 있습니다.\n\n 3. 상속과 다형성: Class는 상속과 다형성 개념을 지원합니다. 다른 Class로부터 상속받을 수 있으며, 부모 Class의 속성과 메서드를 상속받아 재정의(override)하거나 확장할 수 있습니다. 또한, 부모 Class 타입으로 선언된 변수나 매개변수에 자식 Class의 인스턴스를 할당하여 다형성을 구현할 수 있습니다.\n\n 4. 속성과 메서드: Class는 속성과 메서드를 가질 수 있습니다. 속성은 Class의 상태를 나타내는 값이며, 메서드는 Class에 적용되는 동작을 정의합니다. 속성은 인스턴스 속성과 타입 속성으로 구분되며, 메서드는 인스턴스 메서드와 타입 메서드로 구분됩니다.\n\n 5. 메모리 관리: Class는 ARC(Automatic Reference Counting)에 의해 메모리 관리됩니다. ARC는 객체의 참조 카운트를 추적하여 해당 객체를 사용하는 모든 변수와 상수가 없어지면 자동으로 메모리에서 해제합니다. 참조 사이클(reference cycle)을 방지하기 위해 약한 참조(weak reference)와 같은 메모리 관리 기법을 활용할 수 있습니다.\n\n Class는 iOS 앱 개발에서 주로 사용되는 객체 지향 프로그래밍의 핵심 요소입니다. 다양한 기능을 가진 객체를 생성하고 관리하며, 상속과 다형성을 통해 코드 재사용과 유연성을 높일 수 있습니다.",
                
                "iOS에서 Enum은 열거형(Enumeration)으로서 사용되는 데이터 타입입니다. Enum은 서로 관련된 값들의 집합을 정의하고, 이를 사용하여 코드를 더 명확하고 안전하게 작성할 수 있도록 도와줍니다.\n\n iOS에서 Enum의 주요 특징과 역할은 다음과 같습니다:\n\n 1. 관련된 값의 그룹화: Enum은 관련된 값들을 그룹화하여 정의하는데 사용됩니다. 예를 들어, 앱에서 요일을 다루기 위해 Weekday Enum을 정의할 수 있습니다. 이 Enum은 월요일, 화요일, 수요일 등과 같은 요일을 나타내는 값을 정의하고, 코드에서 요일을 표현할 때 Enum 값을 사용할 수 있습니다.\n\n 2. 값의 타입 안정성: Enum은 값의 타입 안정성을 제공합니다. Enum은 정의된 값 이외의 다른 값이 사용되지 않도록 강제합니다. 컴파일러가 Enum의 값을 검사하고, 올바른 Enum 값이 사용되었는지 확인하여 프로그램의 안정성을 높일 수 있습니다.\n\n 3. 패턴 매칭: Enum은 패턴 매칭(pattern matching)과 함께 사용될 수 있습니다. 패턴 매칭은 Enum의 값에 따라 다른 동작을 수행할 수 있는 강력한 기능입니다. 예를 들어, Switch 문을 사용하여 Enum 값에 따라 다른 코드 블록을 실행할 수 있습니다.\n\n 4. 연관 값: Enum은 각 케이스(case)에 연관 값을 가질 수 있습니다. 이는 Enum의 각 케이스에 추가 정보를 담을 수 있어 더 유연한 데이터 표현을 가능하게 합니다. 예를 들어, HTTP 응답을 나타내는 Enum에는 상태 코드와 함께 추가적인 정보(메시지 등)를 저장할 수 있습니다.\n\n 5. 다른 타입과의 연동: Enum은 다른 타입과의 연동에 사용될 수 있습니다. Enum 값은 함수의 매개변수, 리턴 값, 속성의 타입으로 사용될 수 있습니다. 이를 통해 코드의 가독성을 높이고 일관성 있는 인터페이스를 구현할 수 있습니다.\n\n Enum은 iOS 앱 개발에서 코드의 가독성과 안정성을 향상시키는 데 도움을 주는 중요한 요소입니다. 다양한 값의 그룹화와 패턴 매칭을 통해 코드를 더 명확하게 작성하고, 예상치 못한 값의 사용을 방지하여 프로그램의 안정성을 높일 수 있습니다.",
                
                "iOS에서 Generic은 타입 매개변수(Type Parameter)를 사용하여 재사용 가능한 코드를 작성하는 기능입니다. Generic은 다양한 타입에 대해 일반화된 알고리즘, 데이터 구조, 함수 등을 작성할 수 있게 해줍니다.\n\n iOS에서 Generic의 주요 특징과 활용 방법은 다음과 같습니다:\n\n 1. 타입 일반화: Generic을 사용하면 특정한 타입에 종속되지 않고 일반화된 코드를 작성할 수 있습니다. 코드에서 사용될 타입을 타입 매개변수로 대체하여, 여러 다른 타입에 대해 동일한 로직을 재사용할 수 있습니다.\n\n 2. 재사용성과 유연성: Generic은 재사용 가능한 코드를 작성하는 데 큰 도움을 줍니다. 동일한 로직을 다양한 타입에 대해 사용할 수 있으므로, 코드의 중복을 줄이고 유지보수성을 향상시킵니다. 또한, Generic을 통해 유연한 데이터 구조와 알고리즘을 구현할 수 있습니다.\n\n 3. 컬렉션과 데이터 구조: iOS에서는 Generic을 활용하여 다양한 컬렉션 타입인 Array, Dictionary, Set 등을 구현하고 사용합니다. Generic을 사용하면 컬렉션에 저장되는 요소의 타입을 유연하게 지정할 수 있으며, 타입 안전성을 보장합니다.\n\n 4. 함수와 메서드: Generic은 함수와 메서드에서도 활용됩니다. Generic 함수를 작성하면 다양한 타입의 입력에 대해 동일한 로직을 적용할 수 있습니다. 또한, 제네릭 메서드를 사용하여 타입 안전한 동작을 보장하고 다형성을 활용할 수 있습니다.\n\n 5. 타입 제약과 프로토콜: Generic을 사용할 때, 타입에 대한 제약(Constraints)을 설정할 수 있습니다. 타입 제약을 통해 특정 프로토콜을 준수하는 타입에 대해서만 Generic 코드를 작성하거나, 특정 타입 클래스를 상속받은 타입에 대해서만 Generic 코드를 작성할 수 있습니다.\n\n Generic은 iOS 앱 개발에서 코드 재사용성과 유연성을 높이는 데 중요한 도구입니다. 타입 일반화를 통해 일반적인 알고리즘, 데이터 구조, 함수 등을 작성하고, 다양한 타입에 대해 동일한 로직을 적용할 수 있습니다. 이를 통해 생산성을 향상시키고 안정성을 유지할 수 있습니다.",
                
                "iOS에서 Closure은 일급 객체로서 독립적인 코드 블록이며, 변수나 상수에 할당하거나 함수의 매개변수로 전달할 수 있는 기능입니다. Closure은 함수와 유사한 특성을 가지며, 코드를 캡슐화하고 전달할 수 있는 강력한 기능을 제공합니다.\n\n iOS에서 Closure의 주요 특징과 활용 방법은 다음과 같습니다:\n\n 1. 코드 블록: Closure은 중괄호 `{}`로 둘러싸인 코드 블록입니다. Closure 내부에는 실행될 코드와 해당 코드에서 사용되는 변수나 상수가 포함됩니다. Closure은 코드의 일부를 캡슐화하여 독립적으로 사용할 수 있도록 합니다.\n\n 2. 독립성: Closure은 독립적인 기능을 수행할 수 있습니다. Closure은 자체적으로 변수나 상수를 캡처하고 저장할 수 있으며, 함수와 마찬가지로 매개변수를 가질 수 있습니다. 이를 통해 Closure은 다른 코드에서 독립적으로 실행될 수 있으며, 필요한 데이터를 전달받을 수 있습니다.\n\n 3. Capture Values: Closure은 주변 범위에서 변수나 상수를 캡처(Capture)할 수 있습니다. 캡처된 값은 Closure 내부에서 사용될 수 있으며, Closure을 정의하는 시점의 값과 동일한 값으로 유지됩니다. 이를 통해 Closure은 외부 변수에 접근하여 데이터를 유지하거나 수정할 수 있습니다.\n\n 4. 함수 전달과 반환: Closure은 함수의 매개변수로 전달되거나, 함수의 반환 값으로 사용될 수 있습니다. 이를 통해 함수의 동작을 동적으로 변경하거나, 비동기 작업의 완료 핸들러로 사용할 수 있습니다.\n\n 5. Trailing Closure: Closure은 함수의 마지막 인자로 사용될 때, Trailing Closure 문법을 사용하여 더 간결하게 표현할 수 있습니다. Trailing Closure 문법은 함수 호출 괄호 외부에 Closure을 작성하여 가독성을 높이고 코드의 구조를 명확하게 할 수 있습니다.\n\n Closure은 iOS 앱 개발에서 다양한 상황에서 활용됩니다. 비동기 작업의 완료 핸들링, 정렬 기준의 지정, 반복 작업의 정의 등 다양한 용도로 사용될 수 있습니다. Closure을 효과적으로 활용하면 코드의 가독성을 높이고 유연한 동작을 구현할 수 있습니다.",
                
                "Escaping Closure(탈출 클로저)은 iOS에서 사용되는 클로저 중 하나의 종류입니다. 탈출 클로저는 함수의 실행이 완료된 후에도 여전히 사용될 수 있는 클로저를 말합니다.\n\n 일반적으로 함수 내부에서 정의한 클로저는 함수의 범위를 벗어나면 자동으로 해제됩니다. 하지만, 탈출 클로저는 함수의 범위를 벗어난 후에도 사용될 수 있으며, 다른 코드 블록에서 저장하거나 외부에 전달될 수 있습니다.\n\n 주로 비동기적인 작업이나 클로저를 파라미터로 받는 함수 내에서 사용됩니다. 탈출 클로저를 사용하면 비동기 작업의 완료 핸들러나 비동기 API의 콜백으로 클로저를 전달할 수 있습니다. 이렇게 전달된 클로저는 비동기 작업이 완료된 후 실행되며, 함수의 범위를 벗어나도 실행될 수 있습니다.\n\n 탈출 클로저를 정의할 때에는 클로저 매개변수 앞에 `@escaping` 키워드를 붙여야 합니다. 이는 클로저가 탈출 클로저임을 명시적으로 나타내는 역할을 합니다. 또한, 탈출 클로저 내부에서 self를 명시적으로 캡처해야 합니다.\n\n 탈출 클로저를 사용하면 비동기 작업의 완료를 쉽게 처리하거나, 비동기 API와의 상호작용을 할 수 있습니다.",
                
                "iOS에서 Optional은 값이 존재할 수도 있고, 존재하지 않을 수도 있는 상황을 처리하기 위한 개념입니다. Optional은 Swift 언어의 핵심적인 기능 중 하나이며, Objective-C보다 안전한 코드를 작성하는 데 도움을 줍니다.\n\n Optional은 다음과 같은 특징을 가지고 있습니다:\n\n 1. 값의 존재 여부 표현: Optional은 값이 존재할 수도 있고, 존재하지 않을 수도 있는 상황을 표현합니다. 이는 nil 값을 가질 수 있는 특별한 타입입니다. Optional 타입으로 선언된 변수나 상수에는 실제 값이 저장되어 있을 수도 있고, nil이 저장되어 있을 수도 있습니다.\n\n 2. 안전한 코드 작성: Optional은 값의 존재 여부를 명시적으로 처리함으로써 코드의 안전성을 높입니다. 값이 항상 존재한다는 확신이 없는 경우, Optional 타입을 사용하여 값의 유무를 명시적으로 다룰 수 있습니다. 이를 통해 nil 값을 다룰 때 발생하는 예기치 않은 오류를 방지할 수 있습니다.\n\n 3. 옵셔널 체이닝: Optional은 옵셔널 체이닝(Optional Chaining)이라는 특별한 문법을 통해 값을 안전하게 접근할 수 있도록 합니다. 옵셔널 체이닝을 사용하면 값이 존재하지 않는 경우에도 코드가 중단되지 않고 계속 실행될 수 있습니다.\n\n 4. 강제 해제: Optional은 필요한 경우에만 값을 강제로 해제할 수 있습니다. 이는 값이 존재할 것임을 확신할 때 사용되며, 강제 해제 연산자(!)를 사용하여 Optional 값을 일반 타입으로 변환할 수 있습니다. 하지만 값이 nil인 상태에서 강제 해제하면 런타임 오류가 발생할 수 있으므로 주의가 필요합니다.\n\n Optional은 iOS 앱 개발에서 많은 부분에서 사용됩니다. 주로 옵셔널 타입을 사용하여 API 호출의 반환값, 사용자 입력 처리, 네트워킹 작업, 파일 조작 등에서 nil 값을 다룰 수 있습니다. Optional을 올바르게 사용하면 코드의 안전성을 높이고 예기치 않은 오류를 방지할 수 있습니다.",
                
                "Property Wrapper(속성 래퍼)는 Swift 5.1부터 도입된 기능으로, 속성에 캡슐화된 추가 동작을 제공하고, 코드의 재사용성과 가독성을 향상시키는 역할을 합니다. Property Wrapper는 속성을 감싸고 해당 속성에 대한 접근, 할당, 초기화 등의 동작을 수정하는 래퍼(Wrapper)로 사용됩니다.\n\n Property Wrapper를 사용하면 코드 중복을 줄이고 일관성 있는 동작을 캡슐화할 수 있습니다. 일반적으로는 getter, setter, 초기화 로직을 재사용하거나, 속성에 대한 값 검증, 로깅, 캐싱 등의 추가 동작을 수행할 수 있습니다.\n\n Property Wrapper를 사용하기 위해서는 `@propertyWrapper` 키워드를 사용하여 래퍼를 정의해야 합니다. 래퍼는 값의 저장, 반환, 할당을 위해 `wrappedValue`라는 프로퍼티를 가지며, 이를 통해 실제 값을 저장하고 제어합니다. 또한, 필요에 따라 `getter` 및 `setter` 메서드를 정의하여 값을 가져오거나 설정할 때 추가 동작을 수행할 수도 있습니다.\n\n Property Wrapper를 사용하면 속성의 동작을 캡슐화하고 재사용할 수 있습니다. 이를 통해 코드의 가독성과 유지보수성을 향상시킬 수 있으며, 일관성 있는 동작을 제공할 수 있습니다.",
                
                "iOS에서 접근 제어자(Access Modifiers)는 클래스, 구조체, 열거형, 프로토콜 등의 멤버에 대한 접근 범위와 가시성을 제어하는 기능입니다. 접근 제어자를 사용하여 속성이나 메서드의 접근 범위를 설정하면, 해당 멤버에 접근할 수 있는 범위가 제한됩니다. 이는 코드의 캡슐화, 모듈화, 보안 및 안정성을 강화하는 데 도움을 줍니다.\n\n iOS에서 사용되는 주요 접근 제어자에는 다음과 같은 종류가 있습니다:\n\n 1. `public`: 가장 넓은 접근 범위를 가지는 제어자로, 어떤 모듈에서도 접근 가능합니다. 다른 모듈에서도 사용 가능하며, 공개적인 API로 사용되는 경우에 주로 활용됩니다.\n\n 2. `internal`: 기본적으로 접근 제어자를 명시하지 않으면 `internal`로 간주됩니다. 같은 모듈 내에서는 어떤 멤버에 대해서도 접근 가능합니다. 하지만 다른 모듈에서는 접근할 수 없습니다. 앱의 내부에서 사용되는 일반적인 접근 제어자입니다.\n\n 3. `fileprivate`: 같은 소스 파일 내에서만 접근 가능합니다. 클래스 내의 모든 멤버에서 접근할 수 있습니다. 다른 소스 파일에서는 접근할 수 없습니다. 주로 하나의 파일에서 내부 구현을 캡슐화하는 데 사용됩니다.\n\n 4. `private`: 가장 제한적인 접근 범위를 가지는 제어자로, 해당 멤버를 선언한 범위 내에서만 접근 가능합니다. 클래스 내부에서만 접근할 수 있으며, 상속된 하위 클래스에서도 접근할 수 없습니다. 주로 내부 구현의 상세한 세부 사항을 캡슐화하는 데 사용됩니다.\n\n 이러한 접근 제어자를 사용하여 코드의 가시성을 제한하고 적절한 캡슐화를 수행할 수 있습니다. 모듈 간의 의존성을 관리하고, 외부에 노출되는 API를 명확하게 정의함으로써 안정성과 유지보수성을 향상시킬 수 있습니다. 주로 공개 API와 내부 구현 사이의 구분을 명확히 하고, 의도하지 않은 접근을 방지하기 위해 사용됩니다.",
                
                "iOS에서 Extension(확장)은 기존 클래스, 구조체, 열거형, 프로토콜 등의 기능을 확장하고 추가할 수 있는 기능입니다. Extension을 사용하면 기존 타입에 대해 새로운 속성, 메서드, 초기화 구문 등을 추가하거나 기존 기능을 수정할 수 있습니다. 이를 통해 기존 코드를 수정하지 않고도 기능을 확장하고 개선할 수 있습니다.\n\n Extension을 사용하는 몇 가지 주요한 용도는 다음과 같습니다:\n\n 1. 새로운 기능 추가: Extension을 사용하여 기존 타입에 새로운 속성, 메서드, 서브스크립트 등을 추가할 수 있습니다. 이를 통해 기능을 확장하거나 타입에 특화된 동작을 정의할 수 있습니다.\n\n 2. 프로토콜 적용: Extension을 사용하여 기존 타입에 프로토콜을 적용할 수 있습니다. 이를 통해 기존 타입을 특정 프로토콜을 준수하는 타입으로 확장할 수 있습니다.\n\n 3. 계산된 속성 추가: Extension을 사용하여 기존 타입에 계산된 속성을 추가할 수 있습니다. 이를 통해 기존 속성의 값을 동적으로 계산하거나 연산할 수 있습니다.\n\n 4. 초기화 구문 추가: Extension을 사용하여 기존 타입에 초기화 구문을 추가할 수 있습니다. 이를 통해 편리한 초기화 방법을 제공하거나 기존 초기화 방법을 확장할 수 있습니다.\n\n Extension을 사용하여 기존 타입을 확장하면 코드의 가독성과 재사용성을 향상시킬 수 있습니다. 기능을 분리하고 캡슐화함으로써 코드의 모듈성을 높이고, 기능의 추가 또는 수정에 있어서도 기존 코드를 건드리지 않고 확장할 수 있습니다. Extension은 Swift 언어의 강력한 기능 중 하나이며, iOS 앱 개발에서 널리 사용됩니다.",
                
                "iOS에서 `mutating`은 구조체(Struct)나 열거형(Enum) 내부에서 메서드가 자신의 속성을 수정할 수 있음을 나타내는 키워드입니다. 기본적으로 구조체와 열거형은 값 타입(Value Type)이므로 해당 인스턴스 내부의 속성을 변경하기 위해서는 `mutating` 키워드를 사용해야 합니다. 클래스(Class)는 참조 타입(Reference Type)이므로 메서드 내에서 속성을 변경할 수 있으므로 `mutating` 키워드를 사용할 필요가 없습니다.\n\n `mutating` 키워드를 사용하여 정의된 메서드는 구조체나 열거형 내부에서 호출될 때 자신의 속성을 수정할 수 있습니다. 이렇게 속성을 수정하는 메서드를 구조체나 열거형 내부에서 사용하려면 해당 메서드의 정의 앞에 `mutating` 키워드를 붙여야 합니다.\n\n `mutating` 키워드를 사용함으로써 값 타입인 구조체나 열거형 내에서도 속성을 변경할 수 있으며, 이를 통해 메서드를 호출하는 코드에서 인스턴스의 속성을 수정할 수 있게 됩니다. 주의할 점은 `mutating` 키워드는 값을 수정하는 메서드에서만 사용할 수 있다는 점입니다. 일반적인 읽기 전용 메서드에서는 `mutating` 키워드를 사용할 필요가 없습니다.",
                
                "iOS에서 Protocol(프로토콜)은 특정 작업 또는 기능을 정의한 추상적인 요구사항의 집합입니다. 프로토콜은 메서드, 속성, 초기화 구문 등의 요구사항을 명시하며, 이를 채택한 클래스, 구조체, 열거형 등은 프로토콜의 요구사항을 구현할 수 있습니다. 프로토콜은 Swift에서 코드의 재사용성과 유연성을 높이기 위한 중요한 개념입니다.\n\n 프로토콜은 다음과 같은 특징을 가지고 있습니다:\n\n 1. 요구사항 정의: 프로토콜은 특정 작업 또는 기능을 위한 메서드, 속성, 초기화 구문 등을 요구사항으로 정의합니다. 프로토콜에서 정의한 요구사항은 해당 프로토콜을 채택한 타입에서 구현되어야 합니다.\n\n 2. 다중 프로토콜 채택: 하나의 타입은 여러 프로토콜을 동시에 채택할 수 있습니다. 이를 통해 다양한 프로토콜의 요구사항을 충족시킬 수 있으며, 유연하고 모듈화된 코드를 작성할 수 있습니다.\n\n 3. 프로토콜 상속: 프로토콜은 다른 프로토콜을 상속할 수 있습니다. 상속을 통해 다른 프로토콜의 요구사항을 상속받아 확장하거나 조합할 수 있습니다.\n\n 4. 프로토콜 준수: 클래스, 구조체, 열거형 등의 타입은 프로토콜을 채택하여 프로토콜의 요구사항을 구현할 수 있습니다. 프로토콜을 준수하는 타입은 해당 프로토콜의 요구사항을 구현해야 하며, 이를 통해 코드의 일관성과 재사용성을 유지할 수 있습니다.\n\n 프로토콜은 다형성(Polymorphism)을 구현하고 코드의 추상화를 증진시키는 데 주로 사용됩니다. 프로토콜을 활용하면 유사한 동작을 가진 객체들을 일관성 있게 다룰 수 있으며, 다른 객체들과의 상호작용을 가능하게 합니다. 또한, 프로토콜은 의존성 주입(Dependency Injection)과 같은 패턴을 구현할 때도 사용됩니다. iOS 앱 개발에서 프로토콜은 주로 뷰 컨트롤러, 뷰, 네트워크 통신, 데이터 모델 등에서 활용되며, 코드의 재사용성과 유지보수성을 향상시키는 데 도움을 줍니다.",
                
                "iOS에서 Codable은 Swift의 프로토콜(protocol)로, 데이터의 인코딩(Encoding)과 디코딩(Decoding)을 지원하는 기능을 제공합니다. Codable은 JSON, Property List, XML 등과 같은 다양한 데이터 형식 간의 변환을 간편하게 처리할 수 있도록 도와줍니다.\n\n Codable 프로토콜을 채택한 타입은 인코딩(Encoding)과 디코딩(Decoding)을 위한 프로퍼티(property)나 키(key)와 값을 매핑(mapping)하는 기능을 제공해야 합니다. 일반적으로 Codable을 사용하여 데이터를 처리하려면 다음과 같은 단계를 따릅니다:\n\n 1. Codable을 채택한 데이터 타입 정의: Codable을 채택한 구조체(struct)나 클래스(class)를 정의합니다. 이 데이터 타입은 인코딩과 디코딩이 필요한 속성을 포함해야 합니다.\n\n 2. 인코딩(Encoding): Codable을 준수하는 데이터 타입의 인스턴스를 JSON, Property List 등의 데이터 형식으로 인코딩합니다.\n\n 3. 디코딩(Decoding): JSON, Property List 등의 데이터를 Codable을 준수하는 데이터 타입으로 디코딩합니다.\n\n Codable은 JSONEncoder와 JSONDecoder, PropertyListEncoder와 PropertyListDecoder와 같은 인코딩 및 디코딩을 처리하는 클래스와 함께 자주 사용됩니다. 이들 클래스는 데이터를 인코딩 및 디코딩하는 데 필요한 다양한 설정 옵션을 제공합니다.\n\n Codable을 사용하면 데이터를 간단하고 일관성 있게 인코딩 및 디코딩할 수 있으며, iOS 앱 개발에서 네트워크 통신, 데이터 저장 및 관리, API와의 상호작용 등 다양한 시나리오에서 유용하게 활용됩니다.",
                
                "iOS에서 Delegate Pattern(델리게이트 패턴)은 객체 간의 통신을 위해 사용되는 디자인 패턴입니다. 델리게이트 패턴은 객체 사이의 상호작용을 위해 하나의 객체가 다른 객체의 대리자(delegate) 역할을 수행하도록 합니다. 이를 통해 객체 사이의 결합도를 낮추고 유연하고 확장 가능한 코드를 작성할 수 있습니다.\n\n 델리게이트 패턴은 다음과 같은 주요 요소로 구성됩니다:\n\n 1. Delegate(델리게이트): 델리게이트는 프로토콜(protocol)을 채택하여 필요한 메서드를 구현하는 객체입니다. 다른 객체로부터 이벤트나 작업에 대한 알림을 받아 처리합니다. 주로 프로토콜을 통해 델리게이트의 메서드를 정의하며, 해당 메서드는 이벤트에 대한 응답이나 작업의 결과를 전달합니다.\n\n 2. Delegating Object(델리게이팅 객체): 델리게이트를 소유하고 있는 객체를 델리게이팅 객체라고 합니다. 델리게이팅 객체는 특정 작업이나 이벤트가 발생할 때 델리게이트에게 알림을 보내고, 필요한 정보를 전달합니다. 이를 통해 델리게이트는 작업을 수행하고 결과를 반환합니다.\n\n 3. Protocol(프로토콜): 델리게이트와 델리게이팅 객체 간의 통신을 위한 메서드를 정의하는 프로토콜입니다. 프로토콜은 델리게이트 객체가 구현해야 하는 메서드를 선언하며, 이를 통해 델리게이트 객체와 델리게이트 간의 인터페이스를 정의합니다.\n\n 델리게이트 패턴은 iOS 애플리케이션에서 다양한 상황에서 사용됩니다. 예를 들어, 테이블 뷰의 데이터 소스(Data Source)와 델리게이트(delegate)는 테이블 뷰의 데이터를 관리하고 사용자 상호작용에 대한 응답을 처리합니다. 또한, 키보드의 이벤트를 처리하거나 네트워크 요청의 응답을 처리하는 등 다양한 상황에서 델리게이트 패턴을 활용할 수 있습니다.델리게이트 패턴은 객체 간의 결합도를 낮추고 코드의 재사용성과 유지보수성을 향상시키는 장점을 가지고 있습니다"
                
            ])
    ])
        
}

        //MARK: iOS - iOS 답변
//        ["Answer" : FieldValue.arrayUnion([
//            "View의 생명주기(View Lifecycle)는 iOS 앱에서 화면에 표시되는 View의 상태 변화를 설명하는 개념입니다. View의 생명주기는 앱이 실행되고 View가 생성되어 사용자에게 표시되고, 상호작용하며, 다른 View로 전환되거나 앱이 종료될 때까지의 과정을 나타냅니다.\n\n iOS에서 View의 생명주기는 다음과 같은 주요 단계로 구성됩니다:\n\n 1. `loadView()`: View가 메모리에 로드될 때 호출됩니다. 이 단계에서 View를 생성하고 초기화합니다. 일반적으로 Interface Builder를 사용하여 View를 만들 때는 직접 구현하지 않습니다.\n\n 2. `viewDidLoad()`: View가 메모리에 로드된 후에 호출됩니다. 이 단계에서 View와 관련된 리소스를 초기화하거나 데이터를 로드하는 등의 작업을 수행할 수 있습니다. 일반적으로 한 번만 호출되며, View가 처음으로 표시될 때 호출됩니다.\n\n 3. `viewWillAppear(_:)` / `viewDidAppear(_:)`: View가 화면에 나타나기 전에 호출됩니다. `viewWillAppear(_:)`은 View가 화면에 나타나기 직전에 호출되며, View에 대한 최종 준비 작업을 수행할 수 있습니다. `viewDidAppear(_:)`는 View가 화면에 나타난 후에 호출되며, 애니메이션 등의 추가 작업을 수행할 수 있습니다.\n\n 4. `viewWillDisappear(_:)` / `viewDidDisappear(_:)`: View가 화면에서 사라지기 전에 호출됩니다. `viewWillDisappear(_:)`은 View가 화면에서 사라지기 직전에 호출되며, 사용자 데이터를 저장하거나 화면 상태를 업데이트하는 등의 작업을 수행할 수 있습니다. `viewDidDisappear(_:)`는 View가 화면에서 완전히 사라진 후에 호출되며, 추가 정리 작업을 수행할 수 있습니다.\n\n 5. `dealloc`: View가 메모리에서 해제될 때 호출됩니다. 이 단계에서 메모리 관리 및 리소스 정리 작업을 수행할 수 있습니다.\n\n 위의 단계는 View의 일반적인 생명주기를 설명하며, 이벤트에 따라 다양한 메서드가 추가로 호출될 수도 있습니다. 또한, iOS 13부터는 SceneDelegate와 같은 다른 클래스에서도 View의 생명주기 이벤트를 처리할 수 있습니다.",
//
//            "iOS 앱의 생명주기(App Lifecycle)는 앱이 시작되고 종료될 때까지의 주요 단계와 이벤트를 설명하는 개념입니다. 이해해야 하는 주요 단계는 다음과 같습니다: \n\n 1. Not Running: 앱이 실행되지 않은 상태입니다. 이 상태에서 앱은 실행되지 않고 있으며, 앱 아이콘이나 알림 등을 통해 사용자에게 표시되지 않습니다.\n\n 2. Inactive: 앱이 실행 중이지만 이벤트를 받을 수 없는 상태입니다. 주로 앱이 백그라운드로 전환되거나 앱 간 전환 시에 발생합니다.\n\n 3. Active: 앱이 실행 중이며 이벤트를 받을 수 있는 상태입니다. 사용자와 상호작용하고, 작업을 수행하고, UI를 업데이트할 수 있습니다. 4. Background: 앱이 백그라운드에서 실행 중인 상태입니다. 사용자는 다른 앱을 사용하거나 홈 화면으로 이동할 수 있지만, 앱은 여전히 백그라운드에서 실행될 수 있습니다. 백그라운드에서 실행 중인 동안 앱은 일부 작업을 수행할 수 있습니다. 예를 들어, 위치 업데이트, 파일 다운로드, 네트워크 작업 등을 처리할 수 있습니다.\n\n 5. Suspended: 앱이 백그라운드에 있지만 실행되지 않는 상태입니다. 시스템이 자원을 절약하기 위해 앱을 일시적으로 멈추고 메모리에서 언로드합니다. 앱은 백그라운드에서 중단된 상태이므로 코드를 실행할 수 없습니다. 사용자가 앱을 다시 실행하면, 앱은 다시 Active 상태로 전환됩니다.\n\n 앱은 다양한 생명주기 이벤트를 처리하는 메서드를 구현할 수 있습니다. 주요한 앱 델리게이트(App Delegate) 메서드는 다음과 같습니다:\n\n - `application(_:willFinishLaunchingWithOptions:)`: 앱이 처음으로 실행될 때 호출됩니다. 앱의 초기 설정이나 데이터 로딩 등 초기화 작업을 수행할 수 있습니다.\n\n - `application(_:didFinishLaunchingWithOptions:)`: 앱이 실행되고 초기화 작업이 완료된 후 호출됩니다. 주로 앱의 사용자 인터페이스를 설정하는 작업을 수행합니다.\n\n - `applicationWillResignActive(_:)`: 앱이 Inactive 상태로 전환되기 직전에 호출됩니다. 예를 들어, 전화가 왔을 때나 홈 버튼을 눌렀을 때 호출됩니다.\n\n - `applicationDidEnterBackground(_:)`: 앱이 Background 상태로 전환되었을 때 호출됩니다.",
//
//            "AppDelegate는 iOS 앱의 핵심적인 델리게이트(Delegate) 클래스로서, 앱의 전반적인 생명주기 이벤트를 관리하고 처리하는 역할을 합니다. AppDelegate는 UIApplicationDelegate 프로토콜을 채택하여 구현되며, iOS 앱이 시작되거나 종료될 때 호출되는 다양한 메서드를 포함하고 있습니다.\n\n AppDelegate 클래스의 주요 메서드와 역할은 다음과 같습니다:\n\n 1. `application(_:didFinishLaunchingWithOptions:)`: 앱이 처음 실행될 때 호출되는 메서드입니다. 앱이 실행되고 초기화 작업이 완료된 후에 호출되며, 이 메서드 내에서 앱의 초기 설정, 뷰 컨트롤러 설정, 데이터 로딩 등의 작업을 수행할 수 있습니다.\n\n 2. `applicationWillResignActive(_:)`: 앱이 Active 상태에서 Inactive 상태로 전환되기 직전에 호출됩니다. 예를 들어, 전화가 왔을 때나 홈 버튼을 눌렀을 때 호출됩니다. 이 메서드 내에서 사용자 데이터를 저장하거나 앱 상태를 업데이트하는 등의 작업을 수행할 수 있습니다.\n\n 3. `applicationDidEnterBackground(_:)`: 앱이 Background 상태로 전환된 직후 호출됩니다. 이 메서드 내에서 앱이 백그라운드에서 실행될 때 필요한 작업을 처리할 수 있습니다. 예를 들어, 데이터 저장, 네트워크 작업 완료, 위치 업데이트 등을 처리할 수 있습니다.\n\n 4. `applicationWillEnterForeground(_:)`: 앱이 Background 상태에서 다시 Active 상태로 전환되기 직전에 호출됩니다. 이 메서드 내에서 필요한 설정을 복원하거나 데이터를 업데이트하는 등의 작업을 수행할 수 있습니다.\n\n 5. `applicationDidBecomeActive(_:)`: 앱이 Active 상태로 전환된 직후 호출됩니다. 앱이 사용자와 상호작용할 수 있는 상태가 되었으므로, 주로 UI 업데이트나 타이머 시작 등의 작업을 수행합니다.\n\n 6. `applicationWillTerminate(_:)`: 앱이 종료되기 직전에 호출됩니다. 이 메서드 내에서 앱이 종료되기 전에 필요한 정리 작업이나 데이터 저장 작업을 수행할 수 있습니다. 다만, 앱이 강제 종료되거나 백그라운드에서 종료되는 경우에는 호출되지 않을 수도 있습니다.\n\n 위의 메서드 외에도 다양한 앱 생명주기 관련 메서드를 AppDelegate에서 구현할 수 있으며, 앱의 특정 상황에 맞게 적절한 처리를 할 수 있습니다.",
//
//            "iOS 13부터 도입된 SceneDelegate는 앱의 다중 화면 인터페이스를 관리하는 델리게이트(Delegate) 클래스입니다. SceneDelegate는 UIApplicationDelegate 프로토콜을 채택하여 구현되며, 각각의 Scene에 대한 생명주기 이벤트를 처리하는 역할을 합니다.\n\nSceneDelegate의 주요 역할은 다음과 같습니다:\n\n 1. Scene 생성과 설정: SceneDelegate는 앱이 실행될 때 새로운 Scene이 생성되었을 때 호출되는 `scene(_:willConnectTo:options:)` 메서드를 통해 Scene 객체를 생성하고 초기 설정을 수행합니다. 이 메서드 내에서 새로운 Scene에 대한 UIWindow를 생성하거나, 해당 Scene에 대한 초기 화면 설정을 수행할 수 있습니다.\n\n 2. Scene 상태 변화 처리: SceneDelegate는 Scene이 활성화되거나 비활성화될 때 호출되는 다양한 메서드를 통해 Scene의 상태 변화를 처리합니다. 예를 들어, Scene이 활성화될 때 호출되는 `sceneDidBecomeActive(_:)` 메서드는 Scene이 사용자와 상호작용할 수 있는 상태로 전환되었을 때 호출되며, 해당 Scene에 필요한 작업을 처리할 수 있습니다. 비활성화될 때 호출되는 `sceneWillResignActive(_:)` 메서드는 Scene이 비활성화되기 전에 필요한 데이터 저장이나 설정 업데이트 작업을 수행할 수 있는 기회를 제공합니다.\n\n 3. Scene 종료 처리: SceneDelegate는 Scene이 종료될 때 호출되는 `sceneDidDisconnect(_:)` 메서드를 통해 해당 Scene과 관련된 정리 작업을 수행합니다. 이 메서드 내에서 사용되지 않는 리소스를 해제하거나 데이터 저장 작업을 수행할 수 있습니다.\n\n SceneDelegate는 앱의 `Info.plist` 파일에 설정되어야 합니다. iOS 13 이상에서는 `UIApplicationSceneManifest` 키를 사용하여 SceneDelegate 클래스를 지정합니다.\n\n SceneDelegate는 앱의 다중 화면 인터페이스를 지원하기 위해 도입된 개념으로, 각각의 Scene에 대한 독립적인 생명주기를 관리합니다. 이를 통해 사용자는 동시에 여러 개의 Scene을 실행하고 전환할 수 있으며, 각 Scene은 개별적인 UI와 상태를 가질 수 있습니다.",
//
//            "iOS Safe Area(안전 영역)는 iPhone X 이상의 모델에서 사용되는 개념으로, 앱 인터페이스가 디바이스의 화면 경계와 겹치지 않도록 하는 영역을 의미합니다. Safe Area는 디바이스의 노치, 홈 버튼 없는 바닥 부분 등의 화면 구성 요소를 고려하여 인터페이스 요소의 위치와 크기를 조정하는 데 사용됩니다.\n\n Safe Area는 다음과 같은 영역으로 구성됩니다:\n\n 1. Safe Area Insets: 디바이스의 화면 경계에서 앱 인터페이스까지의 여백을 나타냅니다. 상단 Safe Area는 노치가 있는 디바이스에서 노치와 인터페이스 요소 사이의 여백을 나타내고, 하단 Safe Area는 홈 버튼이 없는 디바이스에서 화면 하단과 인터페이스 요소 사이의 여백을 나타냅니다.\n\n 2. Layout Guides: Safe Area를 기반으로 인터페이스 요소의 레이아웃을 제어하기 위한 가이드라인을 제공합니다. Top Layout Guide는 인터페이스의 상단 경계를 나타내며, Bottom Layout Guide는 인터페이스의 하단 경계를 나타냅니다.\n\n Safe Area는 Auto Layout을 사용하여 인터페이스의 레이아웃을 구성할 때 유용하게 활용됩니다. Auto Layout을 설정할 때 Safe Area를 기준으로 인터페이스 요소의 위치와 크기를 설정하면, 디바이스의 화면 크기나 형태에 관계없이 일관된 모습으로 인터페이스를 표시할 수 있습니다. 또한, Safe Area를 사용하면 노치나 홈 버튼 없는 바닥 부분에 인터페이스 요소가 가려지지 않도록 안전하게 배치할 수 있습니다.\n\n Safe Area를 활용하기 위해 인터페이스 구성 요소의 제약 조건을 설정하거나 인터페이스 빌더에서 Safe Area를 기준으로 레이아웃을 구성할 수 있습니다. Safe Area에 대한 정보는 UIViewController의 `view.safeAreaInsets` 프로퍼티를 통해 액세스할 수 있습니다.",
//
//            "UIResponder 클래스는 iOS 앱의 이벤트 처리 및 응답 체계를 구성하는 핵심 클래스입니다. UIResponder는 UIResponder 클래스를 상속하는 다른 클래스들에 의해 구현되며, 사용자의 터치 입력, 모션 이벤트, 키보드 입력 등 다양한 이벤트에 대한 응답을 처리합니다.\n\n UIResponder의 주요 역할은 다음과 같습니다:\n\n 1. 이벤트 처리: UIResponder는 사용자의 터치 입력, 제스처, 키보드 입력 등 다양한 이벤트를 받아 처리할 수 있습니다. UIResponder 클래스는 UIResponder를 상속하는 UIView와 UIViewController 등의 클래스를 통해 이벤트 처리 메서드를 제공합니다.\n\n 2. 이벤트 응답 체인 구성: iOS 앱은 이벤트 응답 체인(event response chain)을 통해 이벤트를 전달하고 처리합니다. UIResponder 클래스는 이벤트 응답 체인의 핵심 요소로서, 이벤트를 받아서 처리한 후, 다음 응답 객체로 이벤트를 전달합니다. 이벤트 응답 체인은 주로 뷰 계층 구조에서 상위 뷰로부터 하위 뷰로 전달되는 방식으로 동작합니다.\n\n 3. UIResponder 메서드 오버라이딩: UIResponder 클래스는 이벤트 처리를 위해 다양한 메서드를 제공합니다. 개발자는 UIResponder를 상속받은 클래스에서 이벤트 처리 메서드를 오버라이딩하여 원하는 동작을 구현할 수 있습니다. 예를 들어, 터치 이벤트를 처리하기 위해 `touchesBegan(_:with:)`, `touchesMoved(_:with:)`, `touchesEnded(_:with:)`, `touchesCancelled(_:with:)` 등의 메서드를 오버라이딩할 수 있습니다.\n\n UIResponder는 UIKit 프레임워크의 핵심 요소로서, 사용자의 입력에 대한 응답을 처리하고 다른 객체로 이벤트를 전달하는 역할을 담당합니다. UIView와 UIViewController 등의 클래스는 UIResponder를 상속받아 이벤트 처리와 응답 체인에 기능을 추가하며, iOS 앱의 사용자 인터페이스를 구현하는 데 핵심적인 역할을 수행합니다.",
//
//            "UIApplicationMain은 iOS 앱의 진입점(entry point) 역할을 수행하는 함수입니다. UIApplicationMain 함수는 앱의 실행을 시작하고 앱의 핵심 객체를 초기화하여 이벤트 루프를 실행합니다. 이 함수는 iOS 앱의 main.swift 파일에 위치하며, 앱의 시작 시에 자동으로 호출됩니다.\n\n UIApplicationMain 함수는 다음과 같은 역할을 수행합니다:\n\n 1. UIApplication 객체 초기화: UIApplicationMain 함수는 UIApplication 객체를 초기화합니다. UIApplication은 iOS 앱의 중앙 제어 객체로서, 앱의 생명주기 관리, 이벤트 처리, 앱 간 통신 등의 핵심 기능을 담당합니다.\n\n 2. AppDelegate 객체 초기화: UIApplicationMain 함수는 AppDelegate 클래스의 객체를 초기화합니다. AppDelegate는 앱의 대리자(delegate)로서, 앱의 전반적인 생명주기 이벤트를 관리하고 처리하는 역할을 수행합니다.\n\n 3. 이벤트 루프 실행: UIApplicationMain 함수는 UIApplication 객체를 실행하여 앱의 이벤트 루프를 시작합니다. 이벤트 루프는 앱이 사용자 입력, 시스템 이벤트 등의 다양한 이벤트를 처리하고, 필요에 따라 앱의 뷰 계층 구조를 업데이트하고 화면을 렌더링하는 역할을 수행합니다.\n\n UIApplicationMain 함수는 iOS 앱의 기본 구조를 설정하고 앱의 핵심 객체를 초기화하는 역할을 합니다. 앱을 실행하기 위해 필요한 필수적인 동작을 수행하며, 이후에는 AppDelegate 클래스 내의 메서드들을 호출하여 앱의 동작을 관리합니다.",
//
//            "UINavigationController는 iOS 앱에서 탐색 기반 인터페이스를 구현하기 위해 사용되는 컨트롤러 클래스입니다. UINavigationController는 뷰 컨트롤러의 스택(stack)을 관리하며, 탐색 흐름을 제공하여 사용자가 앱 내에서 여러 화면을 탐색하고 이동할 수 있도록 도와줍니다.\n\n UINavigationController의 주요 특징과 역할은 다음과 같습니다:\n\n 1. 스택 기반 탐색: UINavigationController는 뷰 컨트롤러의 스택을 관리합니다. 앱의 다른 화면(뷰 컨트롤러)을 스택에 추가하거나 제거하여 탐색 기능을 제공합니다. 사용자가 화면을 이동하면 스택에서 해당 화면을 푸시(push)하거나 팝(pop)하여 탐색 흐름을 제어합니다.\n\n 2. Navigation Bar: UINavigationController는 자체적으로 Navigation Bar를 제공합니다. Navigation Bar는 화면 상단에 위치하여 탐색을 위한 제목(title), 버튼(Back, Done 등), 탐색 히스토리 표시 등을 제공합니다. Navigation Bar는 UINavigationController가 관리하는 뷰 컨트롤러의 타이틀이 자동으로 표시되며, 사용자가 버튼을 탭하여 화면을 이동할 수 있습니다.\n\n 3. 뷰 컨트롤러 관리: UINavigationController는 뷰 컨트롤러의 생명주기와 화면 전환을 관리합니다. 새로운 뷰 컨트롤러를 스택에 푸시하거나, 이전 뷰 컨트롤러로부터 돌아갈 때 스택에서 팝합니다. 또한, UINavigationController는 뷰 컨트롤러 간의 전환 애니메이션을 자동으로 처리하여 사용자에게 부드러운 화면 전환 효과를 제공합니다.\n\n 4. 탐색 기능 제공: UINavigationController는 기본적인 탐색 기능을 제공합니다. Back 버튼을 통해 이전 화면으로 돌아가거나, 외부에서 제공하는 인터페이스 요소(예: 테이블 셀)를 탭하여 다른 화면으로 이동할 수 있습니다. 또한, UINavigationController는 탐색 흐름을 기록하여 사용자가 화면을 이동한 후에도 이전 상태로 복원할 수 있도록 도와줍니다.\n\n UINavigationController는 주로 앱의 복잡한 탐색 구조를 구현하기 위해 사용되며, 특히 계층적인 화면 구조를 가지는 앱에서 많이 활용됩니다. 예를 들어, 메뉴, 서브메뉴, 세부 정보 화면 등의 계층 구조를 가지는 앱에서 UINavigationController를 사용하여 사용자가 화면을 탐색하고 이동할 수 있도록 합니다.",
//
//            "UIWindow는 iOS 앱에서 화면을 그리고 사용자 인터페이스를 표시하는 데 사용되는 객체입니다. UIWindow는 앱의 메인 윈도우로서, 앱 내에서 다른 뷰들을 포함하고 표시하는 컨테이너 역할을 합니다.\n\n UIWindow의 주요 특징과 역할은 다음과 같습니다: 1. 화면 표시: UIWindow는 앱의 화면을 표시하는 컨테이너입니다. UIWindow 객체는 뷰 계층 구조의 최상위에 위치하며, 앱의 다른 뷰들을 포함하여 화면에 그리고 표시합니다.\n\n 2. 다중 윈도우 지원: iOS에서는 기본적으로 하나의 UIWindow가 사용되지만, 필요에 따라 다중 UIWindow를 사용할 수 있습니다. 다중 UIWindow는 특정 상황에서 유용하게 사용될 수 있으며, 예를 들어 알림 팝업, 뷰 컨트롤러 전환 애니메이션 등에 활용될 수 있습니다.\n\n 3. 창 계층 구조 관리: UIWindow는 창 계층 구조를 관리합니다. 여러 UIWindow 객체가 있는 경우, UIWindow의 창 계층 구조를 기반으로 뷰가 상호작용하고 이벤트를 처리하게 됩니다. 주로 UIWindow의 창 계층 구조는 UIWindowLevel을 통해 지정되며, 더 높은 수준의 UIWindowLevel을 가진 UIWindow가 다른 UIWindow 위에 표시됩니다.\n\n 4. 앱의 핵심 객체: UIWindow는 iOS 앱의 핵심 객체 중 하나로, 앱의 생명주기, 상태 변화, 회전 등과 관련된 이벤트를 처리하고 알림을 전달합니다. 또한, UIWindow는 앱의 핵심 컨트롤러 객체인 AppDelegate와 밀접한 관련이 있으며, AppDelegate에서 UIWindow 객체를 생성하고 설정하여 앱의 기본 창으로 사용됩니다.\n\n UIWindow는 iOS 앱의 기본 창이자 화면을 그리고 표시하는 핵심 객체입니다. 앱의 다른 뷰들을 포함하고 화면에 표시하는 역할을 수행하며, 앱의 창 계층 구조와 인터페이스 이벤트 처리에 중요한 역할을 합니다.",
//
//            "iOS에서 Layer 객체는 Core Animation 프레임워크의 핵심 개념 중 하나입니다. Layer 객체는 화면에 그리기 위한 2D 그래픽 요소를 나타내는 객체로서, 앱의 뷰 계층 구조의 각각의 뷰에 대응하는 존재입니다.\n\n Layer 객체의 주요 특징과 역할은 다음과 같습니다:\n\n 1. 그래픽 처리: Layer 객체는 그래픽 처리를 위한 도구로서 사용됩니다. Layer 객체는 비트맵 이미지, 도형, 텍스트 등의 그래픽 요소를 그리고, 색상, 텍스처, 그림자 등의 시각적 효과를 적용할 수 있습니다. 이를 통해 뷰에 다양한 그래픽 요소를 표시할 수 있습니다.\n\n 2. 렌더링: Layer 객체는 자체적으로 뷰 계층 구조 내에서 그래픽을 렌더링합니다. Layer는 Core Animation 엔진에 의해 관리되며, 그래픽 요소의 렌더링과 애니메이션 효과를 처리합니다. 이는 뷰의 성능을 향상시키고, 부드러운 애니메이션 및 그래픽 효과를 구현하는 데 도움을 줍니다.\n\n 3. 애니메이션: Layer 객체는 Core Animation 프레임워크의 핵심적인 역할을 수행합니다. Layer는 애니메이션을 생성하고 제어하기 위한 다양한 기능과 속성을 제공합니다. 이를 통해 뷰에 애니메이션을 적용하거나, 변환, 회전, 크기 조정 등의 변형 효과를 적용할 수 있습니다.\n\n 4. 뷰 계층 구조 관리: Layer 객체는 뷰 계층 구조의 각각의 뷰와 대응합니다. 뷰는 내부적으로 해당 뷰에 대응하는 Layer 객체를 가지고 있으며, 이를 통해 뷰 계층 구조를 구성하고 관리합니다. 이는 뷰 계층 구조 내에서 Layer 객체의 속성 및 상태를 조작하여 화면에 그래픽을 표시하고 렌더링하는 데 사용됩니다.\n\n Layer 객체는 iOS 앱의 그래픽 처리, 애니메이션, 렌더링 등에 핵심적인 역할을 수행합니다. 뷰의 그래픽 요소를 그리고 관리하며, Core Animation 엔진을 통해 애니메이션과 시각적 효과를 적용합니다. 뷰의 성능을 향상시키고, 부드러운 그래픽 및 애니메이션 효과를 구현하는 데 사용됩니다.",
//
//            "UITableView는 iOS 앱에서 테이블 형식의 목록을 표시하고 관리하는 데 사용되는 UI 요소입니다. UITableView는 사용자에게 스크롤 가능한 목록을 제공하고, 각 셀에 내용을 표시하여 데이터의 시각적 표현을 가능하게 합니다.\n\n UITableView의 주요 특징과 역할은 다음과 같습니다:\n\n 1. 목록 표시: UITableView는 데이터를 목록 형식으로 표시합니다. 각 항목은 하나의 셀(cell)로 표현되며, 사용자는 스크롤을 통해 목록을 탐색할 수 있습니다. UITableView는 대용량 데이터의 효율적인 표시를 위해 스크롤링과 렌더링을 최적화하여 성능을 향상시킵니다.\n\n 2. 셀 관리: UITableView는 각 셀의 생성, 재사용 및 구성을 관리합니다. 재사용 큐(reuse queue)를 통해 필요한 만큼의 셀을 동적으로 생성하고 재사용함으로써 메모리 사용을 최적화합니다. 이를 통해 효율적인 목록 표시와 스크롤링을 가능하게 합니다.\n\n 3. 데이터 소스와 델리게이트: UITableView는 데이터 소스(data source)와 델리게이트(delegate) 패턴을 사용하여 동작합니다. 데이터 소스는 UITableView에 표시할 데이터를 제공하고, 델리게이트는 사용자 이벤트 처리 및 테이블 동작을 커스터마이즈하는 데 사용됩니다. 이를 통해 데이터의 표시 방식 및 동작을 유연하게 제어할 수 있습니다.\n\n 4. 다양한 스타일 및 기능: UITableView는 다양한 스타일과 기능을 제공합니다. 그룹 스타일, 플레인 스타일, 인덱스 목록, 스와이프 삭제 등 다양한 테이블 스타일과 기능을 설정할 수 있습니다. 또한, 셀의 내용을 커스터마이즈하고 사용자 정의 셀을 만들어 사용할 수도 있습니다.\n\n UITableView는 iOS 앱에서 데이터를 효과적으로 표시하고 사용자가 목록을 탐색할 수 있는 강력한 도구입니다. 테이블 형식의 데이터 표시와 관리에 주로 사용되며, 다양한 스타일과 기능을 통해 다양한 사용자 인터페이스를 구현할 수 있습니다.",
//
//            "UICollectionView는 iOS 앱에서 다양한 형식의 그리드 또는 커스텀 레이아웃을 가진 컬렉션 형식의 목록을 표시하고 관리하는 데 사용되는 UI 요소입니다. UICollectionView는 UITableView와 비슷한 목적으로 사용되지만, 보다 유연한 레이아웃과 다양한 표시 옵션을 제공합니다.\n\n UICollectionView의 주요 특징과 역할은 다음과 같습니다:\n\n 1. 그리드 형식의 목록: UICollectionView는 그리드 형식의 목록을 표시합니다. 이를 통해 여러 행과 열로 구성된 아이템의 그룹을 표현할 수 있습니다. 그리드 형태의 목록은 다양한 종류의 데이터를 표시하기에 적합하며, 유연한 레이아웃 구성이 가능합니다.\n\n 2. 다양한 레이아웃 옵션: UICollectionView는 다양한 레이아웃 옵션을 제공하여 아이템의 배치와 크기를 제어할 수 있습니다. 기본적으로 제공되는 그리드 레이아웃 외에도, 사용자 정의 레이아웃을 구성하여 아이템을 원하는 방식으로 배치할 수 있습니다.\n\n 3. 셀 관리: UICollectionView는 UITableView와 유사하게 셀 관리를 수행합니다. 셀은 데이터의 각 항목을 표시하는 단위로 사용되며, 재사용 큐(reuse queue)를 통해 효율적인 메모리 관리를 할 수 있습니다. 또한, 셀은 커스텀 디자인과 인터랙션을 추가하여 다양한 형태의 아이템을 표현할 수 있습니다.\n\n 4. 데이터 소스와 델리게이트: UICollectionView는 데이터 소스(data source)와 델리게이트(delegate) 패턴을 사용하여 동작합니다. 데이터 소스는 UICollectionView에 표시할 데이터를 제공하고, 델리게이트는 사용자 이벤트 처리와 커스텀 동작을 관리합니다.\n\n 5. 다양한 표시 옵션: UICollectionView는 다양한 표시 옵션을 제공합니다. 섹션(section)을 사용하여 아이템을 그룹화하고 헤더(header)와 푸터(footer)를 표시할 수 있습니다. 또한, 셀의 크기와 간격, 스크롤 방향 등을 설정하여 원하는 목록 디자인을 구현할 수 있습니다.\n\n UICollectionView는 iOS 앱에서 그리드 형식의 목록을 표시하고 다양한 형태의 데이터를 유연하게 표현하기 위한 강력한 도구입니다. 그리드 레이아웃, 커스텀 디자인, 다양한 표시 옵션을 활용하여 다양한 목록 스타일과 사용자 인터페이스를 구현할 수 있습니다."
//        ]),
////
////        MARK: iOS - iOS 질문
//        "Question" : FieldValue.arrayUnion(["뷰의 생명주기란?",
//                                            "앱의 생명주기란?",
//                                            "AppDelegate란?",
//                                            "scene delegate란?",
//                                            "SafeArea란?",
//                                            "UIResponder 클래스란?",
//                                            "UIApplicationMain함수란?",
//                                            "UINavigationController란?",
//                                            "UIWindow란?",
//                                            "Layer객체란?",
//                                            "UITableView란?",
//                                            "UICollectionView란?"])])
//}


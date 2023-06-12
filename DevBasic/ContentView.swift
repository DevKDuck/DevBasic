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
    
    


    
    @State private var selectedRow: Int? = nil
    
    var body: some View {
        
        TabView{
            NavigationView{
                List{
                    Section(header: Text("UI관련")){
                       
                        ForEach(questionsToUI.indices, id:\.self){ index in
                            NavigationLink(destination: ContentScrollView(content: answersToUI[index]),tag: index, selection: $selectedRow){
                                Text(questionsToUI[index])
                                
                            }
                        }
                    }
                    Section(header: Text("iOS")){
                        
                        ForEach(questionsToiOS.indices, id:\.self){ index in
                            NavigationLink(destination: ContentScrollView(content: answersToiOS[index]), tag: index, selection: $selectedRow){
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
                Image(systemName: "applelogo")
                Text("iOS")
            }
            NavigationView{
                List{
                    Section(header: Text("Swift")){
                        
                        ForEach(questionsToSwift.indices, id:\.self){ index in
                            NavigationLink(destination: ContentScrollView(content:answersToSwift[index]), tag: index, selection: $selectedRow){
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
                    Section(header: Text("Reference")){
                        
                        ForEach(questionsToReference.indices, id:\.self){ index in
                            NavigationLink(destination: ContentScrollView(content:answersToReference[index]), tag: index, selection: $selectedRow){
                                Text(questionsToReference[index])
                            }
                        }
                    }
                    
                    Section(header: Text("Functional Programming")){
                        
                        ForEach(questionsToFunctionalProgramming.indices, id:\.self){ index in
                            NavigationLink(destination: ContentScrollView(content:answersToFunctionalProgramming[index]), tag: index, selection: $selectedRow){
                                Text(questionsToFunctionalProgramming[index])
                                
                            }
                        }
                    }
                    
                    Section(header: Text("Architecture")){
                        
                        ForEach(questionsToArchitecture.indices, id:\.self){ index in
                            NavigationLink(destination: ContentScrollView(content:answersToArchitecture[index]), tag: index, selection: $selectedRow){
                                Text(questionsToArchitecture[index])
                                
                            }
                        }
                    }
                    
                    Section(header: Text("Release")){
                        
                        ForEach(questionsToRelease.indices, id:\.self){ index in
                            NavigationLink(destination: ContentScrollView(content:answersToRelease[index]), tag: index, selection: $selectedRow){
                                Text(questionsToRelease[index])
                                
                            }
                        }
                    }
                    Section(header: Text("SwiftUI+Combine")){
                        
                        ForEach(questionsToSwiftUICombine.indices, id:\.self){ index in
                            NavigationLink(destination: ContentScrollView(content:answersToSwiftUICombine[index]), tag: index, selection: $selectedRow){
                                Text(questionsToSwiftUICombine[index])
                                
                            }
                        }
                    }

                    
                    
                    .listStyle(GroupedListStyle())
                    .navigationBarTitle("Etc")
                    .onAppear{
                        
                    }
                }
            }
            .tabItem{
                Image(systemName: "ellipsis.circle")
                Text("Etc")
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
        
        
    }
}



func setData(){
    
    
    let db = Firestore.firestore()
    db.collection("Etc").document("SwiftUI + Combine").setData(
        ["Question" : FieldValue.arrayUnion(
            ["SwiftUI란?",
             "Combine이란?",
             "@State란?",
             "PassthroughSubject란?",
             "@Published란?",
             "AnyCancellable란?",
             "sink란?",
             "throttle,debounce의 차이점",
             "Data를 Binding하는 법"
        ]),
         "Answer" : FieldValue.arrayUnion(
            ["SwiftUI는 애플이 iOS, macOS, watchOS 및 tvOS용 앱 인터페이스를 구축하기 위해 개발한 사용자 인터페이스(UI) 프레임워크입니다. SwiftUI는 Swift 프로그래밍 언어로 작성되어 강력하고 직관적인 방식으로 UI를 설계하고 구현할 수 있도록 지원합니다.\n\n SwiftUI는 선언적인 프로그래밍 패러다임을 따릅니다. 이는 개발자가 UI를 어떻게 표현할지 선언하고, 시스템이 해당 UI를 구성하고 업데이트하는 방식을 의미합니다. 이를 통해 개발자는 직관적이고 간결한 코드로 유연하고 반응적인 UI를 구현할 수 있습니다.\n\n SwiftUI의 특징은 다음과 같습니다:\n\n 1. 선언적 구문: SwiftUI는 선언적인 구문을 사용하여 UI를 설계합니다. 개발자는 UI의 구조와 속성을 선언하고 시스템은 해당 UI를 구성합니다. 이는 코드의 가독성을 향상시키고 UI를 쉽게 이해하고 수정할 수 있게 합니다.\n\n 2. 자동 업데이트: SwiftUI는 상태 값의 변경에 따라 자동으로 UI를 업데이트합니다. 개발자가 상태를 변경하면 시스템이 해당 변경을 감지하고 필요한 뷰만 다시 그려줍니다. 이로써 개발자는 명시적인 UI 업데이트 코드를 작성하지 않아도 됩니다.\n\n 3. 다중 플랫폼 지원: SwiftUI는 iOS, macOS, watchOS, tvOS 등 다양한 플랫폼에서 동일한 코드를 공유하고 재사용할 수 있습니다. 이는 개발자가 애플의 다양한 플랫폼에서 일관된 사용자 경험을 제공할 수 있도록 합니다.\n\n 4. 실시간 미리 보기: SwiftUI는 코드를 작성하는 동시에 실시간으로 미리 보기를 제공합니다. 이를 통해 개발자는 코드 변경 사항을 즉시 확인하고 UI를 조정할 수 있습니다.\n\n SwiftUI는 iOS 13부터 도입되었으며, 기존의 UIKit 및 AppKit과 함께 사용할 수 있습니다. SwiftUI는 앱의 전체 UI를 SwiftUI로 작성하거나 기존의 UI 코드와 SwiftUI를 혼합하여 사용할 수 있는 유연성을 제공합니다.",
             
            "Combine은 Apple이 개발한 리액티브 프로그래밍 패러다임을 지원하는 프레임워크입니다. Combine은 비동기 이벤트 및 데이터 흐름을 처리하고 조작하는데 사용되며, iOS, macOS, watchOS 및 tvOS 앱 개발에 활용될 수 있습니다.\n\n Combine은 Publisher-Subscriber 패턴을 기반으로 동작합니다. Publisher는 데이터나 이벤트를 생성하고, Subscriber는 Publisher로부터 이벤트를 받아 처리합니다. 이를 통해 데이터의 변화나 이벤트의 발생에 대해 관심 있는 구독자들은 해당 정보를 받아 처리할 수 있습니다.\n\n Combine은 다양한 연산자를 제공하여 데이터 흐름을 변형하고 조작할 수 있습니다. 예를 들어, 매핑, 필터링, 조합, 시간 지연 등의 연산자를 사용하여 데이터를 변형하거나 필터링할 수 있습니다. 또한, Combine은 시간 지연, 오류 처리, 비동기 작업 관리 등과 같은 고급 기능도 제공합니다.\n\n Combine은 Swift의 일부로 내장되어 있으며, Swift의 문법과 통합되어 사용됩니다. Combine을 사용하면 비동기 작업 및 이벤트 기반 로직을 보다 직관적이고 간결한 방식으로 구현할 수 있습니다. 또한, Combine은 SwiftUI와 함께 사용할 때 강력한 조합을 제공하여 UI의 상태 변화에 따라 자동으로 업데이트할 수 있는 리액티브 UI를 구현할 수 있습니다.\n\n Combine은 iOS 13부터 도입되었으며, 이전 버전의 iOS에서는 사용할 수 없습니다. 하지만 Combine을 사용하려면 iOS 13 이상을 타겟팅하는 앱을 개발해야 합니다.",
             
             "`@State`는 SwiftUI에서 사용되는 프로퍼티 래퍼(property wrapper)입니다. `@State`를 사용하여 상태 값을 저장하고 해당 값이 변경될 때마다 SwiftUI가 자동으로 뷰를 업데이트할 수 있도록 할 수 있습니다.\n\n `@State`를 사용하는 방법은 다음과 같습니다:\n\n 1. `@State` 속성 선언: `@State` 프로퍼티 래퍼를 사용하여 상태 값을 선언합니다. 예를 들어, `@State`로 선언된 `isToggled` 프로퍼티는 불리언 값을 저장할 수 있습니다.\n\n 2. 상태 값 접근: `@State`로 선언된 프로퍼티에는 `$` 접두사가 붙습니다. 이를 통해 상태 값에 접근하고 변경할 수 있습니다.\n\n 3. 자동 업데이트: `@State`로 선언된 상태 값이 변경되면 SwiftUI는 해당 상태 값이 사용된 뷰를 자동으로 업데이트합니다. 이를 통해 앱의 상태 변화에 따라 UI가 자동으로 반영될 수 있습니다.\n\n `@State`는 SwiftUI에서 작은 범위의 상태 관리에 적합합니다. 단일 뷰 내에서 사용되는 간단한 상태 값들을 관리하는 데 유용하며, SwiftUI는 `@State`로 선언된 값이 변경되면 해당 뷰를 다시 그리는 최적화된 방식으로 업데이트합니다. 그러나 `@State`는 단일 뷰 내에서만 사용되므로 여러 뷰 간에 상태를 공유하려면 `@State`와 함께 `@Binding`, `@EnvironmentObject` 등의 다른 프로퍼티 래퍼를 함께 사용해야 합니다.",
             
             "`PassthroughSubject`는 Combine 프레임워크에서 사용되는 클래스로, Publisher와 Subscriber 간의 데이터 흐름을 처리하는 데 사용됩니다. 이는 Combine에서 사용되는 리액티브 프로그래밍 패턴에서 이벤트 및 데이터를 전달하는 역할을 합니다.\n\n `PassthroughSubject`는 `Subject` 프로토콜을 준수하며, 값 또는 이벤트를 생성하고 해당 값을 구독자들에게 전달할 수 있습니다. Publisher로부터 값을 받아서 구독자들에게 전달하거나, 직접 값을 생성하여 구독자들에게 전달할 수도 있습니다.\n\n `PassthroughSubject`를 사용하는 방법은 다음과 같습니다:\n\n 1. `PassthroughSubject` 인스턴스 생성: `PassthroughSubject` 클래스를 인스턴스화하여 사용합니다.\n\n 2. 값 전달: `send(_:)` 메서드를 사용하여 값을 전달합니다. 이 값은 해당 `PassthroughSubject`를 구독하고 있는 모든 구독자에게 전달됩니다.\n\n 3. 구독: `sink(receiveCompletion:receiveValue:)` 메서드를 사용하여 구독자를 등록합니다. 이 메서드를 통해 값을 받는 클로저를 제공할 수 있습니다.\n\n `PassthroughSubject`는 가장 기본적인 Publisher 형태로서, 값을 직접 생성하고 구독자에게 전달하는 데 사용됩니다. 다른 Combine 연산자와 함께 사용하여 데이터 흐름을 변형하고 조작할 수 있으며, 더 복잡한 리액티브 시나리오를 구현할 수 있습니다.",
             
             "`@Published`는 SwiftUI에서 Observable Object 클래스의 프로퍼티에 사용되는 프로퍼티 래퍼(property wrapper)입니다. `@Published`를 사용하여 해당 프로퍼티의 값이 변경될 때마다 SwiftUI가 자동으로 뷰를 업데이트할 수 있도록 할 수 있습니다.\n\n `@Published`를 사용하는 방법은 다음과 같습니다:\n\n 1. Observable Object 클래스 선언: Observable Object 프로토콜을 준수하는 클래스를 선언합니다.\n\n 2. `@Published` 속성 사용: `@Published` 프로퍼티 래퍼를 사용하여 상태 값을 선언합니다. `@Published`로 선언된 프로퍼티는 값이 변경될 때마다 SwiftUI에 의해 자동으로 업데이트됩니다.\n\n 3. 상태 값 접근: `@Published`로 선언된 프로퍼티는 일반적인 속성처럼 접근할 수 있습니다. 해당 값이 변경되면 SwiftUI가 자동으로 뷰를 업데이트합니다.\n\n `@Published`는 Observable Object의 프로퍼티를 관찰 가능한 상태로 만들어주는 역할을 합니다. SwiftUI는 `@Published`로 선언된 프로퍼티가 변경될 때마다 해당 뷰를 다시 그리는 최적화된 방식으로 업데이트합니다. 이를 통해 앱의 상태 변화에 따라 UI가 자동으로 반영될 수 있습니다.\n `@Published`는 Observable Object 클래스에서 사용되며, SwiftUI에서 상태를 관리하고 UI를 업데이트하는 데 유용합니다.",
             
             "`AnyCancellable`은 Combine 프레임워크에서 사용되는 클래스로, 구독을 취소할 수 있는 기능을 제공합니다. `AnyCancellable` 인스턴스를 사용하여 Combine의 Publisher와의 구독을 추적하고, 필요에 따라 구독을 취소할 수 있습니다.\n\n Combine에서 `sink` 또는 `assign`과 같은 메서드를 호출하여 Publisher와 구독을 설정하면, 이 메서드는 구독을 나타내는 `AnyCancellable` 객체를 반환합니다. 이 `AnyCancellable` 객체는 구독을 취소하거나 추적하는 데 사용됩니다.\n\n `AnyCancellable`을 사용하는 예시는 다음과 같습니다:\n\n `sink` 메서드는 `AnyCancellable` 객체인 `cancellable`을 반환합니다. `cancel()` 메서드를 호출하여 구독을 취소할 수 있습니다. 이를 통해 메모리 누수를 방지하고, 불필요한 이벤트 처리를 중지할 수 있습니다.\n\n 일반적으로, `AnyCancellable`은 Combine에서 구독을 관리하기 위해 사용되며, 구독을 취소하려는 경우에 유용합니다. 예를 들어, 뷰가 사라지거나 더 이상 필요하지 않은 경우 구독을 취소하여 메모리 관리를 개선할 수 있습니다.",
             
             "SwiftUI에서 `sink`는 Combine 프레임워크의 메서드로, Publisher와의 구독을 설정하여 값을 처리하거나 완료를 처리하는 역할을 합니다. `sink`를 사용하면 Combine Publisher에서 방출되는 값 또는 완료 이벤트를 받아 처리할 수 있습니다.\n\n `sink`를 사용하는 방법은 다음과 같습니다: \n\n 위의 예시에서 `publisher`는 Combine Publisher를 나타내며, `sink` 메서드를 호출하여 구독을 설정합니다. `sink` 메서드는 두 개의 클로저 매개변수를 받습니다. 첫 번째 클로저는 Publisher로부터 방출된 값에 대한 처리를 담당하고, 두 번째 클로저는 Publisher가 완료되었을 때의 처리를 담당합니다.\n\n 값 처리 클로저는 Publisher로부터 방출된 값을 전달받아 해당 값을 처리하는 로직을 구현합니다. 완료 처리 클로저는 Publisher가 완료되었을 때 호출되며, 완료 이벤트를 처리하는 로직을 구현합니다.\n\n `sink` 메서드는 `AnyCancellable` 객체를 반환하므로, 이를 적절히 보관하여 구독을 취소할 수 있습니다. 예를 들어, 뷰가 사라지거나 더 이상 필요하지 않은 경우 `cancel()` 메서드를 호출하여 구독을 취소할 수 있습니다.\n\n `sink` 메서드는 SwiftUI에서 Combine과 함께 사용되며, Combine Publisher에서 값을 받아 UI를 업데이트하거나 앱의 상태를 변경하는 데 유용합니다.",
             
             "`throttle`과 `debounce`는 둘 다 데이터 흐름을 제어하기 위해 사용되는 개념입니다. 주로 사용자 입력과 같은 실시간 이벤트 처리에 유용합니다. 그러나 `throttle`과 `debounce`는 데이터를 언제 방출할지 결정하는 방식에서 차이가 있습니다.\n\n1. Throttle (스로틀):\n- `throttle`은 일정한 시간 간격으로 데이터를 방출하는 방식입니다.\n- 입력된 데이터가 연속적으로 발생할 때, 일정한 시간 간격으로 가장 최근의 데이터만 방출하고 나머지 데이터는 무시합니다.\n- 예를 들어, 1초마다 `throttle`을 설정한 경우, 연속적인 5개의 데이터가 입력되면 가장 최근의 데이터만 방출되고 나머지는 무시됩니다.\n- 사용자 입력을 처리할 때 반응 시간을 제어하는 데 유용합니다.\n\n 2. Debounce (디바운스):\n- `debounce`는 마지막 데이터가 방출된 후 일정 시간이 경과한 뒤에만 데이터를 방출하는 방식입니다.\n- 입력된 데이터가 연속적으로 발생할 때, 마지막 데이터가 방출된 후 일정 시간 동안 새로운 데이터가 없으면 해당 데이터를 방출합니다.\n- 예를 들어, 1초의 `debounce`를 설정한 경우, 연속적인 5개의 데이터가 입력되더라도 마지막 데이터가 방출된 후 1초 동안 새로운 데이터가 없으면 해당 데이터가 방출됩니다.\n- 검색 기능이나 자동 완성 기능 등에서 사용자의 입력이 완료된 후에만 실시간 처리를 수행하는 데 유용합니다.\n\n 간단히 말하면, `throttle`은 데이터를 일정한 간격으로 제한하여 방출하고, `debounce`는 마지막 데이터가 방출된 후 일정 시간 동안 새로운 데이터가 없을 때만 방출합니다. 선택해야 하는 적절한 방식은 사용 사례 및 요구 사항에 따라 달라집니다.",
             
             "Combine을 사용하여 데이터 바인딩을 구현하는 방법은 다음과 같습니다:\n\n 1. Publisher와 Subscriber 설정:\n - 바인딩할 데이터는 `@Published` 속성으로 선언되어야 합니다. 이렇게 하면 해당 속성이 변경될 때마다 Combine Publisher로 자동으로 변환됩니다.\n - Combine Subscriber로서 동작할 SwiftUI 뷰는 `@ObservedObject`나 `@StateObject`로 해당 데이터를 구독해야 합니다.\n\n 2. 데이터 바인딩:\n - SwiftUI 뷰에서 바인딩할 데이터를 사용할 위치에서 `$` 접두사를 사용하여 해당 데이터를 바인딩합니다.\n\n 3. 데이터 변경 및 업데이트:\n - 데이터를 업데이트하려면 해당 데이터를 가진 ObservableObject의 속성을 변경하면 됩니다.\n - Combine의 `@Published` 속성을 통해 데이터 변경이 발생하면 SwiftUI는 해당 데이터를 구독하고 있는 뷰를 자동으로 업데이트합니다.\n\n 위의 과정을 통해 Combine을 사용하여 데이터 바인딩을 구현할 수 있습니다. Combine은 데이터의 변경을 추적하고 SwiftUI에서 자동으로 UI를 업데이트하는 강력한 도구입니다."
             
             
             
            ])
        ]
    )
}
    

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
            
        }
    }
    
    func fetchQA() {
        FireStoreService().fetchData(doc: "UI") { qa in
            self.questionsToUI = qa.question
            self.answersToUI = qa.answer
        }
        
        FireStoreService().fetchData(doc: "iOS") { qa in
            self.questionsToiOS = qa.question
            self.answersToiOS = qa.answer
        }
    }
}

//func setData(){
//    let db = Firestore.firestore()
//    db.collection("iOS").document("iOS").updateData()
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


//
//  LoginReactor.swift
//  Bidit
//


import Foundation
import ReactorKit
import KakaoSDKUser
import RxSwift
import Apollo
import KeychainSwift
import RxRelay

class LoginReactor : Reactor {
    
    var disposeBag: DisposeBag = DisposeBag()
    var finalPassed = PublishRelay<Bool>() //view -> ViewModel //로그인 통과 여부 .

    func switchLoginPassed(_ status : Bool){
        if(status){
            finalPassed.accept(true)
        }else{
            finalPassed.accept(false)
        }
    }
   
    enum Action {
        case tapKakaoLoginBtn //카카오 로그인 버튼 클릭
        case successKakaoLoginRequest
    }
    enum Mutation{
        case loginKakao
        case loginFail
    }
    
    enum LoginType {
        case null
        case kakao
        case naver
        case apple
    }
    
    struct State{
        var loginType = LoginType.null
        var loginPassed = false
        
    }
    let initialState: State
    
    init(){
        self.initialState = State()
    }
    //API요청과 같은 side effect가 mutate에서 수행
    func mutate(action: Action) -> Observable<Mutation> {
        

        var observable : Observable<Mutation>!
        
      switch action {
      case .tapKakaoLoginBtn:
          
          // 카카오톡 설치 여부 확인후 로그인
          if (UserApi.isKakaoTalkLoginAvailable()) {
              //로그인할 때 핸들러로 oauthToken을 받아옴. 이것이 가지고 있는 accessToken을 이용.
              UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                  if let error = error {
                      print(error)
                  }
                  else {
                      print("loginWithKakaoTalk() success.")

                      print("token : \(oauthToken?.accessToken)")
                      //do something
                      let keyChain = TokenManager.sharedKeyChain
                      keyChain.set((oauthToken?.accessToken)!,forKey: "loginKeychainKey")
                     // let signInRequest = SignInRequest(name : "")
//                      return Observable.just(URLs[index])
//                          .flatMap({ self.network.load(url: $0) })
//                          .map({ Mutation.setImage(image: $0) })
                      
                      
                      Network.shared.apollo.perform(mutation: MyQueryMutation()){result in
                          switch result {
                          case .success(let data) :
                              print("success \(data)")
                              
                              self.switchLoginPassed(true)
                              break
                          case .failure(let error) :
                              print("error : \(error)")

                              //self.passed = false
                          }
                      }
//                      Network.shared.apollo.rx
//                          .perform(mutation: MyQueryMutation()).asObservable().subscribe(onNext : { result in
//                              switch result.addUser?.status {
//                              case 1 :
//                                print("success")
//                                //self.passed = true
//
//
//                                break
//                              case 0 :
//                                 print("error")
//                                 //self.passed = false
//                              case .none:
//                                  print("none")
//                              case .some(_):
//                                  print("some")
//                              }
//                          }).disposed(by: self.disposeBag)
//
                      }
                      
                  }
              }
          
          return Observable<Mutation>.just(.loginKakao)
    
    
          
      case .successKakaoLoginRequest:
         
          print("success kakao Login")
          return Observable<Mutation>.just(.loginKakao)
      }

    func reduce(state: State, mutation: Mutation) -> State {
      var state = state
      switch mutation {
      case .loginFail:
          state.loginType = .kakao
          state.loginPassed = false
          print("로그인 실패")
          
      case .loginKakao:
          state.loginType = .kakao
          state.loginPassed = true
//          if self.finalPassed == false {
//              state.loginPassed = false
//          }
          print("로그인 성공")
          
      }
      return state
    
    }
    
}
    
    
}

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
import KakaoSDKAuth
import KakaoSDKCommon

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
        case viewDidLoad
    }
    
    enum Mutation{
        case loginKakao
        case loginFail
        case autoLogin
       // case pleaseKakaoInstall
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
        var autoLogin = false
    }
    
    let initialState: State
    init(){
        self.initialState = State()
    }
    
    //API요청과 같은 side effect가 mutate에서 수행
    func mutate(action: Action) -> Observable<Mutation> {
    
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
                      print("token : \(String(describing: oauthToken?.accessToken))")
                      //do something
                      UserDefaults.standard.set("kakao", forKey: "LoginState")
                      
                      let keyChain = TokenManager.sharedKeyChain
                      keyChain.set((oauthToken?.accessToken)!,forKey: "kakao")
                      
                   //me호출 먼저 실행하여 로그인 시도
                      Network.shared.apollo.fetch(query: MeQuery()){result in
                          switch result {
                          case .success(let data) :
                              print("success \(data)")
                              UserDefaults.standard.set(data.data?.me?.id, forKey: "userId")
                              UserDefaults.standard.set(data.data?.me?.nickname ?? data.data?.me?.email, forKey: "userName")
                              print("카카오톡 로그인 성공")
                              self.switchLoginPassed(true)
                              break
                          case .failure(let error) :
                              print("error : \(error)")
                              //self.passed = false
                              //실패하면 가입 시도
                              
                              Network.shared.apollo.perform(mutation: MyQueryMutation()){result in
                                  switch result {
                                  case .success(let data) :
                                      print("success \(data)")
                                      UserDefaults.standard.set("kakao", forKey: "LoginState")
                                      UserDefaults.standard.set(data.data?.addUser?.id, forKey: "userId")
                                      UserDefaults.standard.set(data.data?.addUser?.email ?? data.data?.addUser?.id, forKey: "userName")

                                      self.switchLoginPassed(true)
                                      break
                                  case .failure(let error) :
                                      print("error : \(error)")
                                      //self.passed = false
                                      break
                                  }
                              }
                          }
                      }
                  }
              }
          }else{
              // 설치 안 되어 있는 경우.
              print("카카오톡 설치 안 됨")
          }
          return Observable<Mutation>.just(.loginKakao)
            
        case .successKakaoLoginRequest:
          print("success kakao Login")
          return Observable<Mutation>.just(.loginKakao)
            
        case .viewDidLoad: //not used
            if (UserApi.isKakaoTalkLoginAvailable()) {
                //로그인할 때 핸들러로 oauthToken을 받아옴. 이것이 가지고 있는 accessToken을 이용
                // 토큰 존재 여부 확인하기
                if (AuthApi.hasToken()) {
                    UserApi.shared.accessTokenInfo { ( accessTokenInfo, error) in
                        if let error = error {
                            if let sdkError = error as? SdkError, sdkError.isInvalidTokenError() == true  {
                                //로그인 필요
                                print("로그인 해야함")
                            }
                            else {
                                //기타 에러
                            }
                        }
                        else {
                            //토큰 유효성 체크 성공(필요 시 토큰 갱신됨)
                            print("로그인 성공 : 토큰 정보  ")
                            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                                if let error = error {
                                    print(error)
                                }
                                else {
                                    print("loginWithKakaoTalk() success.")
                                    print("token : \(oauthToken?.accessToken)")
                                    
                                    //do something
                                    let keyChain = TokenManager.sharedKeyChain
                                    
                                    keyChain.set((oauthToken?.accessToken)!,forKey: "Kakao")
                                    keyChain.set((oauthToken?.accessToken)!,forKey: "meKeychainKey")
                                    
                                    Network.shared.apollo.fetch(query: MeQuery()){result in
                                        switch result {
                                        case .success(let data) :
                                            print("success \(data)")
                                            UserDefaults.standard.set(data.data?.me?.nickname ?? data.data?.me?.email, forKey: "userName")
                                            UserDefaults.standard.set(data.data?.me?.id , forKey: "userId")
                                            self.switchLoginPassed(true)
                                            break
                                        case .failure(let error) :
                                            print("error : \(error)")
                                            //self.passed = false
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
            }
            else {
                //로그인 필요
            }
            UserApi.shared.accessTokenInfo {(accessTokenInfo, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("엑세스 토큰 정보 가져오기 성공")
                    print("로그인 성공 : 토큰 정보 \(accessTokenInfo)")
                    _ = accessTokenInfo
                }
            }
            
            return Observable<Mutation>.just(.autoLogin)
        }
        
        func reduce(state: State, mutation: Mutation) -> State {
            var state = state
            switch mutation {
            case .loginFail:
                state.loginType = .kakao
                state.loginPassed = false
                print("로그인 실패")
                break
                
            case .loginKakao:
                state.loginType = .kakao
                state.loginPassed = true
                //          if self.finalPassed == false {
                //              state.loginPassed = false
                //          }
                print("로그인 성공")
                break
            case .autoLogin :
                state.autoLogin = true
                break
            }
            return state
        }
    }
}

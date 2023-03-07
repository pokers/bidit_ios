//
//  Network.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/22.
//

import Foundation
import Apollo
import KeychainSwift
import RxSwift
import RxApolloClient

class Network{
    
    static let shared = Network()
    
    
    //    private(set) lazy var apollo =  ApolloClient(url: URL(string:
    //    var token = ""
    
    private(set) lazy var apollo: ApolloClient = {
        let client = URLSessionClient()
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let provider = NetworkInterceptorProvider(client: client, store: store)
        let url = URL(string: PrivateKey().GRAPHQL_URL)!
        let transport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                     endpointURL: url)
        return ApolloClient(networkTransport: transport, store: store)
    }()
    
    //    func fetch<Query: GraphQLQuery>(
    //        query: Query,
    //        cachePolicy: CachePolicy = .default,
    //        queue: DispatchQueue = DispatchQueue.main
    //      ) -> Observable<Query.Data> {
    //        return self.apollo.rx
    //          .fetch(query: query,
    //                 cachePolicy: cachePolicy,
    //                 queue: queue)
    //          .asObservable()
    //      }
    
    func rxFetch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy = .default,
        queue: DispatchQueue = DispatchQueue.main
      ) -> Observable<Query.Data> {
        return self.apollo.rx
          .fetch(query: query,
                 cachePolicy: cachePolicy,
                 queue: queue)
          .asObservable()
      }
//    
//
//    func perform<Query : GraphQLMutation>(
//        query : Query,
//        cachePolicy: CachePolicy = .default,
//        queue: DispatchQueue = DispatchQueue.main
//    ) ->Observable<Query.Data> {
//        return self.apollo.rx
//            .perform(mutation: query)
//            .asObservable()
//
////        apollo.rx.perfom
//    }

}

class TokenAddingInterceptor: ApolloInterceptor {
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {

            //현재 로그인 SNS확인
            let nowLoginState = UserDefaults.standard.string(forKey: "LoginState")
            var forKey = ""
            if nowLoginState!.elementsEqual("kakao") {
                forKey = "kakao"
            }else if nowLoginState!.elementsEqual("apple"){
                forKey = "apple"
            }
        // TODO
        let keychain = TokenManager.sharedKeyChain
            let token = "\(String(describing: keychain.get(forKey) ?? "")) \(forKey)"
            print("login token : \(token)")
            
            
        
            request.addHeader(name: "Authorization", value: "Bearer \((token))")
        
            print("Authorization : Bearer \(token)")
           
        // else do nothing

        chain.proceedAsync(request: request,
                            response: response,
                            completion: completion)
    }
}

class NetworkInterceptorProvider: DefaultInterceptorProvider {
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(TokenAddingInterceptor(), at: 0)
        
        return interceptors
    }
}

//class NetworkInterceptorProvider: DefaultInterceptorProvider {
//    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
//        var interceptors = super.interceptors(for: operation)
//        interceptors.insert(CustomInterceptor(), at: 0)
//        return interceptors
//    }
//}
//class CustomInterceptor: ApolloInterceptor {
//
//    func interceptAsync<Operation: GraphQLOperation>(
//        chain: RequestChain,
//        request: HTTPRequest<Operation>,
//        response: HTTPResponse<Operation>?,
//        completion: @escaping (Swift.Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
//        request.addHeader(name: "Authorization", value: "Bearer VZbB-J16Vp1dsN1SRBOB5ATzC8HxNLoDcQDVXxZEIyb0e8lddcf6mQ==")
//
//        print("request :\(request)")
//        print("response :\(String(describing: response))")
//
//        chain.proceedAsync(request: request,
//                           response: response,
//                           completion: completion)
//    }
//}

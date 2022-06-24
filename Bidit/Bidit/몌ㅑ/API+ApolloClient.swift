//
//  API+ApolloClient.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/22.
//

import Foundation
import Apollo

extension MyAPI {
  private enum Constants {
    static let requestTimeoutSeconds = 30.0
    static let endpoint = URL(string: "https://wypcpelqdbhlxgrexisgez7vba.appsync-api.ap-northeast-2.amazonaws.com/graphql")!
  }
  
  private var client: ApolloClient {
      
    let sessionConfiguration = URLSessionConfiguration.default
    sessionConfiguration.timeoutIntervalForRequest = Constants.requestTimeoutSeconds
    let sessionClient = URLSessionClient(sessionConfiguration: sessionConfiguration, callbackQueue: .main)

    let store = ApolloStore(cache: InMemoryNormalizedCache())
    let networkInterceptorProvider = NetworkInterceptorProvider(store: store, client: sessionClient)
    let requestChainNetworkTransport = RequestChainNetworkTransport(
      interceptorProvider: networkInterceptorProvider,
      endpointURL: Constants.endpoint
    )
    return ApolloClient(networkTransport: requestChainNetworkTransport, store: store)
  }
  

  private struct NetworkInterceptorProvider: InterceptorProvider {
    private let store: ApolloStore
    private let client: URLSessionClient
    
    init(store: ApolloStore,
         client: URLSessionClient) {
      self.store = store
      self.client = client
    }
    
    func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
      return [
        MaxRetryInterceptor(),
        CacheReadInterceptor(store: self.store),
        HeaderInterceptor(),
        RequestLoggingInterceptor(),
        NetworkFetchInterceptor(client: self.client),
        ResponseLoggingInterceptor(),
        ResponseCodeInterceptor(),
        JSONResponseParsingInterceptor(cacheKeyForObject: self.store.cacheKeyForObject),
        AutomaticPersistedQueryInterceptor(),
        CacheWriteInterceptor(store: self.store)
      ]
    }
  }
  

  private class HeaderInterceptor: ApolloInterceptor {
    enum UserError: Error {
      case noUserLoggedIn
    }
    
    func interceptAsync<Operation: GraphQLOperation>(
      chain: RequestChain,
      request: HTTPRequest<Operation>,
      response: HTTPResponse<Operation>?,
      completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
      request.addHeader(name: "Language", value: Locale.current.languageCode ?? "*")
      
      guard let token = TokenManager.shared.token else {
        chain.handleErrorAsync(UserError.noUserLoggedIn,
                               request: request,
                               response: response,
                               completion: completion)
        return
      }
      
      if token.isExpired {
        TokenManager.shared.renewToken { [weak self] tokenRenewResult in
          guard let self = self else {
            return
          }
          
          switch tokenRenewResult {
          case .failure(let error):
            chain.handleErrorAsync(
              error,
              request: request,
              response: response,
              completion: completion
            )
          case .success(let token):
            self.addTokenAndProceed(
              token,
              to: request,
              chain: chain,
              response: response,
              completion: completion
            )
          }
        }
      } else {
        self.addTokenAndProceed(
          token,
          to: request,
          chain: chain,
          response: response,
          completion: completion
        )
      }
    }
    private func addTokenAndProceed<Operation: GraphQLOperation>(
      _ token: Token,
      to request: HTTPRequest<Operation>,
      chain: RequestChain,
      response: HTTPResponse<Operation>?,
      completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>
      ) -> Void) {
      request.addHeader(name: "Authorization", value: "Bearer \(token.value)")
      chain.proceedAsync(request: request,
                         response: response,
                         completion: completion)
    }
  }
  
  // https://www.apollographql.com/docs/ios/request-pipeline/#requestlogginginterceptor
  private struct RequestLoggingInterceptor: ApolloInterceptor {
    func interceptAsync<Operation: GraphQLOperation>(
      chain: RequestChain,
      request: HTTPRequest<Operation>,
      response: HTTPResponse<Operation>?,
      completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
//        Logger.log(.debug, "Outgoing request: \(request)")
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
      }
  }
  
  // https://www.apollographql.com/docs/ios/request-pipeline/#responselogginginterceptor
  private struct ResponseLoggingInterceptor: ApolloInterceptor {
    enum ResponseLoggingError: Error {
      case notYetReceived
    }
    func interceptAsync<Operation: GraphQLOperation>(
      chain: RequestChain,
      request: HTTPRequest<Operation>,
      response: HTTPResponse<Operation>?,
      completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
        defer {
          chain.proceedAsync(request: request,
                             response: response,
                             completion: completion)
        }
        
        guard let receivedResponse = response else {
          chain.handleErrorAsync(ResponseLoggingError.notYetReceived,
                                 request: request,
                                 response: response,
                                 completion: completion)
          return
        }
        
//        Logger.log(.debug, "HTTP Response: \(receivedResponse.httpResponse)")
        if let stringData = String(bytes: receivedResponse.rawData, encoding: .utf8) {
//          Logger.log(.debug, "Data: \(stringData)")
        } else {
//          Logger.log(.error, "Could not convert data to string!")
        }
      }
  }
}

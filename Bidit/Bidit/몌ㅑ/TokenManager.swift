//
//  TokenManager.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/06/22.
//
import Foundation
import KeychainSwift
class TokenManager {
  enum RenewError: Error {
    case unknown
  }
    
    
    static let sharedKeyChain = KeychainSwift()
  
  static let shared = TokenManager()
  
  var token: Token? = Token()
  
  func renewToken(completion: @escaping (Result<Token, RenewError>) -> Void) {
    completion(.success(Token()))
  }
  
  private init() {}
}

struct Token {
  let value = "test-token"
  var isExpired: Bool { Bool.random() }
}

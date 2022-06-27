// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// MyAPI namespace
public extension MyAPI {
  final class MyQueryMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation MyQuery {
        addUser {
          __typename
          id
          status
          kakaoAccount {
            __typename
            id
          }
        }
      }
      """

    public let operationName: String = "MyQuery"

    public init() {
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("addUser", type: .object(AddUser.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(addUser: AddUser? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "addUser": addUser.flatMap { (value: AddUser) -> ResultMap in value.resultMap }])
      }

      public var addUser: AddUser? {
        get {
          return (resultMap["addUser"] as? ResultMap).flatMap { AddUser(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "addUser")
        }
      }

      public struct AddUser: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .nonNull(.scalar(Int.self))),
            GraphQLField("kakaoAccount", type: .object(KakaoAccount.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, status: Int, kakaoAccount: KakaoAccount? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "status": status, "kakaoAccount": kakaoAccount.flatMap { (value: KakaoAccount) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var status: Int {
          get {
            return resultMap["status"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }

        public var kakaoAccount: KakaoAccount? {
          get {
            return (resultMap["kakaoAccount"] as? ResultMap).flatMap { KakaoAccount(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "kakaoAccount")
          }
        }

        public struct KakaoAccount: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["KakaoAccount"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String) {
            self.init(unsafeResultMap: ["__typename": "KakaoAccount", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }
      }
    }
  }
}

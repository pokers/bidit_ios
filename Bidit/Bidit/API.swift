// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct ItemQueryInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - id
  ///   - status
  ///   - userId
  ///   - categoryId
  ///   - name
  ///   - dueDate
  ///   - deliveryType
  ///   - sCondition
  ///   - aCondition
  ///   - createdAt
  public init(id: Swift.Optional<Int?> = nil, status: Swift.Optional<Int?> = nil, userId: Swift.Optional<Int?> = nil, categoryId: Swift.Optional<Int?> = nil, name: Swift.Optional<String?> = nil, dueDate: Swift.Optional<String?> = nil, deliveryType: Swift.Optional<Int?> = nil, sCondition: Swift.Optional<Int?> = nil, aCondition: Swift.Optional<Int?> = nil, createdAt: Swift.Optional<Int?> = nil) {
    graphQLMap = ["id": id, "status": status, "userId": userId, "categoryId": categoryId, "name": name, "dueDate": dueDate, "deliveryType": deliveryType, "sCondition": sCondition, "aCondition": aCondition, "createdAt": createdAt]
  }

  public var id: Swift.Optional<Int?> {
    get {
      return graphQLMap["id"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var status: Swift.Optional<Int?> {
    get {
      return graphQLMap["status"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var userId: Swift.Optional<Int?> {
    get {
      return graphQLMap["userId"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userId")
    }
  }

  public var categoryId: Swift.Optional<Int?> {
    get {
      return graphQLMap["categoryId"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "categoryId")
    }
  }

  public var name: Swift.Optional<String?> {
    get {
      return graphQLMap["name"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var dueDate: Swift.Optional<String?> {
    get {
      return graphQLMap["dueDate"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "dueDate")
    }
  }

  public var deliveryType: Swift.Optional<Int?> {
    get {
      return graphQLMap["deliveryType"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "deliveryType")
    }
  }

  public var sCondition: Swift.Optional<Int?> {
    get {
      return graphQLMap["sCondition"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "sCondition")
    }
  }

  public var aCondition: Swift.Optional<Int?> {
    get {
      return graphQLMap["aCondition"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "aCondition")
    }
  }

  public var createdAt: Swift.Optional<Int?> {
    get {
      return graphQLMap["createdAt"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "createdAt")
    }
  }
}

public enum JoinPath: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case kakao
  case apple
  case google
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "KAKAO": self = .kakao
      case "APPLE": self = .apple
      case "GOOGLE": self = .google
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .kakao: return "KAKAO"
      case .apple: return "APPLE"
      case .google: return "GOOGLE"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: JoinPath, rhs: JoinPath) -> Bool {
    switch (lhs, rhs) {
      case (.kakao, .kakao): return true
      case (.apple, .apple): return true
      case (.google, .google): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [JoinPath] {
    return [
      .kakao,
      .apple,
      .google,
    ]
  }
}

public struct BidInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - status
  ///   - itemId
  ///   - price
  public init(status: Swift.Optional<Int?> = nil, itemId: Int, price: Int) {
    graphQLMap = ["status": status, "itemId": itemId, "price": price]
  }

  public var status: Swift.Optional<Int?> {
    get {
      return graphQLMap["status"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var itemId: Int {
    get {
      return graphQLMap["itemId"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "itemId")
    }
  }

  public var price: Int {
    get {
      return graphQLMap["price"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "price")
    }
  }
}

public final class GetEndingSoonItemsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetEndingSoonItems($itemQuery: ItemQueryInput, $keyword: String, $count: Int) {
      getEndingSoonItems(itemQuery: $itemQuery, keyword: $keyword, count: $count) {
        __typename
        id
        name
        status
        title
        dueDate
        sPrice
        cPrice
        buyNow
        updatedAt
      }
    }
    """

  public let operationName: String = "GetEndingSoonItems"

  public var itemQuery: ItemQueryInput?
  public var keyword: String?
  public var count: Int?

  public init(itemQuery: ItemQueryInput? = nil, keyword: String? = nil, count: Int? = nil) {
    self.itemQuery = itemQuery
    self.keyword = keyword
    self.count = count
  }

  public var variables: GraphQLMap? {
    return ["itemQuery": itemQuery, "keyword": keyword, "count": count]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getEndingSoonItems", arguments: ["itemQuery": GraphQLVariable("itemQuery"), "keyword": GraphQLVariable("keyword"), "count": GraphQLVariable("count")], type: .list(.object(GetEndingSoonItem.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getEndingSoonItems: [GetEndingSoonItem?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getEndingSoonItems": getEndingSoonItems.flatMap { (value: [GetEndingSoonItem?]) -> [ResultMap?] in value.map { (value: GetEndingSoonItem?) -> ResultMap? in value.flatMap { (value: GetEndingSoonItem) -> ResultMap in value.resultMap } } }])
    }

    public var getEndingSoonItems: [GetEndingSoonItem?]? {
      get {
        return (resultMap["getEndingSoonItems"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [GetEndingSoonItem?] in value.map { (value: ResultMap?) -> GetEndingSoonItem? in value.flatMap { (value: ResultMap) -> GetEndingSoonItem in GetEndingSoonItem(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [GetEndingSoonItem?]) -> [ResultMap?] in value.map { (value: GetEndingSoonItem?) -> ResultMap? in value.flatMap { (value: GetEndingSoonItem) -> ResultMap in value.resultMap } } }, forKey: "getEndingSoonItems")
      }
    }

    public struct GetEndingSoonItem: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Item"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("status", type: .nonNull(.scalar(Int.self))),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("dueDate", type: .scalar(String.self)),
          GraphQLField("sPrice", type: .scalar(Int.self)),
          GraphQLField("cPrice", type: .scalar(Int.self)),
          GraphQLField("buyNow", type: .scalar(Int.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String? = nil, status: Int, title: String? = nil, dueDate: String? = nil, sPrice: Int? = nil, cPrice: Int? = nil, buyNow: Int? = nil, updatedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Item", "id": id, "name": name, "status": status, "title": title, "dueDate": dueDate, "sPrice": sPrice, "cPrice": cPrice, "buyNow": buyNow, "updatedAt": updatedAt])
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

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
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

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var dueDate: String? {
        get {
          return resultMap["dueDate"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "dueDate")
        }
      }

      public var sPrice: Int? {
        get {
          return resultMap["sPrice"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "sPrice")
        }
      }

      public var cPrice: Int? {
        get {
          return resultMap["cPrice"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "cPrice")
        }
      }

      public var buyNow: Int? {
        get {
          return resultMap["buyNow"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "buyNow")
        }
      }

      public var updatedAt: String? {
        get {
          return resultMap["updatedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class MeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Me {
      me {
        __typename
        id
        status
        nickname
        passwd
        joinPath
        email
        phone
        createdAt
        deletedAt
        description
        items {
          __typename
          totalCount
          pageInfo {
            __typename
            startCursor
            endCursor
            hasNextPage
            hasPrevPage
          }
          edges {
            __typename
            node {
              __typename
              id
              status
              createdAt
              name
              sPrice
              cPrice
              dueDate
              description {
                __typename
                id
                status
                itemId
                description
                createdAt
                updatedAt
                deletedAt
              }
              image {
                __typename
                id
                status
                itemId
                url
                createdAt
                updatedAt
                deletedAt
              }
            }
            cursor
          }
        }
        kakaoAccount {
          __typename
          id
          status
          userId
          nickname
          email
          name
          phone_number
        }
        pushToken {
          __typename
          id
          status
          userId
          token
          createdAt
          updatedAt
        }
      }
    }
    """

  public let operationName: String = "Me"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("me", type: .object(Me.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(me: Me? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "me": me.flatMap { (value: Me) -> ResultMap in value.resultMap }])
    }

    public var me: Me? {
      get {
        return (resultMap["me"] as? ResultMap).flatMap { Me(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "me")
      }
    }

    public struct Me: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .nonNull(.scalar(Int.self))),
          GraphQLField("nickname", type: .scalar(String.self)),
          GraphQLField("passwd", type: .scalar(String.self)),
          GraphQLField("joinPath", type: .scalar(JoinPath.self)),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("deletedAt", type: .scalar(String.self)),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("items", type: .object(Item.selections)),
          GraphQLField("kakaoAccount", type: .object(KakaoAccount.selections)),
          GraphQLField("pushToken", type: .object(PushToken.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, status: Int, nickname: String? = nil, passwd: String? = nil, joinPath: JoinPath? = nil, email: String? = nil, phone: String? = nil, createdAt: String, deletedAt: String? = nil, description: String? = nil, items: Item? = nil, kakaoAccount: KakaoAccount? = nil, pushToken: PushToken? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "status": status, "nickname": nickname, "passwd": passwd, "joinPath": joinPath, "email": email, "phone": phone, "createdAt": createdAt, "deletedAt": deletedAt, "description": description, "items": items.flatMap { (value: Item) -> ResultMap in value.resultMap }, "kakaoAccount": kakaoAccount.flatMap { (value: KakaoAccount) -> ResultMap in value.resultMap }, "pushToken": pushToken.flatMap { (value: PushToken) -> ResultMap in value.resultMap }])
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

      public var nickname: String? {
        get {
          return resultMap["nickname"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "nickname")
        }
      }

      public var passwd: String? {
        get {
          return resultMap["passwd"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "passwd")
        }
      }

      public var joinPath: JoinPath? {
        get {
          return resultMap["joinPath"] as? JoinPath
        }
        set {
          resultMap.updateValue(newValue, forKey: "joinPath")
        }
      }

      public var email: String? {
        get {
          return resultMap["email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var phone: String? {
        get {
          return resultMap["phone"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "phone")
        }
      }

      public var createdAt: String {
        get {
          return resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var deletedAt: String? {
        get {
          return resultMap["deletedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "deletedAt")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var items: Item? {
        get {
          return (resultMap["items"] as? ResultMap).flatMap { Item(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "items")
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

      public var pushToken: PushToken? {
        get {
          return (resultMap["pushToken"] as? ResultMap).flatMap { PushToken(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "pushToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ItemConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("totalCount", type: .scalar(Int.self)),
            GraphQLField("pageInfo", type: .object(PageInfo.selections)),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(totalCount: Int? = nil, pageInfo: PageInfo? = nil, edges: [Edge?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "ItemConnection", "totalCount": totalCount, "pageInfo": pageInfo.flatMap { (value: PageInfo) -> ResultMap in value.resultMap }, "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var totalCount: Int? {
          get {
            return resultMap["totalCount"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalCount")
          }
        }

        public var pageInfo: PageInfo? {
          get {
            return (resultMap["pageInfo"] as? ResultMap).flatMap { PageInfo(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "pageInfo")
          }
        }

        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public struct PageInfo: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PageInfo"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("startCursor", type: .scalar(String.self)),
              GraphQLField("endCursor", type: .scalar(String.self)),
              GraphQLField("hasNextPage", type: .scalar(Bool.self)),
              GraphQLField("hasPrevPage", type: .scalar(Bool.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(startCursor: String? = nil, endCursor: String? = nil, hasNextPage: Bool? = nil, hasPrevPage: Bool? = nil) {
            self.init(unsafeResultMap: ["__typename": "PageInfo", "startCursor": startCursor, "endCursor": endCursor, "hasNextPage": hasNextPage, "hasPrevPage": hasPrevPage])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var startCursor: String? {
            get {
              return resultMap["startCursor"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "startCursor")
            }
          }

          public var endCursor: String? {
            get {
              return resultMap["endCursor"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "endCursor")
            }
          }

          public var hasNextPage: Bool? {
            get {
              return resultMap["hasNextPage"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "hasNextPage")
            }
          }

          public var hasPrevPage: Bool? {
            get {
              return resultMap["hasPrevPage"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "hasPrevPage")
            }
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ItemEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("node", type: .object(Node.selections)),
              GraphQLField("cursor", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(node: Node? = nil, cursor: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "ItemEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }, "cursor": cursor])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var node: Node? {
            get {
              return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "node")
            }
          }

          public var cursor: String? {
            get {
              return resultMap["cursor"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "cursor")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Item"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("status", type: .nonNull(.scalar(Int.self))),
                GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("sPrice", type: .scalar(Int.self)),
                GraphQLField("cPrice", type: .scalar(Int.self)),
                GraphQLField("dueDate", type: .scalar(String.self)),
                GraphQLField("description", type: .object(Description.selections)),
                GraphQLField("image", type: .list(.object(Image.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, status: Int, createdAt: String, name: String? = nil, sPrice: Int? = nil, cPrice: Int? = nil, dueDate: String? = nil, description: Description? = nil, image: [Image?]? = nil) {
              self.init(unsafeResultMap: ["__typename": "Item", "id": id, "status": status, "createdAt": createdAt, "name": name, "sPrice": sPrice, "cPrice": cPrice, "dueDate": dueDate, "description": description.flatMap { (value: Description) -> ResultMap in value.resultMap }, "image": image.flatMap { (value: [Image?]) -> [ResultMap?] in value.map { (value: Image?) -> ResultMap? in value.flatMap { (value: Image) -> ResultMap in value.resultMap } } }])
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

            public var createdAt: String {
              get {
                return resultMap["createdAt"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "createdAt")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var sPrice: Int? {
              get {
                return resultMap["sPrice"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "sPrice")
              }
            }

            public var cPrice: Int? {
              get {
                return resultMap["cPrice"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "cPrice")
              }
            }

            public var dueDate: String? {
              get {
                return resultMap["dueDate"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "dueDate")
              }
            }

            public var description: Description? {
              get {
                return (resultMap["description"] as? ResultMap).flatMap { Description(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "description")
              }
            }

            public var image: [Image?]? {
              get {
                return (resultMap["image"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Image?] in value.map { (value: ResultMap?) -> Image? in value.flatMap { (value: ResultMap) -> Image in Image(unsafeResultMap: value) } } }
              }
              set {
                resultMap.updateValue(newValue.flatMap { (value: [Image?]) -> [ResultMap?] in value.map { (value: Image?) -> ResultMap? in value.flatMap { (value: Image) -> ResultMap in value.resultMap } } }, forKey: "image")
              }
            }

            public struct Description: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ItemDescription"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                  GraphQLField("status", type: .nonNull(.scalar(Int.self))),
                  GraphQLField("itemId", type: .nonNull(.scalar(Int.self))),
                  GraphQLField("description", type: .scalar(String.self)),
                  GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
                  GraphQLField("updatedAt", type: .scalar(String.self)),
                  GraphQLField("deletedAt", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: Int, status: Int, itemId: Int, description: String? = nil, createdAt: String, updatedAt: String? = nil, deletedAt: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "ItemDescription", "id": id, "status": status, "itemId": itemId, "description": description, "createdAt": createdAt, "updatedAt": updatedAt, "deletedAt": deletedAt])
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

              public var itemId: Int {
                get {
                  return resultMap["itemId"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "itemId")
                }
              }

              public var description: String? {
                get {
                  return resultMap["description"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "description")
                }
              }

              public var createdAt: String {
                get {
                  return resultMap["createdAt"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "createdAt")
                }
              }

              public var updatedAt: String? {
                get {
                  return resultMap["updatedAt"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "updatedAt")
                }
              }

              public var deletedAt: String? {
                get {
                  return resultMap["deletedAt"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "deletedAt")
                }
              }
            }

            public struct Image: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ItemImage"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                  GraphQLField("status", type: .nonNull(.scalar(Int.self))),
                  GraphQLField("itemId", type: .nonNull(.scalar(Int.self))),
                  GraphQLField("url", type: .scalar(String.self)),
                  GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
                  GraphQLField("updatedAt", type: .scalar(String.self)),
                  GraphQLField("deletedAt", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: Int, status: Int, itemId: Int, url: String? = nil, createdAt: String, updatedAt: String? = nil, deletedAt: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "ItemImage", "id": id, "status": status, "itemId": itemId, "url": url, "createdAt": createdAt, "updatedAt": updatedAt, "deletedAt": deletedAt])
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

              public var itemId: Int {
                get {
                  return resultMap["itemId"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "itemId")
                }
              }

              public var url: String? {
                get {
                  return resultMap["url"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "url")
                }
              }

              public var createdAt: String {
                get {
                  return resultMap["createdAt"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "createdAt")
                }
              }

              public var updatedAt: String? {
                get {
                  return resultMap["updatedAt"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "updatedAt")
                }
              }

              public var deletedAt: String? {
                get {
                  return resultMap["deletedAt"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "deletedAt")
                }
              }
            }
          }
        }
      }

      public struct KakaoAccount: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["KakaoAccount"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("status", type: .nonNull(.scalar(Int.self))),
            GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
            GraphQLField("nickname", type: .scalar(String.self)),
            GraphQLField("email", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("phone_number", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, status: Int, userId: Int, nickname: String? = nil, email: String? = nil, name: String? = nil, phoneNumber: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "KakaoAccount", "id": id, "status": status, "userId": userId, "nickname": nickname, "email": email, "name": name, "phone_number": phoneNumber])
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

        public var status: Int {
          get {
            return resultMap["status"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }

        public var userId: Int {
          get {
            return resultMap["userId"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "userId")
          }
        }

        public var nickname: String? {
          get {
            return resultMap["nickname"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "nickname")
          }
        }

        public var email: String? {
          get {
            return resultMap["email"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var phoneNumber: String? {
          get {
            return resultMap["phone_number"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "phone_number")
          }
        }
      }

      public struct PushToken: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PushToken"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(Int.self)),
            GraphQLField("status", type: .scalar(Int.self)),
            GraphQLField("userId", type: .scalar(Int.self)),
            GraphQLField("token", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .scalar(String.self)),
            GraphQLField("updatedAt", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int? = nil, status: Int? = nil, userId: Int? = nil, token: String? = nil, createdAt: String? = nil, updatedAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "PushToken", "id": id, "status": status, "userId": userId, "token": token, "createdAt": createdAt, "updatedAt": updatedAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int? {
          get {
            return resultMap["id"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var status: Int? {
          get {
            return resultMap["status"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }

        public var userId: Int? {
          get {
            return resultMap["userId"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "userId")
          }
        }

        public var token: String? {
          get {
            return resultMap["token"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "token")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            return resultMap["updatedAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updatedAt")
          }
        }
      }
    }
  }
}

public final class MyQueryMutation: GraphQLMutation {
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

public final class RequestBidMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation requestBid($bidInfo: BidInput!) {
      bid(bid: $bidInfo) {
        __typename
        id
        status
        userId
        itemId
        price
        createdAt
        item {
          __typename
          id
          status
          userId
        }
        user {
          __typename
          id
          status
          createdAt
        }
      }
    }
    """

  public let operationName: String = "requestBid"

  public var bidInfo: BidInput

  public init(bidInfo: BidInput) {
    self.bidInfo = bidInfo
  }

  public var variables: GraphQLMap? {
    return ["bidInfo": bidInfo]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("bid", arguments: ["bid": GraphQLVariable("bidInfo")], type: .object(Bid.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(bid: Bid? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "bid": bid.flatMap { (value: Bid) -> ResultMap in value.resultMap }])
    }

    public var bid: Bid? {
      get {
        return (resultMap["bid"] as? ResultMap).flatMap { Bid(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "bid")
      }
    }

    public struct Bid: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Bidding"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .nonNull(.scalar(Int.self))),
          GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("itemId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("price", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("item", type: .object(Item.selections)),
          GraphQLField("user", type: .object(User.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, status: Int, userId: Int, itemId: Int, price: Int, createdAt: String, item: Item? = nil, user: User? = nil) {
        self.init(unsafeResultMap: ["__typename": "Bidding", "id": id, "status": status, "userId": userId, "itemId": itemId, "price": price, "createdAt": createdAt, "item": item.flatMap { (value: Item) -> ResultMap in value.resultMap }, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
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

      public var userId: Int {
        get {
          return resultMap["userId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "userId")
        }
      }

      public var itemId: Int {
        get {
          return resultMap["itemId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "itemId")
        }
      }

      public var price: Int {
        get {
          return resultMap["price"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "price")
        }
      }

      public var createdAt: String {
        get {
          return resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var item: Item? {
        get {
          return (resultMap["item"] as? ResultMap).flatMap { Item(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "item")
        }
      }

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Item"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .nonNull(.scalar(Int.self))),
            GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, status: Int, userId: Int) {
          self.init(unsafeResultMap: ["__typename": "Item", "id": id, "status": status, "userId": userId])
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

        public var userId: Int {
          get {
            return resultMap["userId"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "userId")
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .nonNull(.scalar(Int.self))),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, status: Int, createdAt: String) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "status": status, "createdAt": createdAt])
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

        public var createdAt: String {
          get {
            return resultMap["createdAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }
      }
    }
  }
}

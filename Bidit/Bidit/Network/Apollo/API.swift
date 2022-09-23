// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct ItemAddInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - status
  ///   - categoryId
  ///   - sPrice
  ///   - buyNow
  ///   - name
  ///   - title
  ///   - dueDate
  ///   - deliveryType
  ///   - sCondition
  ///   - aCondition
  ///   - detail
  public init(status: Swift.Optional<Int?> = nil, categoryId: Int, sPrice: Int, buyNow: Swift.Optional<Int?> = nil, name: String, title: String, dueDate: String, deliveryType: Int, sCondition: Int, aCondition: Int, detail: Swift.Optional<ItemDetailInput?> = nil) {
    graphQLMap = ["status": status, "categoryId": categoryId, "sPrice": sPrice, "buyNow": buyNow, "name": name, "title": title, "dueDate": dueDate, "deliveryType": deliveryType, "sCondition": sCondition, "aCondition": aCondition, "detail": detail]
  }

  public var status: Swift.Optional<Int?> {
    get {
      return graphQLMap["status"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var categoryId: Int {
    get {
      return graphQLMap["categoryId"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "categoryId")
    }
  }

  public var sPrice: Int {
    get {
      return graphQLMap["sPrice"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "sPrice")
    }
  }

  public var buyNow: Swift.Optional<Int?> {
    get {
      return graphQLMap["buyNow"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "buyNow")
    }
  }

  public var name: String {
    get {
      return graphQLMap["name"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var title: String {
    get {
      return graphQLMap["title"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var dueDate: String {
    get {
      return graphQLMap["dueDate"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "dueDate")
    }
  }

  public var deliveryType: Int {
    get {
      return graphQLMap["deliveryType"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "deliveryType")
    }
  }

  public var sCondition: Int {
    get {
      return graphQLMap["sCondition"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "sCondition")
    }
  }

  public var aCondition: Int {
    get {
      return graphQLMap["aCondition"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "aCondition")
    }
  }

  public var detail: Swift.Optional<ItemDetailInput?> {
    get {
      return graphQLMap["detail"] as? Swift.Optional<ItemDetailInput?> ?? Swift.Optional<ItemDetailInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "detail")
    }
  }
}

public struct ItemDetailInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - id
  ///   - status
  ///   - categoryId
  ///   - period
  ///   - type
  ///   - vendor
  ///   - battery
  ///   - flash
  ///   - ram
  ///   - size
  ///   - networkType
  ///   - weight
  ///   - cpu
  ///   - wire
  ///   - lens
  ///   - resolution
  ///   - cam
  ///   - warranty
  public init(id: Swift.Optional<Int?> = nil, status: Swift.Optional<Int?> = nil, categoryId: Swift.Optional<Int?> = nil, period: Swift.Optional<Int?> = nil, type: Swift.Optional<String?> = nil, vendor: Swift.Optional<String?> = nil, battery: Swift.Optional<String?> = nil, flash: Swift.Optional<String?> = nil, ram: Swift.Optional<String?> = nil, size: Swift.Optional<String?> = nil, networkType: Swift.Optional<String?> = nil, weight: Swift.Optional<String?> = nil, cpu: Swift.Optional<String?> = nil, wire: Swift.Optional<String?> = nil, lens: Swift.Optional<String?> = nil, resolution: Swift.Optional<String?> = nil, cam: Swift.Optional<String?> = nil, warranty: Swift.Optional<String?> = nil) {
    graphQLMap = ["id": id, "status": status, "categoryId": categoryId, "period": period, "type": type, "vendor": vendor, "battery": battery, "flash": flash, "ram": ram, "size": size, "networkType": networkType, "weight": weight, "cpu": cpu, "wire": wire, "lens": lens, "resolution": resolution, "cam": cam, "warranty": warranty]
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

  public var categoryId: Swift.Optional<Int?> {
    get {
      return graphQLMap["categoryId"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "categoryId")
    }
  }

  public var period: Swift.Optional<Int?> {
    get {
      return graphQLMap["period"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "period")
    }
  }

  public var type: Swift.Optional<String?> {
    get {
      return graphQLMap["type"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var vendor: Swift.Optional<String?> {
    get {
      return graphQLMap["vendor"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "vendor")
    }
  }

  public var battery: Swift.Optional<String?> {
    get {
      return graphQLMap["battery"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "battery")
    }
  }

  public var flash: Swift.Optional<String?> {
    get {
      return graphQLMap["flash"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "flash")
    }
  }

  public var ram: Swift.Optional<String?> {
    get {
      return graphQLMap["ram"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ram")
    }
  }

  public var size: Swift.Optional<String?> {
    get {
      return graphQLMap["size"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "size")
    }
  }

  public var networkType: Swift.Optional<String?> {
    get {
      return graphQLMap["networkType"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "networkType")
    }
  }

  public var weight: Swift.Optional<String?> {
    get {
      return graphQLMap["weight"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "weight")
    }
  }

  public var cpu: Swift.Optional<String?> {
    get {
      return graphQLMap["cpu"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cpu")
    }
  }

  public var wire: Swift.Optional<String?> {
    get {
      return graphQLMap["wire"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "wire")
    }
  }

  public var lens: Swift.Optional<String?> {
    get {
      return graphQLMap["lens"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lens")
    }
  }

  public var resolution: Swift.Optional<String?> {
    get {
      return graphQLMap["resolution"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "resolution")
    }
  }

  public var cam: Swift.Optional<String?> {
    get {
      return graphQLMap["cam"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cam")
    }
  }

  public var warranty: Swift.Optional<String?> {
    get {
      return graphQLMap["warranty"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "warranty")
    }
  }
}

public struct BiddingQueryInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - status
  ///   - itemId
  ///   - price
  public init(status: Swift.Optional<Int?> = nil, itemId: Swift.Optional<Int?> = nil, price: Swift.Optional<Int?> = nil) {
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

  public var itemId: Swift.Optional<Int?> {
    get {
      return graphQLMap["itemId"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "itemId")
    }
  }

  public var price: Swift.Optional<Int?> {
    get {
      return graphQLMap["price"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "price")
    }
  }
}

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

public enum CursorType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case createdAt
  case dueDate
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "createdAt": self = .createdAt
      case "dueDate": self = .dueDate
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .createdAt: return "createdAt"
      case .dueDate: return "dueDate"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: CursorType, rhs: CursorType) -> Bool {
    switch (lhs, rhs) {
      case (.createdAt, .createdAt): return true
      case (.dueDate, .dueDate): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [CursorType] {
    return [
      .createdAt,
      .dueDate,
    ]
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

public struct ItemUpdateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - status
  ///   - categoryId
  ///   - sPrice
  ///   - buyNow
  ///   - name
  ///   - title
  ///   - dueDate
  ///   - deliveryType
  ///   - sCondition
  ///   - aCondition
  ///   - detail
  public init(status: Swift.Optional<Int?> = nil, categoryId: Swift.Optional<Int?> = nil, sPrice: Swift.Optional<Int?> = nil, buyNow: Swift.Optional<Int?> = nil, name: Swift.Optional<String?> = nil, title: Swift.Optional<String?> = nil, dueDate: Swift.Optional<String?> = nil, deliveryType: Swift.Optional<Int?> = nil, sCondition: Swift.Optional<Int?> = nil, aCondition: Swift.Optional<Int?> = nil, detail: Swift.Optional<ItemDetailInput?> = nil) {
    graphQLMap = ["status": status, "categoryId": categoryId, "sPrice": sPrice, "buyNow": buyNow, "name": name, "title": title, "dueDate": dueDate, "deliveryType": deliveryType, "sCondition": sCondition, "aCondition": aCondition, "detail": detail]
  }

  public var status: Swift.Optional<Int?> {
    get {
      return graphQLMap["status"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
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

  public var sPrice: Swift.Optional<Int?> {
    get {
      return graphQLMap["sPrice"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "sPrice")
    }
  }

  public var buyNow: Swift.Optional<Int?> {
    get {
      return graphQLMap["buyNow"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "buyNow")
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

  public var title: Swift.Optional<String?> {
    get {
      return graphQLMap["title"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
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

  public var detail: Swift.Optional<ItemDetailInput?> {
    get {
      return graphQLMap["detail"] as? Swift.Optional<ItemDetailInput?> ?? Swift.Optional<ItemDetailInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "detail")
    }
  }
}

public struct ItemImageUpdateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - itemImageId
  ///   - image
  public init(itemImageId: Swift.Optional<Int?> = nil, image: Swift.Optional<String?> = nil) {
    graphQLMap = ["itemImageId": itemImageId, "image": image]
  }

  public var itemImageId: Swift.Optional<Int?> {
    get {
      return graphQLMap["itemImageId"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "itemImageId")
    }
  }

  public var image: Swift.Optional<String?> {
    get {
      return graphQLMap["image"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "image")
    }
  }
}

public enum MembershipStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case valid
  case invalid
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "VALID": self = .valid
      case "INVALID": self = .invalid
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .valid: return "VALID"
      case .invalid: return "INVALID"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MembershipStatus, rhs: MembershipStatus) -> Bool {
    switch (lhs, rhs) {
      case (.valid, .valid): return true
      case (.invalid, .invalid): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MembershipStatus] {
    return [
      .valid,
      .invalid,
    ]
  }
}

public struct userUpdateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - status
  ///   - nickname
  ///   - gender
  ///   - birth
  ///   - deletedAt
  ///   - description
  public init(status: Swift.Optional<Int?> = nil, nickname: Swift.Optional<String?> = nil, gender: Swift.Optional<gender?> = nil, birth: Swift.Optional<String?> = nil, deletedAt: Swift.Optional<String?> = nil, description: Swift.Optional<String?> = nil) {
    graphQLMap = ["status": status, "nickname": nickname, "gender": gender, "birth": birth, "deletedAt": deletedAt, "description": description]
  }

  public var status: Swift.Optional<Int?> {
    get {
      return graphQLMap["status"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var nickname: Swift.Optional<String?> {
    get {
      return graphQLMap["nickname"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "nickname")
    }
  }

  public var gender: Swift.Optional<gender?> {
    get {
      return graphQLMap["gender"] as? Swift.Optional<gender?> ?? Swift.Optional<gender?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gender")
    }
  }

  public var birth: Swift.Optional<String?> {
    get {
      return graphQLMap["birth"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "birth")
    }
  }

  public var deletedAt: Swift.Optional<String?> {
    get {
      return graphQLMap["deletedAt"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "deletedAt")
    }
  }

  public var description: Swift.Optional<String?> {
    get {
      return graphQLMap["description"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }
}

public enum gender: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case male
  case female
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "MALE": self = .male
      case "FEMALE": self = .female
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .male: return "MALE"
      case .female: return "FEMALE"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: gender, rhs: gender) -> Bool {
    switch (lhs, rhs) {
      case (.male, .male): return true
      case (.female, .female): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [gender] {
    return [
      .male,
      .female,
    ]
  }
}

public struct pushTokenUpdateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - status
  ///   - token
  public init(status: Swift.Optional<Int?> = nil, token: Swift.Optional<String?> = nil) {
    graphQLMap = ["status": status, "token": token]
  }

  public var status: Swift.Optional<Int?> {
    get {
      return graphQLMap["status"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var token: Swift.Optional<String?> {
    get {
      return graphQLMap["token"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "token")
    }
  }
}

public final class AddItemMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AddItem($itemAdd: ItemAddInput, $description: String, $images: [String]) {
      addItem(itemAdd: $itemAdd, description: $description, images: $images) {
        __typename
        userId
        id
        status
        name
        dueDate
        createdAt
      }
    }
    """

  public let operationName: String = "AddItem"

  public var itemAdd: ItemAddInput?
  public var description: String?
  public var images: [String?]?

  public init(itemAdd: ItemAddInput? = nil, description: String? = nil, images: [String?]? = nil) {
    self.itemAdd = itemAdd
    self.description = description
    self.images = images
  }

  public var variables: GraphQLMap? {
    return ["itemAdd": itemAdd, "description": description, "images": images]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("addItem", arguments: ["itemAdd": GraphQLVariable("itemAdd"), "description": GraphQLVariable("description"), "images": GraphQLVariable("images")], type: .object(AddItem.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addItem: AddItem? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addItem": addItem.flatMap { (value: AddItem) -> ResultMap in value.resultMap }])
    }

    public var addItem: AddItem? {
      get {
        return (resultMap["addItem"] as? ResultMap).flatMap { AddItem(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "addItem")
      }
    }

    public struct AddItem: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Item"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("dueDate", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userId: Int, id: Int, status: Int, name: String? = nil, dueDate: String? = nil, createdAt: String) {
        self.init(unsafeResultMap: ["__typename": "Item", "userId": userId, "id": id, "status": status, "name": name, "dueDate": dueDate, "createdAt": createdAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
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

public final class AddUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AddUser {
      addUser {
        __typename
        id
        status
        email
        nickname
        kakaoAccount {
          __typename
          id
        }
      }
    }
    """

  public let operationName: String = "AddUser"

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
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("nickname", type: .scalar(String.self)),
          GraphQLField("kakaoAccount", type: .object(KakaoAccount.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, status: Int, email: String? = nil, nickname: String? = nil, kakaoAccount: KakaoAccount? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "status": status, "email": email, "nickname": nickname, "kakaoAccount": kakaoAccount.flatMap { (value: KakaoAccount) -> ResultMap in value.resultMap }])
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

      public var email: String? {
        get {
          return resultMap["email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
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

public final class GetBiddingQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetBidding($biddingQuery: BiddingQueryInput!) {
      getBidding(biddingQuery: $biddingQuery) {
        __typename
        id
        status
        userId
        itemId
        price
        createdAt
        user {
          __typename
          id
          status
          nickname
          email
          createdAt
          updatedAt
          deletedAt
          description
        }
      }
    }
    """

  public let operationName: String = "GetBidding"

  public var biddingQuery: BiddingQueryInput

  public init(biddingQuery: BiddingQueryInput) {
    self.biddingQuery = biddingQuery
  }

  public var variables: GraphQLMap? {
    return ["biddingQuery": biddingQuery]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getBidding", arguments: ["biddingQuery": GraphQLVariable("biddingQuery")], type: .list(.object(GetBidding.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getBidding: [GetBidding?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getBidding": getBidding.flatMap { (value: [GetBidding?]) -> [ResultMap?] in value.map { (value: GetBidding?) -> ResultMap? in value.flatMap { (value: GetBidding) -> ResultMap in value.resultMap } } }])
    }

    public var getBidding: [GetBidding?]? {
      get {
        return (resultMap["getBidding"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [GetBidding?] in value.map { (value: ResultMap?) -> GetBidding? in value.flatMap { (value: ResultMap) -> GetBidding in GetBidding(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [GetBidding?]) -> [ResultMap?] in value.map { (value: GetBidding?) -> ResultMap? in value.flatMap { (value: GetBidding) -> ResultMap in value.resultMap } } }, forKey: "getBidding")
      }
    }

    public struct GetBidding: GraphQLSelectionSet {
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
          GraphQLField("user", type: .object(User.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, status: Int, userId: Int, itemId: Int, price: Int, createdAt: String, user: User? = nil) {
        self.init(unsafeResultMap: ["__typename": "Bidding", "id": id, "status": status, "userId": userId, "itemId": itemId, "price": price, "createdAt": createdAt, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
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

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .nonNull(.scalar(Int.self))),
            GraphQLField("nickname", type: .scalar(String.self)),
            GraphQLField("email", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .scalar(String.self)),
            GraphQLField("deletedAt", type: .scalar(String.self)),
            GraphQLField("description", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, status: Int, nickname: String? = nil, email: String? = nil, createdAt: String, updatedAt: String? = nil, deletedAt: String? = nil, description: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "status": status, "nickname": nickname, "email": email, "createdAt": createdAt, "updatedAt": updatedAt, "deletedAt": deletedAt, "description": description])
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

        public var email: String? {
          get {
            return resultMap["email"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
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

        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }
      }
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
        createdAt
        viewCount
        deliveryType
        categoryId
        userId
        image {
          __typename
          id
          status
          itemId
          type
          url
          createdAt
          updatedAt
          deletedAt
        }
        user {
          __typename
          id
          nickname
          email
          status
          createdAt
        }
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
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("viewCount", type: .scalar(Int.self)),
          GraphQLField("deliveryType", type: .scalar(Int.self)),
          GraphQLField("categoryId", type: .scalar(Int.self)),
          GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("image", type: .list(.object(Image.selections))),
          GraphQLField("user", type: .object(User.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String? = nil, status: Int, title: String? = nil, dueDate: String? = nil, sPrice: Int? = nil, cPrice: Int? = nil, buyNow: Int? = nil, updatedAt: String? = nil, createdAt: String, viewCount: Int? = nil, deliveryType: Int? = nil, categoryId: Int? = nil, userId: Int, image: [Image?]? = nil, user: User? = nil) {
        self.init(unsafeResultMap: ["__typename": "Item", "id": id, "name": name, "status": status, "title": title, "dueDate": dueDate, "sPrice": sPrice, "cPrice": cPrice, "buyNow": buyNow, "updatedAt": updatedAt, "createdAt": createdAt, "viewCount": viewCount, "deliveryType": deliveryType, "categoryId": categoryId, "userId": userId, "image": image.flatMap { (value: [Image?]) -> [ResultMap?] in value.map { (value: Image?) -> ResultMap? in value.flatMap { (value: Image) -> ResultMap in value.resultMap } } }, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
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

      public var createdAt: String {
        get {
          return resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var viewCount: Int? {
        get {
          return resultMap["viewCount"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "viewCount")
        }
      }

      public var deliveryType: Int? {
        get {
          return resultMap["deliveryType"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "deliveryType")
        }
      }

      public var categoryId: Int? {
        get {
          return resultMap["categoryId"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "categoryId")
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

      public var image: [Image?]? {
        get {
          return (resultMap["image"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Image?] in value.map { (value: ResultMap?) -> Image? in value.flatMap { (value: ResultMap) -> Image in Image(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Image?]) -> [ResultMap?] in value.map { (value: Image?) -> ResultMap? in value.flatMap { (value: Image) -> ResultMap in value.resultMap } } }, forKey: "image")
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

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ItemImage"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .nonNull(.scalar(Int.self))),
            GraphQLField("itemId", type: .nonNull(.scalar(Int.self))),
            GraphQLField("type", type: .scalar(Int.self)),
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

        public init(id: Int, status: Int, itemId: Int, type: Int? = nil, url: String? = nil, createdAt: String, updatedAt: String? = nil, deletedAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "ItemImage", "id": id, "status": status, "itemId": itemId, "type": type, "url": url, "createdAt": createdAt, "updatedAt": updatedAt, "deletedAt": deletedAt])
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

        public var type: Int? {
          get {
            return resultMap["type"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
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

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("nickname", type: .scalar(String.self)),
            GraphQLField("email", type: .scalar(String.self)),
            GraphQLField("status", type: .nonNull(.scalar(Int.self))),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, nickname: String? = nil, email: String? = nil, status: Int, createdAt: String) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "nickname": nickname, "email": email, "status": status, "createdAt": createdAt])
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

public final class GetItemQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetItem($id: Int!) {
      getItem(id: $id) {
        __typename
        id
        status
        userId
        categoryId
        sPrice
        cPrice
        buyNow
        viewCount
        name
        title
        dueDate
        deliveryType
        sCondition
        aCondition
        createdAt
        updatedAt
        deletedAt
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
          type
          url
          createdAt
        }
        user {
          __typename
          id
          status
          nickname
          email
          createdAt
          updatedAt
          deletedAt
          description
        }
      }
    }
    """

  public let operationName: String = "GetItem"

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getItem", arguments: ["id": GraphQLVariable("id")], type: .object(GetItem.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getItem: GetItem? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getItem": getItem.flatMap { (value: GetItem) -> ResultMap in value.resultMap }])
    }

    public var getItem: GetItem? {
      get {
        return (resultMap["getItem"] as? ResultMap).flatMap { GetItem(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "getItem")
      }
    }

    public struct GetItem: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Item"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .nonNull(.scalar(Int.self))),
          GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("categoryId", type: .scalar(Int.self)),
          GraphQLField("sPrice", type: .scalar(Int.self)),
          GraphQLField("cPrice", type: .scalar(Int.self)),
          GraphQLField("buyNow", type: .scalar(Int.self)),
          GraphQLField("viewCount", type: .scalar(Int.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("dueDate", type: .scalar(String.self)),
          GraphQLField("deliveryType", type: .scalar(Int.self)),
          GraphQLField("sCondition", type: .scalar(Int.self)),
          GraphQLField("aCondition", type: .scalar(Int.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("deletedAt", type: .scalar(String.self)),
          GraphQLField("description", type: .object(Description.selections)),
          GraphQLField("image", type: .list(.object(Image.selections))),
          GraphQLField("user", type: .object(User.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, status: Int, userId: Int, categoryId: Int? = nil, sPrice: Int? = nil, cPrice: Int? = nil, buyNow: Int? = nil, viewCount: Int? = nil, name: String? = nil, title: String? = nil, dueDate: String? = nil, deliveryType: Int? = nil, sCondition: Int? = nil, aCondition: Int? = nil, createdAt: String, updatedAt: String? = nil, deletedAt: String? = nil, description: Description? = nil, image: [Image?]? = nil, user: User? = nil) {
        self.init(unsafeResultMap: ["__typename": "Item", "id": id, "status": status, "userId": userId, "categoryId": categoryId, "sPrice": sPrice, "cPrice": cPrice, "buyNow": buyNow, "viewCount": viewCount, "name": name, "title": title, "dueDate": dueDate, "deliveryType": deliveryType, "sCondition": sCondition, "aCondition": aCondition, "createdAt": createdAt, "updatedAt": updatedAt, "deletedAt": deletedAt, "description": description.flatMap { (value: Description) -> ResultMap in value.resultMap }, "image": image.flatMap { (value: [Image?]) -> [ResultMap?] in value.map { (value: Image?) -> ResultMap? in value.flatMap { (value: Image) -> ResultMap in value.resultMap } } }, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
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

      public var categoryId: Int? {
        get {
          return resultMap["categoryId"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "categoryId")
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

      public var viewCount: Int? {
        get {
          return resultMap["viewCount"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "viewCount")
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

      public var deliveryType: Int? {
        get {
          return resultMap["deliveryType"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "deliveryType")
        }
      }

      public var sCondition: Int? {
        get {
          return resultMap["sCondition"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "sCondition")
        }
      }

      public var aCondition: Int? {
        get {
          return resultMap["aCondition"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "aCondition")
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

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
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
            GraphQLField("type", type: .scalar(Int.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, status: Int, itemId: Int, type: Int? = nil, url: String? = nil, createdAt: String) {
          self.init(unsafeResultMap: ["__typename": "ItemImage", "id": id, "status": status, "itemId": itemId, "type": type, "url": url, "createdAt": createdAt])
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

        public var type: Int? {
          get {
            return resultMap["type"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
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
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .nonNull(.scalar(Int.self))),
            GraphQLField("nickname", type: .scalar(String.self)),
            GraphQLField("email", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .scalar(String.self)),
            GraphQLField("deletedAt", type: .scalar(String.self)),
            GraphQLField("description", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, status: Int, nickname: String? = nil, email: String? = nil, createdAt: String, updatedAt: String? = nil, deletedAt: String? = nil, description: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "status": status, "nickname": nickname, "email": email, "createdAt": createdAt, "updatedAt": updatedAt, "deletedAt": deletedAt, "description": description])
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

        public var email: String? {
          get {
            return resultMap["email"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
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

        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }
      }
    }
  }
}

public final class GetItemListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getItemList($itemQueryInfo: ItemQueryInput, $keywordInfo: String, $firstInfo: Int, $lastInfo: Int, $afterInfo: String, $beforeInfo: String, $cursorTypeInfo: CursorType) {
      getItemList(
        itemQuery: $itemQueryInfo
        keyword: $keywordInfo
        first: $firstInfo
        last: $lastInfo
        after: $afterInfo
        before: $beforeInfo
        cursorType: $cursorTypeInfo
      ) {
        __typename
        totalCount
        pageInfo {
          __typename
          hasNextPage
        }
        edges {
          __typename
          node {
            __typename
            id
            status
            userId
            createdAt
            categoryId
            viewCount
            sPrice
            cPrice
            title
            deliveryType
            dueDate
            buyNow
            name
            deliveryType
            image {
              __typename
              id
              status
              itemId
              type
              url
              createdAt
              updatedAt
              deletedAt
            }
            user {
              __typename
              id
              nickname
              email
            }
          }
        }
      }
    }
    """

  public let operationName: String = "getItemList"

  public var itemQueryInfo: ItemQueryInput?
  public var keywordInfo: String?
  public var firstInfo: Int?
  public var lastInfo: Int?
  public var afterInfo: String?
  public var beforeInfo: String?
  public var cursorTypeInfo: CursorType?

  public init(itemQueryInfo: ItemQueryInput? = nil, keywordInfo: String? = nil, firstInfo: Int? = nil, lastInfo: Int? = nil, afterInfo: String? = nil, beforeInfo: String? = nil, cursorTypeInfo: CursorType? = nil) {
    self.itemQueryInfo = itemQueryInfo
    self.keywordInfo = keywordInfo
    self.firstInfo = firstInfo
    self.lastInfo = lastInfo
    self.afterInfo = afterInfo
    self.beforeInfo = beforeInfo
    self.cursorTypeInfo = cursorTypeInfo
  }

  public var variables: GraphQLMap? {
    return ["itemQueryInfo": itemQueryInfo, "keywordInfo": keywordInfo, "firstInfo": firstInfo, "lastInfo": lastInfo, "afterInfo": afterInfo, "beforeInfo": beforeInfo, "cursorTypeInfo": cursorTypeInfo]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getItemList", arguments: ["itemQuery": GraphQLVariable("itemQueryInfo"), "keyword": GraphQLVariable("keywordInfo"), "first": GraphQLVariable("firstInfo"), "last": GraphQLVariable("lastInfo"), "after": GraphQLVariable("afterInfo"), "before": GraphQLVariable("beforeInfo"), "cursorType": GraphQLVariable("cursorTypeInfo")], type: .object(GetItemList.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getItemList: GetItemList? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getItemList": getItemList.flatMap { (value: GetItemList) -> ResultMap in value.resultMap }])
    }

    public var getItemList: GetItemList? {
      get {
        return (resultMap["getItemList"] as? ResultMap).flatMap { GetItemList(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "getItemList")
      }
    }

    public struct GetItemList: GraphQLSelectionSet {
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
            GraphQLField("hasNextPage", type: .scalar(Bool.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(hasNextPage: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ItemEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .object(Node.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "ItemEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
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

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Item"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("status", type: .nonNull(.scalar(Int.self))),
              GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
              GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("categoryId", type: .scalar(Int.self)),
              GraphQLField("viewCount", type: .scalar(Int.self)),
              GraphQLField("sPrice", type: .scalar(Int.self)),
              GraphQLField("cPrice", type: .scalar(Int.self)),
              GraphQLField("title", type: .scalar(String.self)),
              GraphQLField("deliveryType", type: .scalar(Int.self)),
              GraphQLField("dueDate", type: .scalar(String.self)),
              GraphQLField("buyNow", type: .scalar(Int.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("deliveryType", type: .scalar(Int.self)),
              GraphQLField("image", type: .list(.object(Image.selections))),
              GraphQLField("user", type: .object(User.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, status: Int, userId: Int, createdAt: String, categoryId: Int? = nil, viewCount: Int? = nil, sPrice: Int? = nil, cPrice: Int? = nil, title: String? = nil, deliveryType: Int? = nil, dueDate: String? = nil, buyNow: Int? = nil, name: String? = nil, image: [Image?]? = nil, user: User? = nil) {
            self.init(unsafeResultMap: ["__typename": "Item", "id": id, "status": status, "userId": userId, "createdAt": createdAt, "categoryId": categoryId, "viewCount": viewCount, "sPrice": sPrice, "cPrice": cPrice, "title": title, "deliveryType": deliveryType, "dueDate": dueDate, "buyNow": buyNow, "name": name, "image": image.flatMap { (value: [Image?]) -> [ResultMap?] in value.map { (value: Image?) -> ResultMap? in value.flatMap { (value: Image) -> ResultMap in value.resultMap } } }, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
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

          public var createdAt: String {
            get {
              return resultMap["createdAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var categoryId: Int? {
            get {
              return resultMap["categoryId"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "categoryId")
            }
          }

          public var viewCount: Int? {
            get {
              return resultMap["viewCount"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "viewCount")
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

          public var title: String? {
            get {
              return resultMap["title"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "title")
            }
          }

          public var deliveryType: Int? {
            get {
              return resultMap["deliveryType"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "deliveryType")
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

          public var buyNow: Int? {
            get {
              return resultMap["buyNow"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "buyNow")
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

          public var image: [Image?]? {
            get {
              return (resultMap["image"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Image?] in value.map { (value: ResultMap?) -> Image? in value.flatMap { (value: ResultMap) -> Image in Image(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Image?]) -> [ResultMap?] in value.map { (value: Image?) -> ResultMap? in value.flatMap { (value: Image) -> ResultMap in value.resultMap } } }, forKey: "image")
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

          public struct Image: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["ItemImage"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("status", type: .nonNull(.scalar(Int.self))),
                GraphQLField("itemId", type: .nonNull(.scalar(Int.self))),
                GraphQLField("type", type: .scalar(Int.self)),
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

            public init(id: Int, status: Int, itemId: Int, type: Int? = nil, url: String? = nil, createdAt: String, updatedAt: String? = nil, deletedAt: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "ItemImage", "id": id, "status": status, "itemId": itemId, "type": type, "url": url, "createdAt": createdAt, "updatedAt": updatedAt, "deletedAt": deletedAt])
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

            public var type: Int? {
              get {
                return resultMap["type"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "type")
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

          public struct User: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("nickname", type: .scalar(String.self)),
                GraphQLField("email", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, nickname: String? = nil, email: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "User", "id": id, "nickname": nickname, "email": email])
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
          }
        }
      }
    }
  }
}

public final class GetMyBiddingQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetMyBidding($biddingQuery: BiddingQueryInput!) {
      getMyBidding(biddingQuery: $biddingQuery) {
        __typename
        id
        status
        userId
        itemId
        price
        createdAt
        user {
          __typename
          id
          status
          nickname
          email
          createdAt
          updatedAt
          deletedAt
          description
        }
        item {
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
          createdAt
          viewCount
          deliveryType
          categoryId
          userId
          image {
            __typename
            id
            status
            itemId
            type
            url
            createdAt
            updatedAt
            deletedAt
          }
          user {
            __typename
            id
            nickname
            email
            status
            createdAt
          }
        }
      }
    }
    """

  public let operationName: String = "GetMyBidding"

  public var biddingQuery: BiddingQueryInput

  public init(biddingQuery: BiddingQueryInput) {
    self.biddingQuery = biddingQuery
  }

  public var variables: GraphQLMap? {
    return ["biddingQuery": biddingQuery]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getMyBidding", arguments: ["biddingQuery": GraphQLVariable("biddingQuery")], type: .list(.object(GetMyBidding.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getMyBidding: [GetMyBidding?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getMyBidding": getMyBidding.flatMap { (value: [GetMyBidding?]) -> [ResultMap?] in value.map { (value: GetMyBidding?) -> ResultMap? in value.flatMap { (value: GetMyBidding) -> ResultMap in value.resultMap } } }])
    }

    public var getMyBidding: [GetMyBidding?]? {
      get {
        return (resultMap["getMyBidding"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [GetMyBidding?] in value.map { (value: ResultMap?) -> GetMyBidding? in value.flatMap { (value: ResultMap) -> GetMyBidding in GetMyBidding(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [GetMyBidding?]) -> [ResultMap?] in value.map { (value: GetMyBidding?) -> ResultMap? in value.flatMap { (value: GetMyBidding) -> ResultMap in value.resultMap } } }, forKey: "getMyBidding")
      }
    }

    public struct GetMyBidding: GraphQLSelectionSet {
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
          GraphQLField("user", type: .object(User.selections)),
          GraphQLField("item", type: .object(Item.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, status: Int, userId: Int, itemId: Int, price: Int, createdAt: String, user: User? = nil, item: Item? = nil) {
        self.init(unsafeResultMap: ["__typename": "Bidding", "id": id, "status": status, "userId": userId, "itemId": itemId, "price": price, "createdAt": createdAt, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "item": item.flatMap { (value: Item) -> ResultMap in value.resultMap }])
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

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
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

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .nonNull(.scalar(Int.self))),
            GraphQLField("nickname", type: .scalar(String.self)),
            GraphQLField("email", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .scalar(String.self)),
            GraphQLField("deletedAt", type: .scalar(String.self)),
            GraphQLField("description", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, status: Int, nickname: String? = nil, email: String? = nil, createdAt: String, updatedAt: String? = nil, deletedAt: String? = nil, description: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "status": status, "nickname": nickname, "email": email, "createdAt": createdAt, "updatedAt": updatedAt, "deletedAt": deletedAt, "description": description])
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

        public var email: String? {
          get {
            return resultMap["email"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
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

        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }
      }

      public struct Item: GraphQLSelectionSet {
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
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("viewCount", type: .scalar(Int.self)),
            GraphQLField("deliveryType", type: .scalar(Int.self)),
            GraphQLField("categoryId", type: .scalar(Int.self)),
            GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
            GraphQLField("image", type: .list(.object(Image.selections))),
            GraphQLField("user", type: .object(User.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, name: String? = nil, status: Int, title: String? = nil, dueDate: String? = nil, sPrice: Int? = nil, cPrice: Int? = nil, buyNow: Int? = nil, updatedAt: String? = nil, createdAt: String, viewCount: Int? = nil, deliveryType: Int? = nil, categoryId: Int? = nil, userId: Int, image: [Image?]? = nil, user: User? = nil) {
          self.init(unsafeResultMap: ["__typename": "Item", "id": id, "name": name, "status": status, "title": title, "dueDate": dueDate, "sPrice": sPrice, "cPrice": cPrice, "buyNow": buyNow, "updatedAt": updatedAt, "createdAt": createdAt, "viewCount": viewCount, "deliveryType": deliveryType, "categoryId": categoryId, "userId": userId, "image": image.flatMap { (value: [Image?]) -> [ResultMap?] in value.map { (value: Image?) -> ResultMap? in value.flatMap { (value: Image) -> ResultMap in value.resultMap } } }, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
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

        public var createdAt: String {
          get {
            return resultMap["createdAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var viewCount: Int? {
          get {
            return resultMap["viewCount"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "viewCount")
          }
        }

        public var deliveryType: Int? {
          get {
            return resultMap["deliveryType"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "deliveryType")
          }
        }

        public var categoryId: Int? {
          get {
            return resultMap["categoryId"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "categoryId")
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

        public var image: [Image?]? {
          get {
            return (resultMap["image"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Image?] in value.map { (value: ResultMap?) -> Image? in value.flatMap { (value: ResultMap) -> Image in Image(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Image?]) -> [ResultMap?] in value.map { (value: Image?) -> ResultMap? in value.flatMap { (value: Image) -> ResultMap in value.resultMap } } }, forKey: "image")
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

        public struct Image: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ItemImage"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("status", type: .nonNull(.scalar(Int.self))),
              GraphQLField("itemId", type: .nonNull(.scalar(Int.self))),
              GraphQLField("type", type: .scalar(Int.self)),
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

          public init(id: Int, status: Int, itemId: Int, type: Int? = nil, url: String? = nil, createdAt: String, updatedAt: String? = nil, deletedAt: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "ItemImage", "id": id, "status": status, "itemId": itemId, "type": type, "url": url, "createdAt": createdAt, "updatedAt": updatedAt, "deletedAt": deletedAt])
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

          public var type: Int? {
            get {
              return resultMap["type"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
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

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["User"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("nickname", type: .scalar(String.self)),
              GraphQLField("email", type: .scalar(String.self)),
              GraphQLField("status", type: .nonNull(.scalar(Int.self))),
              GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, nickname: String? = nil, email: String? = nil, status: Int, createdAt: String) {
            self.init(unsafeResultMap: ["__typename": "User", "id": id, "nickname": nickname, "email": email, "status": status, "createdAt": createdAt])
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
        birth
        email
        phone
        createdAt
        updatedAt
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
              name
              createdAt
              updatedAt
              deletedAt
            }
            cursor
          }
        }
        kakaoAccount {
          __typename
          id
          status
          userId
          profile_needs_agreement
          profile_nickname_needs_agreement
          profile_image_needs_agreement
          name_needs_agreement
          name
          email_needs_agreement
          is_email_valid
          is_email_verified
          email
          age_range_needs_agreement
          age_range
          birthyear_needs_agreement
          birthyear
          birthday_needs_agreement
          birthday
          birthday_type
          gender_needs_agreement
          gender
          phone_number_needs_agreement
          phone_number
          ci_needs_agreement
          ci
          ci_authenticated_at
          nickname
          thumbnail_image_url
          profile_image_url
          is_default_image
          createdAt
          updatedAt
          deletedAt
          description
        }
        appleAccount {
          __typename
          id
          status
          userId
          sub
          email
          email_verified
          is_private_email
          real_user_status
          createdAt
          updatedAt
          deletedAt
          description
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
          GraphQLField("birth", type: .scalar(String.self)),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("deletedAt", type: .scalar(String.self)),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("items", type: .object(Item.selections)),
          GraphQLField("kakaoAccount", type: .object(KakaoAccount.selections)),
          GraphQLField("appleAccount", type: .object(AppleAccount.selections)),
          GraphQLField("pushToken", type: .object(PushToken.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, status: Int, nickname: String? = nil, passwd: String? = nil, joinPath: JoinPath? = nil, birth: String? = nil, email: String? = nil, phone: String? = nil, createdAt: String, updatedAt: String? = nil, deletedAt: String? = nil, description: String? = nil, items: Item? = nil, kakaoAccount: KakaoAccount? = nil, appleAccount: AppleAccount? = nil, pushToken: PushToken? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "status": status, "nickname": nickname, "passwd": passwd, "joinPath": joinPath, "birth": birth, "email": email, "phone": phone, "createdAt": createdAt, "updatedAt": updatedAt, "deletedAt": deletedAt, "description": description, "items": items.flatMap { (value: Item) -> ResultMap in value.resultMap }, "kakaoAccount": kakaoAccount.flatMap { (value: KakaoAccount) -> ResultMap in value.resultMap }, "appleAccount": appleAccount.flatMap { (value: AppleAccount) -> ResultMap in value.resultMap }, "pushToken": pushToken.flatMap { (value: PushToken) -> ResultMap in value.resultMap }])
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

      public var birth: String? {
        get {
          return resultMap["birth"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "birth")
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

      public var appleAccount: AppleAccount? {
        get {
          return (resultMap["appleAccount"] as? ResultMap).flatMap { AppleAccount(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "appleAccount")
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
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
                GraphQLField("updatedAt", type: .scalar(String.self)),
                GraphQLField("deletedAt", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, status: Int, name: String? = nil, createdAt: String, updatedAt: String? = nil, deletedAt: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Item", "id": id, "status": status, "name": name, "createdAt": createdAt, "updatedAt": updatedAt, "deletedAt": deletedAt])
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

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
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

      public struct KakaoAccount: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["KakaoAccount"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("status", type: .nonNull(.scalar(Int.self))),
            GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
            GraphQLField("profile_needs_agreement", type: .scalar(Bool.self)),
            GraphQLField("profile_nickname_needs_agreement", type: .scalar(Bool.self)),
            GraphQLField("profile_image_needs_agreement", type: .scalar(Bool.self)),
            GraphQLField("name_needs_agreement", type: .scalar(Bool.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("email_needs_agreement", type: .scalar(Bool.self)),
            GraphQLField("is_email_valid", type: .scalar(Bool.self)),
            GraphQLField("is_email_verified", type: .scalar(Bool.self)),
            GraphQLField("email", type: .scalar(String.self)),
            GraphQLField("age_range_needs_agreement", type: .scalar(Bool.self)),
            GraphQLField("age_range", type: .scalar(String.self)),
            GraphQLField("birthyear_needs_agreement", type: .scalar(Bool.self)),
            GraphQLField("birthyear", type: .scalar(String.self)),
            GraphQLField("birthday_needs_agreement", type: .scalar(Bool.self)),
            GraphQLField("birthday", type: .scalar(String.self)),
            GraphQLField("birthday_type", type: .scalar(String.self)),
            GraphQLField("gender_needs_agreement", type: .scalar(Bool.self)),
            GraphQLField("gender", type: .scalar(String.self)),
            GraphQLField("phone_number_needs_agreement", type: .scalar(Bool.self)),
            GraphQLField("phone_number", type: .scalar(String.self)),
            GraphQLField("ci_needs_agreement", type: .scalar(Bool.self)),
            GraphQLField("ci", type: .scalar(String.self)),
            GraphQLField("ci_authenticated_at", type: .scalar(String.self)),
            GraphQLField("nickname", type: .scalar(String.self)),
            GraphQLField("thumbnail_image_url", type: .scalar(String.self)),
            GraphQLField("profile_image_url", type: .scalar(String.self)),
            GraphQLField("is_default_image", type: .scalar(Bool.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("deletedAt", type: .scalar(String.self)),
            GraphQLField("description", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, status: Int, userId: Int, profileNeedsAgreement: Bool? = nil, profileNicknameNeedsAgreement: Bool? = nil, profileImageNeedsAgreement: Bool? = nil, nameNeedsAgreement: Bool? = nil, name: String? = nil, emailNeedsAgreement: Bool? = nil, isEmailValid: Bool? = nil, isEmailVerified: Bool? = nil, email: String? = nil, ageRangeNeedsAgreement: Bool? = nil, ageRange: String? = nil, birthyearNeedsAgreement: Bool? = nil, birthyear: String? = nil, birthdayNeedsAgreement: Bool? = nil, birthday: String? = nil, birthdayType: String? = nil, genderNeedsAgreement: Bool? = nil, gender: String? = nil, phoneNumberNeedsAgreement: Bool? = nil, phoneNumber: String? = nil, ciNeedsAgreement: Bool? = nil, ci: String? = nil, ciAuthenticatedAt: String? = nil, nickname: String? = nil, thumbnailImageUrl: String? = nil, profileImageUrl: String? = nil, isDefaultImage: Bool? = nil, createdAt: String, updatedAt: String, deletedAt: String? = nil, description: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "KakaoAccount", "id": id, "status": status, "userId": userId, "profile_needs_agreement": profileNeedsAgreement, "profile_nickname_needs_agreement": profileNicknameNeedsAgreement, "profile_image_needs_agreement": profileImageNeedsAgreement, "name_needs_agreement": nameNeedsAgreement, "name": name, "email_needs_agreement": emailNeedsAgreement, "is_email_valid": isEmailValid, "is_email_verified": isEmailVerified, "email": email, "age_range_needs_agreement": ageRangeNeedsAgreement, "age_range": ageRange, "birthyear_needs_agreement": birthyearNeedsAgreement, "birthyear": birthyear, "birthday_needs_agreement": birthdayNeedsAgreement, "birthday": birthday, "birthday_type": birthdayType, "gender_needs_agreement": genderNeedsAgreement, "gender": gender, "phone_number_needs_agreement": phoneNumberNeedsAgreement, "phone_number": phoneNumber, "ci_needs_agreement": ciNeedsAgreement, "ci": ci, "ci_authenticated_at": ciAuthenticatedAt, "nickname": nickname, "thumbnail_image_url": thumbnailImageUrl, "profile_image_url": profileImageUrl, "is_default_image": isDefaultImage, "createdAt": createdAt, "updatedAt": updatedAt, "deletedAt": deletedAt, "description": description])
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

        public var profileNeedsAgreement: Bool? {
          get {
            return resultMap["profile_needs_agreement"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "profile_needs_agreement")
          }
        }

        public var profileNicknameNeedsAgreement: Bool? {
          get {
            return resultMap["profile_nickname_needs_agreement"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "profile_nickname_needs_agreement")
          }
        }

        public var profileImageNeedsAgreement: Bool? {
          get {
            return resultMap["profile_image_needs_agreement"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "profile_image_needs_agreement")
          }
        }

        public var nameNeedsAgreement: Bool? {
          get {
            return resultMap["name_needs_agreement"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "name_needs_agreement")
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

        public var emailNeedsAgreement: Bool? {
          get {
            return resultMap["email_needs_agreement"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "email_needs_agreement")
          }
        }

        public var isEmailValid: Bool? {
          get {
            return resultMap["is_email_valid"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "is_email_valid")
          }
        }

        public var isEmailVerified: Bool? {
          get {
            return resultMap["is_email_verified"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "is_email_verified")
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

        public var ageRangeNeedsAgreement: Bool? {
          get {
            return resultMap["age_range_needs_agreement"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "age_range_needs_agreement")
          }
        }

        public var ageRange: String? {
          get {
            return resultMap["age_range"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "age_range")
          }
        }

        public var birthyearNeedsAgreement: Bool? {
          get {
            return resultMap["birthyear_needs_agreement"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "birthyear_needs_agreement")
          }
        }

        public var birthyear: String? {
          get {
            return resultMap["birthyear"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "birthyear")
          }
        }

        public var birthdayNeedsAgreement: Bool? {
          get {
            return resultMap["birthday_needs_agreement"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "birthday_needs_agreement")
          }
        }

        public var birthday: String? {
          get {
            return resultMap["birthday"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "birthday")
          }
        }

        public var birthdayType: String? {
          get {
            return resultMap["birthday_type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "birthday_type")
          }
        }

        public var genderNeedsAgreement: Bool? {
          get {
            return resultMap["gender_needs_agreement"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "gender_needs_agreement")
          }
        }

        public var gender: String? {
          get {
            return resultMap["gender"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "gender")
          }
        }

        public var phoneNumberNeedsAgreement: Bool? {
          get {
            return resultMap["phone_number_needs_agreement"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "phone_number_needs_agreement")
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

        public var ciNeedsAgreement: Bool? {
          get {
            return resultMap["ci_needs_agreement"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "ci_needs_agreement")
          }
        }

        public var ci: String? {
          get {
            return resultMap["ci"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "ci")
          }
        }

        public var ciAuthenticatedAt: String? {
          get {
            return resultMap["ci_authenticated_at"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "ci_authenticated_at")
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

        public var thumbnailImageUrl: String? {
          get {
            return resultMap["thumbnail_image_url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "thumbnail_image_url")
          }
        }

        public var profileImageUrl: String? {
          get {
            return resultMap["profile_image_url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profile_image_url")
          }
        }

        public var isDefaultImage: Bool? {
          get {
            return resultMap["is_default_image"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "is_default_image")
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

        public var updatedAt: String {
          get {
            return resultMap["updatedAt"]! as! String
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

        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }
      }

      public struct AppleAccount: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AppleAccount"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .nonNull(.scalar(Int.self))),
            GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
            GraphQLField("sub", type: .scalar(String.self)),
            GraphQLField("email", type: .scalar(String.self)),
            GraphQLField("email_verified", type: .scalar(String.self)),
            GraphQLField("is_private_email", type: .scalar(Bool.self)),
            GraphQLField("real_user_status", type: .scalar(Int.self)),
            GraphQLField("createdAt", type: .scalar(String.self)),
            GraphQLField("updatedAt", type: .scalar(String.self)),
            GraphQLField("deletedAt", type: .scalar(String.self)),
            GraphQLField("description", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, status: Int, userId: Int, sub: String? = nil, email: String? = nil, emailVerified: String? = nil, isPrivateEmail: Bool? = nil, realUserStatus: Int? = nil, createdAt: String? = nil, updatedAt: String? = nil, deletedAt: String? = nil, description: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "AppleAccount", "id": id, "status": status, "userId": userId, "sub": sub, "email": email, "email_verified": emailVerified, "is_private_email": isPrivateEmail, "real_user_status": realUserStatus, "createdAt": createdAt, "updatedAt": updatedAt, "deletedAt": deletedAt, "description": description])
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

        public var sub: String? {
          get {
            return resultMap["sub"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "sub")
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

        public var emailVerified: String? {
          get {
            return resultMap["email_verified"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email_verified")
          }
        }

        public var isPrivateEmail: Bool? {
          get {
            return resultMap["is_private_email"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "is_private_email")
          }
        }

        public var realUserStatus: Int? {
          get {
            return resultMap["real_user_status"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "real_user_status")
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

public final class MyPageMeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query MyPageMe {
      me {
        __typename
        id
        nickname
        status
        counting {
          __typename
          buy
          sell
        }
        kakaoAccount {
          __typename
          id
          status
          userId
          name
          email
          phone_number
          nickname
          thumbnail_image_url
          profile_image_url
          is_default_image
          createdAt
          updatedAt
        }
        appleAccount {
          __typename
          id
          status
          userId
          email
          createdAt
          updatedAt
          deletedAt
        }
      }
    }
    """

  public let operationName: String = "MyPageMe"

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
          GraphQLField("nickname", type: .scalar(String.self)),
          GraphQLField("status", type: .nonNull(.scalar(Int.self))),
          GraphQLField("counting", type: .object(Counting.selections)),
          GraphQLField("kakaoAccount", type: .object(KakaoAccount.selections)),
          GraphQLField("appleAccount", type: .object(AppleAccount.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, nickname: String? = nil, status: Int, counting: Counting? = nil, kakaoAccount: KakaoAccount? = nil, appleAccount: AppleAccount? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "nickname": nickname, "status": status, "counting": counting.flatMap { (value: Counting) -> ResultMap in value.resultMap }, "kakaoAccount": kakaoAccount.flatMap { (value: KakaoAccount) -> ResultMap in value.resultMap }, "appleAccount": appleAccount.flatMap { (value: AppleAccount) -> ResultMap in value.resultMap }])
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

      public var nickname: String? {
        get {
          return resultMap["nickname"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "nickname")
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

      public var counting: Counting? {
        get {
          return (resultMap["counting"] as? ResultMap).flatMap { Counting(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "counting")
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

      public var appleAccount: AppleAccount? {
        get {
          return (resultMap["appleAccount"] as? ResultMap).flatMap { AppleAccount(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "appleAccount")
        }
      }

      public struct Counting: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Counting"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("buy", type: .scalar(Int.self)),
            GraphQLField("sell", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(buy: Int? = nil, sell: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Counting", "buy": buy, "sell": sell])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var buy: Int? {
          get {
            return resultMap["buy"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "buy")
          }
        }

        public var sell: Int? {
          get {
            return resultMap["sell"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "sell")
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
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("email", type: .scalar(String.self)),
            GraphQLField("phone_number", type: .scalar(String.self)),
            GraphQLField("nickname", type: .scalar(String.self)),
            GraphQLField("thumbnail_image_url", type: .scalar(String.self)),
            GraphQLField("profile_image_url", type: .scalar(String.self)),
            GraphQLField("is_default_image", type: .scalar(Bool.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, status: Int, userId: Int, name: String? = nil, email: String? = nil, phoneNumber: String? = nil, nickname: String? = nil, thumbnailImageUrl: String? = nil, profileImageUrl: String? = nil, isDefaultImage: Bool? = nil, createdAt: String, updatedAt: String) {
          self.init(unsafeResultMap: ["__typename": "KakaoAccount", "id": id, "status": status, "userId": userId, "name": name, "email": email, "phone_number": phoneNumber, "nickname": nickname, "thumbnail_image_url": thumbnailImageUrl, "profile_image_url": profileImageUrl, "is_default_image": isDefaultImage, "createdAt": createdAt, "updatedAt": updatedAt])
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

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
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

        public var phoneNumber: String? {
          get {
            return resultMap["phone_number"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "phone_number")
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

        public var thumbnailImageUrl: String? {
          get {
            return resultMap["thumbnail_image_url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "thumbnail_image_url")
          }
        }

        public var profileImageUrl: String? {
          get {
            return resultMap["profile_image_url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profile_image_url")
          }
        }

        public var isDefaultImage: Bool? {
          get {
            return resultMap["is_default_image"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "is_default_image")
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

        public var updatedAt: String {
          get {
            return resultMap["updatedAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updatedAt")
          }
        }
      }

      public struct AppleAccount: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AppleAccount"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .nonNull(.scalar(Int.self))),
            GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
            GraphQLField("email", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .scalar(String.self)),
            GraphQLField("updatedAt", type: .scalar(String.self)),
            GraphQLField("deletedAt", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, status: Int, userId: Int, email: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, deletedAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "AppleAccount", "id": id, "status": status, "userId": userId, "email": email, "createdAt": createdAt, "updatedAt": updatedAt, "deletedAt": deletedAt])
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

        public var email: String? {
          get {
            return resultMap["email"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
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

public final class UpdateItemMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateItem($itemId: Int, $itemUpdate: ItemUpdateInput, $description: String) {
      updateItem(itemId: $itemId, itemUpdate: $itemUpdate, description: $description) {
        __typename
        id
        status
        userId
        createdAt
      }
    }
    """

  public let operationName: String = "UpdateItem"

  public var itemId: Int?
  public var itemUpdate: ItemUpdateInput?
  public var description: String?

  public init(itemId: Int? = nil, itemUpdate: ItemUpdateInput? = nil, description: String? = nil) {
    self.itemId = itemId
    self.itemUpdate = itemUpdate
    self.description = description
  }

  public var variables: GraphQLMap? {
    return ["itemId": itemId, "itemUpdate": itemUpdate, "description": description]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateItem", arguments: ["itemId": GraphQLVariable("itemId"), "itemUpdate": GraphQLVariable("itemUpdate"), "description": GraphQLVariable("description")], type: .object(UpdateItem.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateItem: UpdateItem? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateItem": updateItem.flatMap { (value: UpdateItem) -> ResultMap in value.resultMap }])
    }

    public var updateItem: UpdateItem? {
      get {
        return (resultMap["updateItem"] as? ResultMap).flatMap { UpdateItem(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateItem")
      }
    }

    public struct UpdateItem: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Item"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .nonNull(.scalar(Int.self))),
          GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, status: Int, userId: Int, createdAt: String) {
        self.init(unsafeResultMap: ["__typename": "Item", "id": id, "status": status, "userId": userId, "createdAt": createdAt])
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

public final class UpdateItemImageMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateItemImage($itemId: Int, $itemImageUpdate: ItemImageUpdateInput) {
      updateItemImage(itemId: $itemId, itemImageUpdate: $itemImageUpdate) {
        __typename
        name
      }
    }
    """

  public let operationName: String = "UpdateItemImage"

  public var itemId: Int?
  public var itemImageUpdate: ItemImageUpdateInput?

  public init(itemId: Int? = nil, itemImageUpdate: ItemImageUpdateInput? = nil) {
    self.itemId = itemId
    self.itemImageUpdate = itemImageUpdate
  }

  public var variables: GraphQLMap? {
    return ["itemId": itemId, "itemImageUpdate": itemImageUpdate]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateItemImage", arguments: ["itemId": GraphQLVariable("itemId"), "itemImageUpdate": GraphQLVariable("itemImageUpdate")], type: .object(UpdateItemImage.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateItemImage: UpdateItemImage? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateItemImage": updateItemImage.flatMap { (value: UpdateItemImage) -> ResultMap in value.resultMap }])
    }

    public var updateItemImage: UpdateItemImage? {
      get {
        return (resultMap["updateItemImage"] as? ResultMap).flatMap { UpdateItemImage(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateItemImage")
      }
    }

    public struct UpdateItemImage: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Item"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Item", "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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
    }
  }
}

public final class UpdateMembershipMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateMembership($status: MembershipStatus) {
      updateMembership(status: $status) {
        __typename
        id
        status
      }
    }
    """

  public let operationName: String = "UpdateMembership"

  public var status: MembershipStatus?

  public init(status: MembershipStatus? = nil) {
    self.status = status
  }

  public var variables: GraphQLMap? {
    return ["status": status]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateMembership", arguments: ["status": GraphQLVariable("status")], type: .object(UpdateMembership.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateMembership: UpdateMembership? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateMembership": updateMembership.flatMap { (value: UpdateMembership) -> ResultMap in value.resultMap }])
    }

    public var updateMembership: UpdateMembership? {
      get {
        return (resultMap["updateMembership"] as? ResultMap).flatMap { UpdateMembership(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateMembership")
      }
    }

    public struct UpdateMembership: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .nonNull(.scalar(Int.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, status: Int) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "status": status])
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
    }
  }
}

public final class UpdateNickNameMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateNickName($userUpdate: userUpdateInput) {
      updateUser(userUpdate: $userUpdate) {
        __typename
        nickname
      }
    }
    """

  public let operationName: String = "UpdateNickName"

  public var userUpdate: userUpdateInput?

  public init(userUpdate: userUpdateInput? = nil) {
    self.userUpdate = userUpdate
  }

  public var variables: GraphQLMap? {
    return ["userUpdate": userUpdate]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateUser", arguments: ["userUpdate": GraphQLVariable("userUpdate")], type: .object(UpdateUser.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateUser: UpdateUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateUser": updateUser.flatMap { (value: UpdateUser) -> ResultMap in value.resultMap }])
    }

    public var updateUser: UpdateUser? {
      get {
        return (resultMap["updateUser"] as? ResultMap).flatMap { UpdateUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateUser")
      }
    }

    public struct UpdateUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nickname", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(nickname: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "nickname": nickname])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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
    }
  }
}

public final class UpdatePushTokenMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdatePushToken($pushTokenUpdate: pushTokenUpdateInput) {
      updatePushToken(pushTokenUpdate: $pushTokenUpdate)
    }
    """

  public let operationName: String = "UpdatePushToken"

  public var pushTokenUpdate: pushTokenUpdateInput?

  public init(pushTokenUpdate: pushTokenUpdateInput? = nil) {
    self.pushTokenUpdate = pushTokenUpdate
  }

  public var variables: GraphQLMap? {
    return ["pushTokenUpdate": pushTokenUpdate]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updatePushToken", arguments: ["pushTokenUpdate": GraphQLVariable("pushTokenUpdate")], type: .scalar(Bool.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updatePushToken: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updatePushToken": updatePushToken])
    }

    public var updatePushToken: Bool? {
      get {
        return resultMap["updatePushToken"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "updatePushToken")
      }
    }
  }
}

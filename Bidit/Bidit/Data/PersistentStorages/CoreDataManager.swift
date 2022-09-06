//
//  CoreDataManager.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/08.
//

import UIKit
import CoreData

enum CoreDataName: String {
    case recentResearch = "RecentResearchTerm"
}

class CoreDataManager {
    static let shared: CoreDataManager = CoreDataManager()
    
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    
    
//    lazy var persistentContainer: NSPersistentContainer? = {
//        let container = NSPersistentContainer(name: "RecentSearchModel")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
    private lazy var context = appDelegate?.persistentContainer.viewContext
    
    
    // MARK: - 최근 검색 제품으로 저장한다
    func saveRecentProduct(id: Int, title: String, image: String, dueDate : String, cPrice : Int, completion: @escaping (Bool) -> Void) {
        guard let context = self.context,
            let entity = NSEntityDescription.entity(forEntityName: "RecentProduct", in: context)
            else {
            print("context is null")
            return }

        guard let recentTerms = NSManagedObject(entity: entity, insertInto: context) as? RecentProduct else { return }
        
        recentTerms.id = Int32(id)
        recentTerms.title = title
        recentTerms.image = image
        recentTerms.dueDate = dueDate
        recentTerms.cPrice = Int32(cPrice)

        do {
            try context.save()
            completion(true)
        } catch {
            print(error.localizedDescription)
            completion(false)
        }
    }
    // MARK: - 최근 검색 키워드로 저장한다
    func saveRecentKeyword(keyword : String, completion: @escaping (Bool) -> Void) {
        guard let context = self.context,
              let entity = NSEntityDescription.entity(forEntityName: "RecentSearchTerm", in: context)
            else {
            print("context is null")
            return }

        guard let recentTerms = NSManagedObject(entity: entity, insertInto: context) as? RecentSearchTerm else { return }
        
        recentTerms.keyword = keyword
        

        do {
            try context.save()
            print("키워드 저장 성공")
            completion(true)
        } catch {
            print("키워드 저장 실패")
            print(error.localizedDescription)
            completion(false)
        }
    }
    
    // MARK: - 저장된 모든 최근 검색 키워드 정보를 가져온다
    func loadRecentKeyword<T: NSManagedObject>(request: NSFetchRequest<T>) -> [T] {
        guard let context = self.context else { return [] }
        do {
            let results = try context.fetch(request)
            return results
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
//    keypath index not found in entity
    // MARK: - 특정 index 번호 삭제
    func delete<T: NSManagedObject>(keyword: String, request: NSFetchRequest<T>) -> Bool {
        request.predicate = NSPredicate(format: "keyword = %@", NSString(string: keyword))

        do {
            if let recentTerms = try context?.fetch(request) {
                if recentTerms.count == 0 { return false }
                context?.delete(recentTerms[0])
                try context?.save()
                return true
            }
        } catch {
            print(error.localizedDescription)
            return false
        }

        return false
    }
    
    // MARK: - 키워드 삭제
    @discardableResult
    func deleteKeyword(object: NSManagedObject) -> Bool {
        self.context?.delete(object)
        do {
            try context?.save()
            return true
        } catch {
            return false
        }
    }
    
    @discardableResult
    
    func deleteAll<T: NSManagedObject>(request: NSFetchRequest<T>) -> Bool {
        let request: NSFetchRequest<NSFetchRequestResult> = T.fetchRequest()
        let delete = NSBatchDeleteRequest(fetchRequest: request)
        do {
            try self.context?.execute(delete)
            return true
        } catch {
            return false

        }
    }
    
    
}

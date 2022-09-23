//
//  RecentSearchTerm+CoreDataProperties.swift
//  
//
//  Created by JeongMin Ko on 2022/07/08.
//
//

import Foundation
import CoreData


extension RecentSearchTerm {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecentSearchTerm> {
        return NSFetchRequest<RecentSearchTerm>(entityName: "RecentSearchTerm")
    }

    @NSManaged public var keyword: String?

}

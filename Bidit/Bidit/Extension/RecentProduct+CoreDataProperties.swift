//
//  RecentProduct+CoreDataProperties.swift
//  
//
//  Created by JeongMin Ko on 2022/07/08.
//
//

import Foundation
import CoreData


extension RecentProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecentProduct> {
        return NSFetchRequest<RecentProduct>(entityName: "RecentProduct")
    }

    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var image: String?
    @NSManaged public var dueDate: String?
    @NSManaged public var cPrice: Int32

}

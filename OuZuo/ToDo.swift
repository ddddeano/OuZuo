//
//  ToDo+CoreDataProperties.swift
//  OuZuo
//
//  Created by Daniel Watson on 15/02/2021.
//
//

import Foundation
import CoreData

@objc(ToDo)
public class ToDo: NSManagedObject {

}

extension ToDo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDo> {
        return NSFetchRequest<ToDo>(entityName: "ToDo")
    }

    @NSManaged public var name: String

}

extension ToDo : Identifiable {

}

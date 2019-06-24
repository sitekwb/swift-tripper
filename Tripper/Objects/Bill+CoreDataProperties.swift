//
//  Bill+CoreDataProperties.swift
//  Tripper
//
//  Created by Wojtek on 24/06/2019.
//  Copyright © 2019 Wojciech Sitek. All rights reserved.
//
//

import Foundation
import CoreData


extension Bill {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bill> {
        return NSFetchRequest<Bill>(entityName: "Bill")
    }

    @NSManaged public var name: String?
    @NSManaged public var desc: String?
    @NSManaged public var trip: Trip?
    @NSManaged public var lines: NSSet?

}

// MARK: Generated accessors for lines
extension Bill {

    @objc(addLinesObject:)
    @NSManaged public func addToLines(_ value: Line)

    @objc(removeLinesObject:)
    @NSManaged public func removeFromLines(_ value: Line)

    @objc(addLines:)
    @NSManaged public func addToLines(_ values: NSSet)

    @objc(removeLines:)
    @NSManaged public func removeFromLines(_ values: NSSet)

}

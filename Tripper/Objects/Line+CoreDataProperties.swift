//
//  Line+CoreDataProperties.swift
//  Tripper
//
//  Created by Wojtek on 24/06/2019.
//  Copyright © 2019 Wojciech Sitek. All rights reserved.
//
//

import Foundation
import CoreData


extension Line {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Line> {
        return NSFetchRequest<Line>(entityName: "Line")
    }

    @NSManaged public var balance: Double
    @NSManaged public var person: Person?
    @NSManaged public var bill: Bill?

}

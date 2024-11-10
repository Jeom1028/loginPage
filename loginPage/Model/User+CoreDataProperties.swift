//
//  User+CoreDataProperties.swift
//  loginPage
//
//  Created by 점승현 on 11/9/24.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var password: String?
    @NSManaged public var name: String?

}

extension User : Identifiable {

}

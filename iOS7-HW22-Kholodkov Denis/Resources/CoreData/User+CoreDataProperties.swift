//
//  User+CoreDataProperties.swift
//  iOS7-HW22-Kholodkov Denis
//
//  Created by Денис Холодков on 21.11.2022.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }
    @NSManaged public var birthDay: Date?
    @NSManaged public var fullName: String?
    @NSManaged public var gender: String?
    @NSManaged public var photo: Data?

}

extension User : Identifiable {

}

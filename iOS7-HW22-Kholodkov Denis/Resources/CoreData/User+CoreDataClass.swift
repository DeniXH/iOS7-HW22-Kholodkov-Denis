//
//  User+CoreDataClass.swift
//  iOS7-HW22-Kholodkov Denis
//
//  Created by Денис Холодков on 21.11.2022.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName(entityName: "User"),
                  insertInto: CoreDataManager.instance.context)
    }
}

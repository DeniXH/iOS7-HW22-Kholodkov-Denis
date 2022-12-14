//
//  CoreDataManager.swift
//  iOS7-HW22-Kholodkov Denis
//
//  Created by Денис Холодков on 21.11.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    static let instance = CoreDataManager()

    private init() {}

    // перенос создания контекста в Manager
    lazy var context: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()

    // Описание сущности
    func entityForName(entityName: String) -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName: entityName, in: context) ?? NSEntityDescription()
    }

    func fetchResultController(entityName: String, sortName: String) -> NSFetchedResultsController<NSFetchRequestResult> {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let sortDescriptior = NSSortDescriptor(key: sortName, ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptior]
        let fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                                 managedObjectContext: CoreDataManager.instance.context,
                                                                 sectionNameKeyPath: nil,
                                                                 cacheName: nil)
        return fetchedResultController
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "iOS7_HW22_Kholodkov_Denis")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

//
//  NSManagedObjectExtensions.swift
//  ios-accelerator
//
//  Created by Dubey, Josh (UK - London) on 13/02/2017.
//  Copyright © 2017 Dubey, Josh (UK - London). All rights reserved.
//

import UIKit
import CoreData

extension NSManagedObject {

    static func fetchResultsForEntityInContext(_ context: NSManagedObjectContext,
                                               withName: String,
                                               predicate: NSPredicate? = nil,
                                               fetchLimit: Int? = nil,
                                               sortDescriptors: [NSSortDescriptor]? = nil) -> NSArray? {

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()

        if let entity = NSEntityDescription.entity(forEntityName: withName, in: context) {

            fetchRequest.entity = entity
            if let fetchLimit = fetchLimit {
                fetchRequest.fetchLimit = fetchLimit
            }
            // Entity is not nil, check predicate
            if predicate != nil {
                // predicate is not nil, set and check sort descriptor
                fetchRequest.predicate = predicate!
            }
            // Check sort descriptors
            if sortDescriptors != nil {
                // sort descriptors are not nil set them
                fetchRequest.sortDescriptors = sortDescriptors!
            }

            // Ready to fetch
            do {
                let results = try context.fetch(fetchRequest)
                return results as NSArray?
            } catch _ as NSError {
                return nil
            }
        }

        // if there was no enity just return empty array
        return NSArray()
    }

    static func fetchOrInsertObject<T: NSManagedObject>(forPredicate predicate: NSPredicate, managedObjectContext: NSManagedObjectContext) -> T? {
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: T.self))
            fetchRequest.predicate = predicate

            fetchRequest.fetchLimit = 1

            if let fetchResults = try (T.self as? T)?.managedObjectContext?.fetch(fetchRequest) as? [T] {
                if fetchResults.count > 0 {
                    return fetchResults[0]
                }
            }
        } catch let error {
            print("ERROR: \(error)")
        }

        return nil
    }

    static func insertInto<T: NSManagedObject>(_ context: NSManagedObjectContext) -> T? {
        return NSManagedObject(entity: T.entity(), insertInto: context) as? T
    }
}

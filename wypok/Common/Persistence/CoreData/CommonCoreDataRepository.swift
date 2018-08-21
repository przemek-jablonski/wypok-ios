//
//  CoreDataRepository.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 19/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation
import CoreData

//todo: refactor naming of /Common classes from 'Base' to 'Common' prefix
//class CommonCoreDataRepository<External, Internal: NSManagedObject> {
//    
//    let viewContext: NSManagedObjectContext
//    let entityName: String
//    
//    init(viewContext: NSManagedObjectContext, entityName: String) {
//        self.viewContext = viewContext
//        self.entityName = entityName
//    }
//    
//    func put(_ items: [External], with mapper: @escaping (External, inout Internal) -> ()) {
//        execute(insertOperations: {
//            items.forEach { item in
//                /* todo: this is stupid ("MirkoEntity") */
////                                    mapper(item, &createManagedObjectTemplate(for: "MirkoEntity" , with: viewContext))
//            }
//        }, operationsDidFail: {
//            print("FAIL LOOOL")
//        }, with: viewContext)
//    }
//    
//    func get() {
//        execute(
//            request: NSFetchRequest<Internal>(entityName: entityName),
//            with: viewContext,
//            fetchDidSucceed: { results in
//                
//        },
//            fetchDidFailed: {
//                
//        })
//    }
//    
//    private func execute(insertOperations insertOperationsClosure: () -> (), operationsDidFail failureClosure: () -> (), with viewContext: NSManagedObjectContext) {
//        print("CommonCoreDataRepository, safeInsert, viewContext: \(viewContext)")
//        do {
//            insertOperationsClosure()
//            try viewContext.save()
//            print("CommonCoreDataRepository, safeInsert, viewContext: \(viewContext), success")
//        } catch {
//            print("CommonCoreDataRepository, safeInsert, viewContext: \(viewContext), failure")
//            failureClosure()
//        }
//    }
//    
//    private func createManagedObjectTemplate(for entityName: String, with viewContext: NSManagedObjectContext) -> Internal {
//        return Internal(entity: NSEntityDescription.entity(forEntityName: entityName, in: viewContext)!, insertInto: viewContext)
//    }
//    
//    private func execute(request: NSFetchRequest<Internal>, with viewContext: NSManagedObjectContext, fetchDidSucceed fetchCompleted: ([Internal]) -> (), fetchDidFailed fetchFailed: () -> ()) {
//        print("CommonCoreDataRepository, safeInsert, request: \(request), viewContext: \(viewContext)")
//        do {
//            //            request.returnsObjectsAsFaults = false
//            fetchCompleted(try viewContext.fetch(request))
//            print("CommonCoreDataRepository, safeInsert, request: \(request), viewContext: \(viewContext), success")
//        } catch {
//            print("CommonCoreDataRepository, safeInsert, request: \(request), viewContext: \(viewContext), failure")
//            fetchFailed()
//        }
//    }
//    
//}

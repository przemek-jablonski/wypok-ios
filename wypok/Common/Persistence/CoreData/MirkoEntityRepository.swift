//
//  MirkoEntityRepository.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 19/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation
import CoreData



class MirkoEntityRepository<Internal : NSManagedObject, External: RemoteEntity> {
    
    typealias MirkoEntityFetchClosure = (([Internal]) -> ())
    
    private let viewContext: NSManagedObjectContext
    private let coreDataEntityName: String
    
    init(viewContext: NSManagedObjectContext, coreDataEntityName: String) {
        self.viewContext = viewContext
        self.coreDataEntityName = coreDataEntityName
    }
    
    //todo: this should be template for every method with params
    //todo: 'put items and transform' is nicely prosaic
    //todo: all method parameters should have ext and int arguments
    func put(_ items: [External], and transform: @escaping (External, inout Internal) -> ()) {
        execute({
            items.forEach({ model in
                var managedObject = createManagedObjectTemplate(for: coreDataEntityName, with: viewContext)
                transform(model, &managedObject)
            })
        }, insertsDidSucceed: {
//        print("MirkoEntityRepository, put, SUCCESS")
        }, insertsDidFail: {
//        print("MirkoEntityRepository, put, FAILURE")
        })
    }
    
    //todo: fix naming (should be 'and' and 'successClosure')
    //todo: maybe 'success' will be enough and more prose-like?
    func get(with completionClosure: MirkoEntityFetchClosure) {
        execute(
            NSFetchRequest<Internal>(entityName: coreDataEntityName),
            with: viewContext,
            fetchDidSucceed: { entities in
//                print("MirkoEntityRepository, get, SUCCESS")
                completionClosure(entities)
        },
            fetchDidFail: {
//                print("MirkoEntityRepository, get, FAILURE")
        })
        
    }
    
    private func execute(_ insertsClosure: () -> (), insertsDidSucceed: () -> (), insertsDidFail: () -> ()) {
        do {
            insertsClosure()
            try viewContext.save()
            insertsDidSucceed()
        } catch {
            insertsDidFail()
        }
    }
    
    private func execute(_ fetchRequest: NSFetchRequest<Internal>, with viewContext: NSManagedObjectContext, fetchDidSucceed: MirkoEntityFetchClosure, fetchDidFail: () -> ()) {
        do {
            fetchRequest.includesPendingChanges = false
            fetchRequest.returnsDistinctResults = false
            fetchDidSucceed(try viewContext.fetch(fetchRequest))
        } catch {
            fetchDidFail()
        }
    }
    
    private func createManagedObjectTemplate(for entityName: String, with viewContext: NSManagedObjectContext) -> Internal {
        return Internal(entity: NSEntityDescription.entity(forEntityName: entityName, in: viewContext)!, insertInto: viewContext)
    }
    
}

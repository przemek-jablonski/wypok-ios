//
//  MirkoEntityRepository.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 19/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation
import CoreData

typealias MirkoEntityFetchClosure = (([MirkoEntity]) -> ())

class MirkoEntityRepository {
    
    private let viewContext: NSManagedObjectContext
    private let coreDataEntityName: String
    
    init(viewContext: NSManagedObjectContext, coreDataEntityName: String) {
        self.viewContext = viewContext
        self.coreDataEntityName = coreDataEntityName
    }
    
    func put(models: [MirkoItemModel], and transform: @escaping (MirkoItemModel, inout MirkoEntity) -> ()) {
        execute({
            models.forEach({ model in
                var managedObject = createManagedObjectTemplate(for: coreDataEntityName, with: viewContext)
                transform(model, &managedObject)
            })
        }, insertsDidSucceed: {
        print("MirkoEntityRepository, put, SUCCESS")
        }, insertsDidFail: {
        print("MirkoEntityRepository, put, FAILURE")
        })
    }
    
    func get(with completionClosure: MirkoEntityFetchClosure) {
        execute(
            NSFetchRequest<MirkoEntity>(entityName: coreDataEntityName),
            with: viewContext,
            fetchDidSucceed: { entities in
                print("MirkoEntityRepository, get, SUCCESS")
                completionClosure(entities)
        },
            fetchDidFail: {
                print("MirkoEntityRepository, get, FAILURE")
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
    
    private func execute(_ fetchRequest: NSFetchRequest<MirkoEntity>, with viewContext: NSManagedObjectContext, fetchDidSucceed: MirkoEntityFetchClosure, fetchDidFail: () -> ()) {
        do {
            fetchRequest.includesPendingChanges = false
            fetchRequest.returnsDistinctResults = false
            fetchDidSucceed(try viewContext.fetch(fetchRequest))
        } catch {
            fetchDidFail()
        }
    }
    
    private func createManagedObjectTemplate(for entityName: String, with viewContext: NSManagedObjectContext) -> MirkoEntity {
        return MirkoEntity(entity: NSEntityDescription.entity(forEntityName: entityName, in: viewContext)!, insertInto: viewContext)
    }
    
}

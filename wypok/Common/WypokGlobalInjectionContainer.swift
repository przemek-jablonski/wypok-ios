//
//  WypokInjectionContainer.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 16/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation
import Swinject
import CoreData

class WypokGlobalInjectionContainer {
    
    private static var container: Container = configureContainer()
    
    private static func configureContainer() -> Container {
        var container = Container()
        print("WypokGlobalInjectionContainer, configureContainer: \(container) \(ObjectIdentifier(container).debugDescription)")
        //todo: services protocols for specific modules should not be in the 'common' module
        registerCommonDependencies(&container)
        registerCoreData(&container)
        registerServices(&container)
        registerInteractors(&container)
        registerPresenters(&container)
        return container
    }
    
    private static func registerCommonDependencies(_ container: inout Container) {
        container.register(AppDelegate.self) { r in UIApplication.shared.delegate as! AppDelegate }.inObjectScope(.container)
    }
    
    private static func registerCoreData(_ container: inout Container) {
        container.register(NSManagedObjectContext.self) { r in r.resolve(AppDelegate.self)!.persistentContainer.viewContext }.inObjectScope(.container)
        container.register(MirkoEntityRepository.self) { r in MirkoEntityRepository<MirkoEntity, MirkoItemDto>(viewContext: r.resolve(NSManagedObjectContext.self)!, coreDataEntityName: "MirkoEntity") }.inObjectScope(.container)
    }
    
    private static func registerServices(_ container: inout Container) {
        container.register(WypokService.self) { r in WypokService() }.inObjectScope(.container)
        container.register(FrontPageService.self) { r in r.resolve(WypokService.self)! }.inObjectScope(.container)
        container.register(MirkoService.self) { r in r.resolve(WypokService.self)! }.inObjectScope(.container)
    }
    
    private static func registerInteractors(_ container: inout Container) {
        //todo: presenters dont have interfaces, but interactors do
        //todo: solution - remove interface from interactors
        container.register(FrontPageInteractor.self) { r in WypokFrontPageInteractor(r.resolve(FrontPageService.self)!) }.inObjectScope(.container)
        container.register(MirkoInteractor.self) { r in WypokMirkoInteractor(service: r.resolve(MirkoService.self)!) }.inObjectScope(.container)
    }
    
    private static func registerPresenters(_ container: inout Container) {
        container.register(WypokFrontPagePresenter.self) { r in WypokFrontPagePresenter(r.resolve(FrontPageInteractor.self)!)}.inObjectScope(.container)
        container.register(WypokMirkoPresenter.self) { r in WypokMirkoPresenter(r.resolve(MirkoInteractor.self)!)}.inObjectScope(.container)
    }
    
    static func get <T :Any>(_ classType: T.Type) -> T {
        return container.resolve(classType)!
    }
    
}

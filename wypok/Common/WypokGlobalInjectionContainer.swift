//
//  WypokInjectionContainer.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 16/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation
import Swinject

class WypokGlobalInjectionContainer {
    
    static func get <T :Any>(_ classType: T.Type) -> T {
        return container.resolve(classType)!
    }
    
    private static var container: Container = configureContainer(Container())
    
    private static func configureContainer(_ container: Container) -> Container {
        print("WypokGlobalInjectionContainer, configureContainer: \(container) \(ObjectIdentifier(container).debugDescription)")
        //todo: services protocols for specific modules should not be in common package
        container.register(WypokService.self) { r in WypokService() }.inObjectScope(ObjectScope.container)
        container.register(FrontPageService.self) { r in r.resolve(WypokService.self)! }.inObjectScope(ObjectScope.container)
        container.register(MirkoService.self) { r in r.resolve(WypokService.self)! }.inObjectScope(ObjectScope.container)
        return container
    }
    
}

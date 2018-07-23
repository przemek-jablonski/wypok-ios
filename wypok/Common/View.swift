//
//  View.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 23/07/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

protocol View {
    associatedtype VS
    
    func render(with viewState: VS)

}

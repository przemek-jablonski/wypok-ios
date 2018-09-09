//
//  View.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 23/07/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation
import UIKit

class BaseView<P: Presenter, VS: ViewState>: UIViewController, View {
    
    internal var presenter: P?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.presenter = WypokGlobalInjectionContainer.get(P.self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.attach(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.detach(self)
    }
    
    func render(_ viewState: ViewState) {
        render(viewState as! VS)
    }
    
    func render(_ viewState: VS) {
    }
    
}

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

    required convenience init?(coder aDecoder: NSCoder) {
        print("BaseView, init, coder: \(aDecoder)")
        self.init(presenter: nil, coder: aDecoder)
    }
    
    init?(presenter:P?, coder aDecoder: NSCoder) {
        print("BaseView, init, coder: \(aDecoder), presenter: \(String(describing: presenter))")
        super.init(coder: aDecoder)
        self.presenter = presenter
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("BaseView, viewDidAppear, \(animated)")
        presenter?.attach(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.detach(self)
    }
    
    func render(_ viewState: ViewState) {
        print("BaseView, render: \(viewState)")
        render(viewState as! VS)
    }
    
    func render(_ viewState: VS) {
        print("BaseView, render: \(viewState)")
    }
    
}

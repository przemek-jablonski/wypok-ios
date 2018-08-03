//
//  ViewController.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 22/07/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Foundation

typealias P = WypokFrontPagePresenter
typealias VS = WypokFrontPageViewState

class WypokFrontPageViewController : BaseView<P, VS> {
    
    private let apiKeysInteractor: ApiKeysProvider = WypokApiKeysProvider()
    
    required init?(coder aDecoder: NSCoder) {
        print("WypokFrontPageViewController, init, coder: \(aDecoder))")
        super.init(presenter: WypokFrontPagePresenter(), coder: aDecoder)
    }
    
    override func render(_ viewState : VS) {
        print("render, viewState: \(viewState)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    private func requestFailed() {
        
    }
    
}


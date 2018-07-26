//
//  ViewController.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 22/07/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import UIKit
import Alamofire

//typealias VS = WypokFrontPageViewState

class WypokFrontPageViewController : UIViewController, View {
    typealias VS = WypokFrontPageViewState
    
//    let presenter = WypokFrontPagePresenter<WypokFrontPageViewController>()
    
    internal func render(_ viewState : VS) {
        print("render, viewState: \(viewState)")
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        presenter.attach(self)
////        Alamofire
////            .validate()
////            .responseString(completionHandler: { dataResponse in
////                print("dataResponse: \(dataResponse)")
////                print("dataResponse: \(dataResponse.result.value!)")
////            }
////        )
//    }
    
//    override func viewWillDisappear(_ animated: Bool) {
////        presenter.detach(self)
//    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("init, \(aDecoder), self: \(self)")
    }
    
    deinit {
        print("deinit, self: \(self)")
    }
    
    override func viewDidLoad() {
        print("viewDidLoad, self: \(self)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear, \(animated), self: \(self)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear, \(animated), self: \(self)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear, \(animated), self: \(self)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear, \(animated), self: \(self)")
    }

}


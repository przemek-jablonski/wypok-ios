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

class WypokFrontPageViewController : UIViewController, FrontPageView {
    typealias VS = WypokFrontPageViewState
    
    let presenter = WypokFrontPagePresenter<WypokFrontPageViewController>()
    
    internal func render(with viewState : VS) {
        print("render, viewState: \(viewState)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.attach(self)
        Alamofire
            .validate()
            .responseString(completionHandler: { dataResponse in
                print("dataResponse: \(dataResponse)")
                print("dataResponse: \(dataResponse.result.value!)")
            }
        )
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        presenter.detach(self)
    }

}


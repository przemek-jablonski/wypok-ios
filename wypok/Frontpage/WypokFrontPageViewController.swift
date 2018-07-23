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

class WypokFrontPageViewController : UIViewController {
    
    
    private func render(_ viewState : WypokFrontPageViewState) {
        print("render, viewState: \(viewState)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Alamofire
            .validate()
            .responseString(completionHandler: { dataResponse in
                print("dataResponse: \(dataResponse)")
                print("dataResponse: \(dataResponse.result.value!)")
            }
        )
    }

}


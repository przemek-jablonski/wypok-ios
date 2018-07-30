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
    
//    let presenter: FrontPagePresenter = WypokFrontPagePresenter()
    
    lazy var apiKeysDictionary: NSDictionary = { getApiKeysDictionary() }()
    
    internal func render(_ viewState : VS) {
        print("render, viewState: \(viewState)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let apiKey = apiKeysDictionary.value(forKey: "WYPOK_APIKEY") as! String
        let md5Hash = apiKeysDictionary.value(forKey: "TMP_MD5_HASH") as! String
//        presenter.attach(self)
        Alamofire
            .request("https://a.wykop.pl/links/promoted/appkey,\(apiKey)", headers: ["apisign" : "\(md5Hash)"])
            .validate()
            .responseString(completionHandler: { dataResponse in
                print("dataResponse: \(dataResponse)")
                print("dataResponse: \(dataResponse.result.value!)")
            }
        )
    }
    
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
    
    private func getApiKeysDictionary() -> NSDictionary {
        return NSDictionary(contentsOfFile: Bundle.main.path(forResource: "ApiKeys", ofType: "plist")!)!
    }

}


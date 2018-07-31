//
//  ViewController.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 22/07/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import UIKit
import Alamofire

typealias P = WypokFrontPagePresenter
typealias VS = WypokFrontPageViewState

class WypokFrontPageViewController : BaseView<P, VS> {
    
    lazy var apiKeysDictionary: NSDictionary = { getApiKeysDictionary() }()
  
    required init?(coder aDecoder: NSCoder) {
        print("WypokFrontPageViewController, init, coder: \(aDecoder))")
        super.init(presenter: WypokFrontPagePresenter(), coder: aDecoder)
    }
    
    override func render(_ viewState : VS) {
        print("render, viewState: \(viewState)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let apiKey = apiKeysDictionary.value(forKey: "WYPOK_APIKEY") as! String
//        let md5Hash = apiKeysDictionary.value(forKey: "TMP_MD5_HASH") as! String
//        Alamofire
//            .request("https://a.wykop.pl/links/promoted/appkey,\(apiKey)", headers: ["apisign" : "\(md5Hash)"])
//            .validate()
//            .responseString(completionHandler: { dataResponse in
//                print("dataResponse: \(dataResponse)")
//                print("dataResponse: \(dataResponse.result.value!)")
//            }
//        )
    }
    
    private func getApiKeysDictionary() -> NSDictionary {
        return NSDictionary(contentsOfFile: Bundle.main.path(forResource: "ApiKeys", ofType: "plist")!)!
    }

}


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

class WypokFrontPageViewController : BaseView<WypokFrontPageViewState> {
    
    typealias VS = WypokFrontPageViewState
    
    let presenter = WypokFrontPagePresenter()
    
    lazy var apiKeysDictionary: NSDictionary = { getApiKeysDictionary() }()
    
    override func render(_ viewState : WypokFrontPageViewState) {
        print("render, viewState: \(viewState)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.attach(self)
        let apiKey = apiKeysDictionary.value(forKey: "WYPOK_APIKEY") as! String
        let md5Hash = apiKeysDictionary.value(forKey: "TMP_MD5_HASH") as! String
        Alamofire
            .request("https://a.wykop.pl/links/promoted/appkey,\(apiKey)", headers: ["apisign" : "\(md5Hash)"])
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
    
    private func getApiKeysDictionary() -> NSDictionary {
        return NSDictionary(contentsOfFile: Bundle.main.path(forResource: "ApiKeys", ofType: "plist")!)!
    }

}


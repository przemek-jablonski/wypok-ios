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
        let apiKey = apiKeysDictionary.value(forKey: "WYPOK_APIKEY") as! String
        let md5Hash = apiKeysDictionary.value(forKey: "TMP_MD5_HASH") as! String
        Alamofire
            .request("https://a.wykop.pl/links/promoted/appkey,\(apiKey)", headers: ["apisign" : "\(md5Hash)"])
            .validate()
            .responseJSON { response in
                var items: [FrontPageItemDto?] = [FrontPageItemDto]()
                if let data = response.data {
                    items = (try! JSON(data: data).array?.map{jsonObject in FrontPageItemDto(fromJson: jsonObject)})!
                }
                print("items: \(items)")
        }
    }
    
    private func requestFailed() {
        
    }
    
    private func getApiKeysDictionary() -> NSDictionary {
        return NSDictionary(contentsOfFile: Bundle.main.path(forResource: "ApiKeys", ofType: "plist")!)!
    }
    
}


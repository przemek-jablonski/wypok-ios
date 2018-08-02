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
    
    private let apiKeysInteractor: ApiKeysInteractor = WypokApiKeysInteractor()
    
    required init?(coder aDecoder: NSCoder) {
        print("WypokFrontPageViewController, init, coder: \(aDecoder))")
        super.init(presenter: WypokFrontPagePresenter(), coder: aDecoder)
    }
    
    override func render(_ viewState : VS) {
        print("render, viewState: \(viewState)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Alamofire
            .request("https://a.wykop.pl/links/promoted/appkey,\(apiKeysInteractor.getApiKey())", headers: ["apisign" : "\(apiKeysInteractor.getMd5Hash(from: "https://a.wykop.pl/links/promoted/appkey,\(apiKeysInteractor.getApiKey())"))"])
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
    
}


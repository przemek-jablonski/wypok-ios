//
//  WypokFrontPageViewController.swift
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

class WypokFrontPageViewController : BaseView<P, VS>, UITableViewDataSource, UITableViewDelegate {
    
    private static let ARTICLE_CELL_NIB_FILE_NAME = "FrontPageArticleCell"
    private static let ARTICLE_CELL_REUSE_IDENTIFIER = "FrontPageArticleCell"
    
    @IBOutlet weak var articlesTableView: UITableView!
    private var articlesList = [FrontPageItemModel]()
    
    
    required init?(coder aDecoder: NSCoder) {
        print("WypokFrontPageViewController, init, coder: \(aDecoder))")
        super.init(presenter: WypokFrontPagePresenter(), coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //todo: reuseIdentifier is specified in Storyboard as well, is it needed twice?
        articlesTableView.register(
            UINib(nibName: WypokFrontPageViewController.ARTICLE_CELL_NIB_FILE_NAME, bundle: nil),
            forCellReuseIdentifier: WypokFrontPageViewController.ARTICLE_CELL_REUSE_IDENTIFIER
        )
    }
    
    override func render(_ viewState : VS) {
        switch viewState {
        case VS.ARTICLES_LIST(let articles):
            renderArticlesList(with: articles)
        case VS.LOADING:
            renderLoading()
        case VS.ERROR:
            renderError()
        }
    }
    
    private func renderArticlesList(with articles: [FrontPageItemModel]) {
        print("renderArticlesList, articles: \(articles)")
        articlesList = articles
        articlesTableView.reloadData()
    }
    
    private func renderLoading() {
        print("renderLoading")
    }
    
    private func renderError() {
        print("renderError")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article : FrontPageItemModel = articlesList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: WypokFrontPageViewController.ARTICLE_CELL_REUSE_IDENTIFIER, for: indexPath) as! FrontPageArticleCell
        cell.updateContents(titleText: article.title, linkText: article.itemSourceUrl, upvoteCount: article.upvoteCount, commentCount: article.commentCount, dateText: "asd")
        return cell
    }

    
}

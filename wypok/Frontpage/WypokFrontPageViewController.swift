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

class WypokFrontPageViewController: BaseView<P, VS>, UITableViewDataSource, UITableViewDelegate {
    
    private static let ESTIMATED_ROW_HEIGHT_DIVIDER: CGFloat = 2
    
    @IBOutlet weak var articlesTableView: UITableView!
    private var articlesList = [FrontPageItemModel]()
    
    //todo: to be removed when some DI is in place
    required init?(coder aDecoder: NSCoder) {
        super.init(presenter: WypokFrontPagePresenter(), coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupArticlesTableView(tableView: articlesTableView)
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
    
    private func setupArticlesTableView(tableView: UITableView) {
        articlesTableView.register(
            UINib(nibName: FrontPageArticleTableViewCell.XIB_FILENAME, bundle: nil),
            forCellReuseIdentifier: FrontPageArticleTableViewCell.REUSE_IDENTIFIER
        )
        articlesTableView.rowHeight = UITableViewAutomaticDimension
        articlesTableView.estimatedRowHeight = UIScreen.main.bounds.size.height / WypokFrontPageViewController.ESTIMATED_ROW_HEIGHT_DIVIDER
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article : FrontPageItemModel = articlesList[indexPath.row]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: FrontPageArticleTableViewCell.REUSE_IDENTIFIER,
            for: indexPath
            ) as! FrontPageArticleTableViewCell
        cell.updateContents(titleText: article.title, previewImageUrl: article.previewImageUrl, linkText: article.itemSourceUrl, upvoteCount: article.upvoteCount, commentCount: article.commentCount, dateText: "asd")
        return cell
    }
    
    //swipe from left
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(action:
            UIContextualAction(style: .normal, title: "wykop", color: .green) { (action, view, success) in
                print("leadingSwipeActionsConfigurationForRowAt, action: \(action.title)")
                success(true)
            }
        )
    }
    
    //swipe from right
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [
            UIContextualAction(style: .normal, title: "zakop", color: .red) { (action, view, success) in
                print("trailingSwipeActionsConfigurationForRowAt, action: \(action.title)")
                success(true)
            },
            UIContextualAction(style: .normal, title: "ukryj", color: .darkGray) { (action, view, success) in
                print("trailingSwipeActionsConfigurationForRowAt, action: \(action.title)")
                success(true)
            }]
        )
    }
    
}

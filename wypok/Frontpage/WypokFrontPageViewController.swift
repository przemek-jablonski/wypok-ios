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
import IGListKit

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
        if (areAllRowsAffectedByUpdate(original: articlesList, updated: articles)) {
            articlesList = articles
            articlesTableView.reloadData()
        } else {
            let (inserts, deletes, updates) = calculateRowsAffectedByUpdate(original: articlesList, updated: articles)
            articlesList = articles
            articlesTableView.reloadData()
//            articlesTableView.performBatchUpdates({
//                articlesTableView.insertRows(at: inserts, with: UITableViewRowAnimation.automatic)
//                articlesTableView.reloadRows(at: updates, with: UITableViewRowAnimation.automatic)
//                articlesTableView.deleteRows(at: deletes, with: UITableViewRowAnimation.automatic)
//            }) { _ in }
        }
        
    }
    
    private func areAllRowsAffectedByUpdate(original: [FrontPageItemModel], updated: [FrontPageItemModel]) -> Bool {
        return original.isEmpty || updated.isEmpty
    }
    
    private func calculateRowsAffectedByUpdate(original: [FrontPageItemModel], updated: [FrontPageItemModel]) -> ([IndexPath], [IndexPath], [IndexPath]) {
        let diffResult = ListDiffPaths(fromSection: 0, toSection: 0, oldArray: original, newArray: updated, option: .equality)
        return (diffResult.inserts, diffResult.deletes, diffResult.updates)
        
//        articlesTableView.performBatchUpdates({
//
//
////            articlesTableView.deleteRows(at: diffResult.updates.all, with: UITableViewRowAnimation.automatic)
////            articlesTableView.insertRows(at: diffResult.inserts, with: UITableViewRowAnimation.automatic)
////            articlesTableView.reloadRows(at: diffResult.updates, with: UITableViewRowAnimation.automatic)
//        }) { (completed) in
//
//        }
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
        colorizeCell(cell: cell, model: article)
        return cell
    }
    
    private func colorizeCell(cell: UITableViewCell, model: FrontPageItemModel) {
        if (model.isUpvoted) {
            cell.backgroundColor = .green
            return
        }
        
        if (model.isDownvoted) {
            cell.backgroundColor = .red
            return
        }
        
        if (model.isHidden) {
            cell.backgroundColor = .lightGray
            return
        }
        
        cell.backgroundColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.onFrontPageItemClicked(row: indexPath.row)
    }
    
    
    //swipe from left
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //todo: if post already upvoted, this option should not be shown (same for downvote and hide)
        return UISwipeActionsConfiguration(action:
            UIContextualAction(style: .normal, title: "wykop", color: .green) { (action, view, success) in
                self.presenter?.onFrontPageItemActionCalled(row: indexPath.row, action: FrontPageItemAction.UPVOTE)
                success(true)
            }
        )
    }
    
    //swipe from right
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [
            UIContextualAction(style: .normal, title: "zakop", color: .red) { (action, view, success) in
                self.presenter?.onFrontPageItemActionCalled(row: indexPath.row, action: FrontPageItemAction.DOWNVOTE)
                success(true)
            },
            UIContextualAction(style: .normal, title: "ukryj", color: .darkGray) { (action, view, success) in
                self.presenter?.onFrontPageItemActionCalled(row: indexPath.row, action: FrontPageItemAction.HIDE)
                success(true)
            }]
        )
    }
    
}

extension FrontPageItemModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return self.isEqual(object)
    }
    
    
}

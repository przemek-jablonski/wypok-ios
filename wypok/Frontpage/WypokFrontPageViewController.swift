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

class WypokFrontPageViewController: BaseView<WypokFrontPagePresenter, WypokFrontPageViewState>, UITableViewDataSource, UITableViewDelegate {
    
    private static let ESTIMATED_ROW_HEIGHT_DIVIDER: CGFloat = 2
    
    @IBOutlet weak var articlesTableView: UITableView!
    private var articles = [FrontPageItemModel]()
    
    //todo: to be removed when some DI is in place
    required init?(coder aDecoder: NSCoder) {
        super.init(presenter: WypokFrontPagePresenter(), coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupArticlesTableView(tableView: articlesTableView, cellType: FrontPageArticleTableViewCell.self)
    }
    
    private func setupArticlesTableView(tableView: UITableView, cellType: WypokTableViewCell.Type) {
        articlesTableView.register(with: cellType.registerData)
        articlesTableView.rowHeight = UITableViewAutomaticDimension
        articlesTableView.estimatedRowHeight = UIScreen.main.bounds.size.height / WypokFrontPageViewController.ESTIMATED_ROW_HEIGHT_DIVIDER
    }
    
    override func render(_ viewState : WypokFrontPageViewState) {
        switch viewState {
        case .ARTICLES_LIST(let articles):
            renderArticlesList(with: articles)
        case .LOADING:
            renderLoading()
        case .ERROR:
            renderError()
        }
    }
    
    private func renderArticlesList(with articles: [FrontPageItemModel]) {
        print("renderArticlesList, articles: \(articles)")
        if (areAllRowsAffectedByUpdate(original: self.articles, updated: articles)) {
            self.articles = articles
            articlesTableView.reloadData()
        } else {
            let (inserts, deletes, updates) = calculateRowsAffectedByUpdate(original: self.articles, updated: articles)
            self.articles = articles
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
    }
    
    private func renderLoading() {
        print("renderLoading")
    }
    
    private func renderError() {
        print("renderError")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return update(cell:
            tableView.dequeueReusableCell(
                withIdentifier: FrontPageArticleTableViewCell.REUSE_IDENTIFIER,
                for: indexPath
                ) as! FrontPageArticleTableViewCell,
                      with: articles[indexPath.row]
        )
        
    }
    
    private func update(cell tableViewCell: FrontPageArticleTableViewCell, with item: FrontPageItemModel) -> FrontPageArticleTableViewCell {
        tableViewCell.updateContents(titleText: item.title, previewImageUrl: item.previewImageUrl, linkText: item.itemSourceUrl, upvoteCount: item.upvoteCount, commentCount: item.commentCount, dateText: "asd")
        colorizeCell(cell: tableViewCell, model: item)
        return tableViewCell
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
        performSegue(withIdentifier: "FrontPageDetailsSegue", sender: self)
    }
    
    
    //swipe from left
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //todo: if post already upvoted, this option should not be shown (same for downvote and hide)
        return UISwipeActionsConfiguration(
            UIContextualAction(style: .normal, title: "wykop", color: .green) { (action, view, success) in
                self.presenter?.onFrontPageItemActionCalled(row: indexPath.row, action: FrontPageItemAction.UPVOTE)
                success(true)
            }
        )
    }
    
    //todo: swipes should be done only from right side to left (since undo is 'swipe from left' gesture and will be used in other app elements)
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

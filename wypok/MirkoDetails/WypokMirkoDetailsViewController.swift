//
//  WypokMirkoDetailViewController.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 08/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation
import UIKit

class WypokMirkoDetailsViewController: BaseView<WypokMirkoDetailsPresenter, WypokMirkoDetailsViewState>, UITableViewDataSource, UITableViewDelegate {

    private var entry: MirkoItemModel?
    private var entryComments = [MirkoCommentDto]()
    
    @IBOutlet weak var tableView: UITableView!
    
    //todo: why init like this is required?
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(with: MirkoEntryTableViewCell.self.registerData)
        tableView.register(with: MirkoCommentViewTableViewCell.self.registerData)
    }
    
    override func render(_ viewState: WypokMirkoDetailsViewState) {
        switch viewState {
        case .content(let entry):
            reloadTableData(with: entry)
            break
        case .error(let error):
            break
        case .loading:
            break
        }
    }
    
    func receivedSelectedEntryId(_ id: Int) {
        presenter?.onSelectedEntryIdReceived(id)
    }
    
    private func reloadTableData(with entry: MirkoItemModel) {
        self.entry = entry
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (entry == nil) {
            return 0
        } else {
            return 1 // + entry.commentcount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return update(rowId: indexPath.row,
                      with: tableView.dequeueReusableCell(withIdentifier: MirkoEntryTableViewCell.REUSE_IDENTIFIER, for: indexPath) as! MirkoEntryTableViewCell,
                      and: entry!)
    }
    
    private func update(rowId: Int, with cell: MirkoEntryTableViewCell, and item: MirkoItemModel) -> MirkoEntryTableViewCell {
        cell.updateContents(
            DEBUGTEXTOLOL: "asd",
            authorImageUrl: item.authorAvatarUrl,
            authorName: item.authorName,
            authorDevice: item.application,
            entryContent: item.content.convertToAttributedString().setFontFace(font: UIFont.systemFont(ofSize: 13)),
            entryEmbedImageUrl: item.embed?.previewImageUrl,
            entryUpvotesCount: item.upvoteCount,
            entryCommentsCount: item.commentCount)
        return cell
    }
    
}

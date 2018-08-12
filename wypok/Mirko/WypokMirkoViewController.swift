//
//  WypokMirkoViewController.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 23/07/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation
import UIKit

class WypokMirkoViewController: BaseView<WypokMirkoPresenter, WypokMirkoViewState>, UITableViewDataSource, UITableViewDelegate {
    
    private var entries = [MirkoItemModel]()
    
    @IBOutlet weak var listTypeControl: UISegmentedControl!
    @IBOutlet weak var entriesTableView: UITableView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(presenter: WypokMirkoPresenter(), coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEntriesTableView(tableView: entriesTableView, cellType: MirkoEntryTableViewCell.self)
    }
    
    private func setupEntriesTableView(tableView: UITableView, cellType: WypokTableViewCell.Type) {
        entriesTableView.register(with: cellType.registerData)
    }
    
    override func render(_ viewState: WypokMirkoViewState) {
        switch viewState {
        case .RECENTS_ERROR:
            break
        case .RECENTS_LOADING:
            break
        case .RECENTS_EMPTY_LIST:
            break
        case .RECENTS_LIST(_):
            break
        case .HOT_ERROR:
            break
        case .HOT_LOADING:
            break
        case .HOT_EMPTY_LIST:
            break
        case .HOT_LIST(_):
            break
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

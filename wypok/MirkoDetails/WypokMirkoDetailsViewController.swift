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
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(with: MirkoEntryTableViewCell.self.registerData)
        tableView.register(with: MirkoCommentViewTableViewCell.self.registerData)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "asdasd")!
    }
    
}

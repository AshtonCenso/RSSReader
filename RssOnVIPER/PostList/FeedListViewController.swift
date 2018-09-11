//
//  FeedListViewController.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 10.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import UIKit

class FeedListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FeedListViewProtocol, FeedListRouterProtocol {
   
    private var presenter: FeedListPresenter = FeedListPresenter(withView: self as! FeedListViewProtocol, withRouter: self as! FeedListRouterProtocol)
    
    func showLoading() {
        // show indicator
    }
    
    func hideLoading() {
        // hide indicator
    }
    
    func showData(data: Array<FeedListEntity>) {
        // table view update data
    }
    
    func openDetails(item: FeedListEntity) {
        // open details
    }
    
    @IBOutlet var postListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewLoaded()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath as IndexPath)
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter.onItemClicked(position: indexPath.row)
    }
    
}

//
//  FeedListViewProtocol.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 11.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import UIKit

protocol FeedListViewProtocol: class {
    func showLoading()
    func hideLoading()
    func showData(data: [FeedVM])
}

protocol FeedListInteractorProtocol {
    func loadFeed() -> [FeedVM]
}

protocol FeedListRouterProtocol {
    func openDetails(item: FeedVM)
}

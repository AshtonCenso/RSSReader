//
//  FeedFavoriteListPresenter.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 11.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import Foundation

class FeedFavoriteListPresenter {
    
    private let view: FeedFavoriteListViewProtocol
    private let router: FeedFavoriteListRouter
    
    private let loadFeedInteractor: FeedFavoriteListInteractorProtocol = FeedFavoriteListInteractor()
    
    private var feed: [FeedListFavoriteEntity]? = nil
    
    init(withView view: FeedFavoriteListViewProtocol, withRouter router: FeedFavoriteListRouter) {
        self.view = view
        self.router = router
    }
    
    func onViewLoaded(){
        view.showLoading()
        feed = loadFeedInteractor.loadFeed()
        view.hideLoading()
        view.showData(data: feed!)
    }
    
    func onItemClicked(position: Int) {
        print("\(position)")
        router.openDetails(item: feed![position])
    }
    
}

//
//  FeedListPresenter.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 10.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

class FeedListPresenter {
    
    private let view: FeedListViewProtocol
    private let router: FeedListRouterProtocol
    private let loadFeedInteractor: FeedListInteractorProtocol = FeedListInteractor()
    private var feed: [FeedVM]? = []
    
    init(withView view: FeedListViewProtocol, withRouter router: FeedListRouterProtocol ) {
        self.view = view
        self.router = router
    }
    
    func onViewLoaded() {
        view.showLoading()
        feed = loadFeedInteractor.loadFeed()
        view.hideLoading()
        view.showData(data: feed!)
    }
    
    func onItemClicked(position: Int) {
        print("FeedListPresenter position = \(position)")
//        router.openDetails(item: feed![position])
    }
    
    func openDetails(item: FeedVM) {
        print("openDetails FeedListPresenter")
    }
}

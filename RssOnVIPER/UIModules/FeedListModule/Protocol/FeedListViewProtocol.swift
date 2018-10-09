//
//  FeedListViewProtocol.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 11.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

// MARK: View <-> Presenter Protocols
protocol FeedListPresenterToViewProtocol: class where Self: FeedListViewController {
    func showLoading()
    func hideLoading()
    func showData(data: [FeedVM])
}

protocol FeedListViewToPresenterProtocol {
    func openFeedDetail() -> FeedVM
}

// MARK: Presenter <-> Interactor Protocols
protocol FeedListPresenterToInteractorProtocol {
    func loadFeed()
    func tempFuncForRouter() -> [FeedVM]
}

protocol FeedListInteractorToPresenterProtocol {
    func loadedFeeds(feeds: [FeedVM])
}

// MARK: Presenter <-> Router Protocols
protocol FeedListPresenterToRouterProtocol {
    func openDetails(item: FeedVM)
}

protocol FetchFeedDataSource {
    func getFeeds(result: Result<[FeedVM]>)
    func receivedFeeds() -> [FeedVM]
}

enum Result<Value> {
    case success(Value)
    case failure(Error)

    /// Returns `true` if the result is a success, `false` otherwise.
    public var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }

    /// Returns `true` if the result is a failure, `false` otherwise.
    public var isFailure: Bool {
        return !isSuccess
    }

    /// Returns the associated value if the result is a success, `nil` otherwise.
    public var value: Value? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }

    /// Returns the associated error value if the result is a failure, `nil` otherwise.
    public var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}

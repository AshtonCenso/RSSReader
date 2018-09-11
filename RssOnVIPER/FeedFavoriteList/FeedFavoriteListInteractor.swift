//
//  FeedFavoriteListInteractor.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 11.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import Foundation

protocol FeedFavoriteListInteractorProtocol {
    
    func loadFeed() -> [FeedListFavoriteEntity]
}

class FeedFavoriteListInteractor : FeedFavoriteListInteractorProtocol {
    
    func loadFeed() -> [FeedListFavoriteEntity] {
        return Array()
    }
    
}

//
//  FeedListInteractor.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 10.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import Foundation

protocol FeedListInteractorProtocol {
    
    func loadFeed() -> [FeedListEntity]
}

class FeedListInteractor : FeedListInteractorProtocol {
    
    func loadFeed() -> [FeedListEntity] {
        return Array()
    }
    
}

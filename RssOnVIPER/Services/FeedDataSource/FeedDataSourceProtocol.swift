//
//  FeedDataSourceProtocol.swift
//  RssOnVIPER
//
//  Created by Ash on 10/9/18.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import Foundation


protocol FeedDataSource {
    func getFeeds(completion: (Result<[FeedVM]>) -> Void)
}

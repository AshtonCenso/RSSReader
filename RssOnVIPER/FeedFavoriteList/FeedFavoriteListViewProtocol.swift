//
//  FeedFavoriteListViewProtocol.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 11.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import Foundation

protocol FeedFavoriteListViewProtocol {
    
    func showLoading()
    
    func hideLoading()
    
    func showData(data: [FeedListFavoriteEntity])
}

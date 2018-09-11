//
//  FeedFavoriteListEntity.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 11.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import Foundation

class FeedListFavoriteEntity {
    
    init(title: String, description: String, image: String?) {
        self.title = title
        self.description = description
        self.image = image
    }
    
    var image: String?
    var title: String
    var description: String
}

//
//  FeedListEntity.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 10.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import Foundation

class FeedListEntity {
    
    init(title: String, description: String, image: String?) {
        self.title = title
        self.description = description
        self.image = image
    }
    
    var image: String?
    var title: String
    var description: String
}

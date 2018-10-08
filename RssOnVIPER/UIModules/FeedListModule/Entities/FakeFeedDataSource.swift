//
//  FakeFeedDataSource.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 21.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import Foundation

final class FakeFeedDataSource: FeedDataSource {
    
    func getFeeds(result: Result<[FeedVM]>) {
        switch result {
        case .success(let posts):
            print(posts) 

        case .failure:
            print("error")
        }
    }

    func fakeFeedDataSource() {
        
    }


    func loadFakeData() -> [FeedVM] {
        let testFeed: [FeedVM] = [FeedVM(imageUrl: "https://www.w3schools.com/w3css/img_lights.jpg",
                                         imagePlaceholderName: "String1", title: "Feed 1", details: "Feed detail 1"),
                                  FeedVM(imageUrl: "https://www.w3schools.com/w3css/img_forest.jpg",
                                         imagePlaceholderName: "String2", title: "Feed 2", details: "Feed detail 2"),
                                  FeedVM(imageUrl: "https://www.w3schools.com/w3css/img_mountains.jpg",
                                         imagePlaceholderName: "String3", title: "Feed 3", details: "Feed detail 3"),
                                  FeedVM(imageUrl: "https://www.w3schools.com/w3css/img_nature.jpg",
                                         imagePlaceholderName: "String4", title: "Feed 4", details: "Feed detail 4"),
                                  FeedVM(imageUrl: "https://www.w3schools.com/w3css/img_snowtops.jpg",
                                         imagePlaceholderName: "String5", title: "Feed 5", details: "Feed detail 5"),
                                  FeedVM(imageUrl: "https://www.w3schools.com/w3css/img_monterosso.jpg",
                                         imagePlaceholderName: "String6", title: "Feed 6", details: "Feed detail 6"),
                                  FeedVM(imageUrl: "https://www.w3schools.com/w3css/img_workshop.jpg",
                                         imagePlaceholderName: "String7", title: "Feed 7", details: "Feed detail 7"),
                                  FeedVM(imageUrl: "https://www.w3schools.com/w3images/streetart2.jpg",
                                         imagePlaceholderName: "String8", title: "Feed 8", details: "Feed detail 8")]
        
        return testFeed
    }
}

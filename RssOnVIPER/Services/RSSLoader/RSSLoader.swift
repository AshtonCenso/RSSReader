//
//  RSSLoader.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 09.10.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireRSSParser

public enum NetworkResponseStatus {
    case success
    case error(string: String?)
}

final class RssLoader {

    public static func getRSSFeedResponse(completionHandler:
        @escaping (_ response: RSSFeed?, _ status: NetworkResponseStatus) -> Void) {
        Alamofire.request("http://feeds.bbci.co.uk/news/world/rss.xml").responseRSS { response in
            if let rssFeedXML = response.result.value {
                completionHandler(rssFeedXML, .success)
            } else {
                completionHandler(nil, .error(string: response.result.error?.localizedDescription))
            }
        }
    }
}

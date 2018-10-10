//
//  Injectable.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 19.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import Foundation

protocol Injectable {
    associatedtype Dependencies

    func inject(dependencies: Dependencies)
}

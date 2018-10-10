//
//  Configurable.swift
//  RssOnVIPER
//
//  Created by Ash on 10/9/18.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import Foundation


protocol Configurable {
    associatedtype Config
    func configure(config: Config)
}

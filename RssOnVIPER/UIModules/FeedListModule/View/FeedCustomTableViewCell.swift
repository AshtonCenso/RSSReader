//
//  FeedCustomTableViewCell.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 20.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import UIKit
import Kingfisher

protocol Configurable {
    associatedtype Config
    func configure(config: Config)
}

final class FeedCustomTableViewCell: UITableViewCell, Configurable {

    typealias Config = FeedVM

    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!

    func configure(config: FeedVM) {
        self.selectionStyle = .none
        titleLabel.text = config.title
        detailLabel.text = config.details
        let url = URL(string: config.imageUrl)
        feedImageView.kf.setImage(with: url)
    }
//    func set(forPost post: FeedVM) {
//
//    }
}

//
//  FeedCustomTableViewCell.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 20.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import UIKit
import Kingfisher

class FeedCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!

    func set(forPost post: FeedVM) {
        self.selectionStyle = .none
        titleLabel.text = post.title
        detailLabel.text = post.details
        let url = URL(string: post.imageUrl)
        feedImageView.kf.setImage(with: url)
    }
}

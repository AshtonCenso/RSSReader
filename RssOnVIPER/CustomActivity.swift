//
//  CustomActivity.swift
//  RssOnVIPER
//
//  Created by Anton Tsykanov on 11.09.2018.
//  Copyright © 2018 Anton Tsykanov. All rights reserved.
//

import Foundation
import UIKit

class CustomActivity: UIActivity {
    
    func initActivity(start: Bool, view: UIView) {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.frame = view.bounds
        activityIndicator.startAnimating()
        
        if (start) {
            view.addSubview(activityIndicator)
        }
        else {
            activityIndicator.removeFromSuperview()
        }
    }
}

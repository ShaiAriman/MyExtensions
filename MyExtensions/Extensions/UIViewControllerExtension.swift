//
//  NotificationExtension.swift
//  CryptoDashboard
//
//  Created by Shai Ariman on 21/05/2019.
//  Copyright © 2019 Shai Ariman. All rights reserved.
//

import Foundation
import SafariServices
import StoreKit

public extension UIViewController {
    
    func openUrl(url : String) {
        if let url = URL(string: url) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
    
    func requestRatingOrReview(isUserInitiated : Bool = false, appLaunchInstacesCount : Int, appLaunchInstacesCountsAllowed : Set<Int> = [7, 25, 60, 120]) {
        if isUserInitiated || appLaunchInstacesCountsAllowed.contains(appLaunchInstacesCount) {
            SKStoreReviewController.requestReview()
        }
    }
}

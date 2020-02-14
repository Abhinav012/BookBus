//
//  Extensions.swift
//  BookBus
//
//  Created by Thanos on 28/01/20.
//  Copyright © 2020 Thanos. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}

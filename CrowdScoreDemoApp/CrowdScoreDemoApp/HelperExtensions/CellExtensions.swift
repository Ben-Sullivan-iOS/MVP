//
//  CellExtensions.swift
//  CrowdScoreDemoApp
//
//  Created by Ben Sullivan on 16/11/2018.
//  Copyright © 2018 Ben Sullivan. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self.self)
    }
}

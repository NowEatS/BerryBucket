//
//  BBHomeTabBarController.swift
//  BerryBucket
//
//  Created by 태원 on 6/15/23.
//

import UIKit
import SwiftUI

class BBHomeTabBarController: UITabBarController {
    
    var defaultIndex = 0 {
        didSet {
            self.selectedIndex = defaultIndex
        }
    }
    
    override func viewDidLoad() {
        print("BBTabBarController is Loaded")
        self.selectedIndex = defaultIndex
    }
}

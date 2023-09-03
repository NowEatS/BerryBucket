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
        loadViewControllers()
        self.selectedIndex = defaultIndex
    }
}

extension BBHomeTabBarController {
    private func loadViewControllers() {
        // 탭바컨트롤러의 viewcontrollers에 할당할 배열 생성
        var controllers = [UIViewController]()
        
        // 각 스토리보드에 해당하는 UIStoryboard 인스턴스 생성
        let myStoryboard = UIStoryboard(name: "MyViewController", bundle: nil)
        let feedStoryboard = UIStoryboard(name: "FeedViewController", bundle: nil)
        let searchStoryboard = UIStoryboard(name: "SearchViewController", bundle: nil)
        let moreStoryboard = UIStoryboard(name: "MoreViewController", bundle: nil)
        
        // Create view controllers from the storyboards
        if let myViewController = myStoryboard.instantiateViewController(withIdentifier: "MyViewController") as? MyViewController {
            controllers.append(myViewController)
        }
        if let feedController = feedStoryboard.instantiateViewController(withIdentifier: "FeedViewController") as? FeedViewController {
            controllers.append(feedController)
        }
        if let searchController = searchStoryboard.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController {
            controllers.append(searchController)
        }
        if let moreController = moreStoryboard.instantiateViewController(withIdentifier: "MoreViewController") as? MoreViewController {
            controllers.append(moreController)
        }
        
        self.viewControllers = controllers
    }
}

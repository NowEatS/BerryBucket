//
//  ViewController.swift
//  BerryBucket
//
//  Created by 태원 on 6/14/23.
//

import UIKit
import SwiftUI
import Combine

class BBRootViewController: UIViewController {
    
    @IBOutlet private weak var bottomHombarView: UIView!
    @IBOutlet private weak var tabBarView: UIView!
    @IBOutlet private weak var homeTabBarController: UIView!
    
    private var tabBarViewModel = TabBarViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tabBarViewModel.$selectedIndex
            .sink { [weak self] in
                self?.updateTabBarControllerIndex(to: $0)
            }
            .store(in: &cancellables)
        
        addCustomTabBarView()
    }
    
    private func updateTabBarControllerIndex(to index: Int) {
        print("updateTabBarControllerIndex is called : index is \(index)")
        for child in children {
            if let tabBarController = child as? UITabBarController {
                tabBarController.selectedIndex = index
            }
        }
    }
}

extension BBRootViewController {
    private func addCustomTabBarView() {
        let bbHomeTabBarView = BBHomeTabBarView(tabBarViewModel: self.tabBarViewModel)
        let host = UIHostingController(rootView: bbHomeTabBarView)
        if let hostView = host.view {
            tabBarView.addSubview(hostView)
            hostView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                hostView.topAnchor.constraint(equalTo: tabBarView.topAnchor),
                hostView.leftAnchor.constraint(equalTo: tabBarView.leftAnchor),
                hostView.rightAnchor.constraint(equalTo: tabBarView.rightAnchor),
                hostView.bottomAnchor.constraint(equalTo: tabBarView.bottomAnchor)
            ])
        }
    }
}

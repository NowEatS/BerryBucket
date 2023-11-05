//
//  MyViewController.swift
//  BerryBucket
//
//  Created by 태원 on 6/15/23.
//

import UIKit
import SwiftUI
import Combine

class MyViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var bucketTabBarView: UIView!
//    @IBOutlet weak var totalBucketListView: TotalBucketlistView!

    private var viewModel: MyBucketTabViewModel = MyBucketTabViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = BerryBucketColor.gray1
        print("MyVC is Loaded")
        
        setUpTableView()
        
        viewModel.onCellDataUpdated = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension MyViewController: UITableViewDelegate, UITableViewDataSource {
    func setUpTableView() {
        tableView.backgroundColor = BerryBucketColor.gray2
        tableView.sectionHeaderTopPadding = 0
        tableView.register(MyBucketCell.self, forCellReuseIdentifier: "MyBucketCell")
        tableView.register(MyCategoryCell.self, forCellReuseIdentifier: "MyCategoryCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
        viewModel.fetchData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.y = scrollView.contentOffset.y < 0 ? 0 : scrollView.contentOffset.y
    }
     
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            switch viewModel.selectedTabIndex {
            case .all, .dday, .challange:
                return viewModel.buckets.count
            case .category:
                return viewModel.categories.count
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let vc = UIHostingController(rootView: MyProfileView())
            return vc.view
        } else if section == 1 {
            let vc = UIHostingController(rootView: MyBucketTabView(viewModel: viewModel))
            return vc.view
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.selectedTabIndex {
        case .all, .dday:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyBucketCell", for: indexPath) as! MyBucketCell
            cell.setData(bucket: viewModel.buckets[indexPath.row], showDday: viewModel.selectedTabIndex == .dday)
            return cell
        case .category:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCategoryCell", for: indexPath) as! MyCategoryCell
            cell.setData(category: viewModel.categories[indexPath.row])
            
            return cell
        case .challange:
            return UITableViewCell()
        }
    }
}

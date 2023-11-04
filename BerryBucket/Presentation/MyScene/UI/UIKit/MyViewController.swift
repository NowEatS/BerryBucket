//
//  MyViewController.swift
//  BerryBucket
//
//  Created by 태원 on 6/15/23.
//

import UIKit
import SwiftUI

class MyViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var bucketTabBarView: UIView!
//    @IBOutlet weak var totalBucketListView: TotalBucketlistView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = BerryBucketColor.gray1
        print("MyVC is Loaded")
        
        setUpTableView()
    }
}

extension MyViewController: UITableViewDelegate, UITableViewDataSource {
    func setUpTableView() {
//        tableView.backgroundColor = BerryBucketColor.gray2
        tableView.sectionHeaderTopPadding = 0
        tableView.register(MyBucketCell.self, forCellReuseIdentifier: "MyBucketCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
     
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 1 ? bucketData.count : 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let vc = UIHostingController(rootView: MyProfileView())
            return vc.view
        } else if section == 1 {
            let vc = UIHostingController(rootView: MyBucketTabView())
            return vc.view
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyBucketCell", for: indexPath) as! MyBucketCell
        cell.setData(bucket: bucketData[indexPath.row])
        return cell
    }
}

let bucketData = [
    Bucket(id: 0, title: "스위스 여행가자", bucketType: "NORMAL", exposureStatus: "PUBLIC", status: 0, dDay: 10, userCount: 0, goalCount: 1),
    Bucket(id: 0, title: "스위스 여행가자스위스 여행가자스위스 여행가자스위스 여행가자스위스 여행가자스위스 여행가자", bucketType: "NORMAL", exposureStatus: "PUBLIC", status: 0, dDay: -20, userCount: 0, goalCount: 1),
    Bucket(id: 0, title: "스위스 여행가자", bucketType: "NORMAL", exposureStatus: "PUBLIC", status: 0, dDay: 0, userCount: 0, goalCount: 1),
    Bucket(id: 0, title: "스위스 여행가자", bucketType: "NORMAL", exposureStatus: "PUBLIC", status: 0, dDay: 0, userCount: 1, goalCount: 3),
]

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
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 1 ? 10 : 0
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
        
        return cell
    }
}

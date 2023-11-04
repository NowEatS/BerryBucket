//
//  MyBucketCell.swift
//  BerryBucket
//
//  Created by 태원 on 8/28/23.
//

import UIKit
import SwiftUI

class MyBucketCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setData(bucket: Bucket) {
        setupViews(bucket: bucket)
    }
    
    private func setupViews(bucket: Bucket) {
        self.backgroundColor = BerryBucketColor.gray2
        let configuration = UIHostingConfiguration {
            MyBucketCellView(bucketTitle: bucket.title, bucketDday: bucket.dDay, goalCount: bucket.goalCount, userCount: bucket.userCount)
        }
        self.contentConfiguration = configuration
    }
}

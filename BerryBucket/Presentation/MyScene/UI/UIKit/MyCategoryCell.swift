//
//  MyCategoryCell.swift
//  BerryBucket
//
//  Created by 태원 on 11/6/23.
//

import UIKit
import SwiftUI

class MyCategoryCell: UITableViewCell {

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

    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.contentConfiguration = nil
    }
    
    func setData(category: Category) {
        setupViews(category: category)
    }
    
    private func setupViews(category: Category) {
        self.backgroundColor = BerryBucketColor.gray2
        let configuration = UIHostingConfiguration {
            MyCategoryCellView(categoryTitle: category.title, bucketCount: category.bucketlistCount)
        }
        self.contentConfiguration = configuration
    }
}

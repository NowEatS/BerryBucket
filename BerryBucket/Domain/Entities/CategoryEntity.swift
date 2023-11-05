//
//  CategoryEntity.swift
//  BerryBucket
//
//  Created by 태원 on 11/5/23.
//

import Foundation

struct Category: Codable, Hashable {
    let id: Int
    let title: String
    let defaultYn: Bool
    let bucketlistCount: Int
}

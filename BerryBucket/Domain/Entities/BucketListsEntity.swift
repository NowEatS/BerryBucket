//
//  BucketListsEntity.swift
//  BerryBucket
//
//  Created by 태원 on 7/2/23.
//

import Foundation

enum BucketType: String {
    case ORIGINAL = "ORIGINAL"
    case TOGETHER = "TOGETHER"
    case CHALLENGE = "CHALLENGE"
}

enum ExposureStatus: String {
    case PUBLIC = "PUBLIC"
    case PRIVATE = "PRIVATE"
    case FOLLOWER = "FOLLOWER"
}

struct Bucket: Codable {
    let id: Int
    let title: String
    let bucketType: String
    let exposureStatus: String
    let status: Int
    let dDay: Int
    let userCount: Int
    let goalCount: Int
}

//
//  UserProfileEntity.swift
//  BerryBucket
//
//  Created by 태원 on 10/16/23.
//

import Foundation

struct UserProfile: Codable {
    let imgUrl: String
    let name: String
    let bio: String
    let badgeTitle: String
    let followingCount: Int
    let followerCount: Int
}

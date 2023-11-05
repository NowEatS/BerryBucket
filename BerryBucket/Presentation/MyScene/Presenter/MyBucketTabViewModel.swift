//
//  MyBucketTabViewModel.swift
//  BerryBucket
//
//  Created by 태원 on 11/5/23.
//

import UIKit
import Combine

enum BucketTabIndex: Int {
    case all
    case category
    case dday
    case challange
}

class MyBucketTabViewModel: ObservableObject {
    @Published var buckets: [Bucket] = [] {
        didSet {
            DispatchQueue.main.async {
                self.onCellDataUpdated?()
            }
        }
    }
    @Published var categories: [Category] = [] {
        didSet {
            DispatchQueue.main.async {
                self.onCellDataUpdated?()
            }
        }
    }
    @Published var selectedTabIndex: BucketTabIndex = .all
    
    var onCellDataUpdated: (() -> Void)?
    
    func fetchData() {
        // 탭에 따라 서버로부터 다른 데이터를 요청합니다.
        switch selectedTabIndex {
        case .all:
            // 서버로부터 Bucket 데이터를 요청하고 buckets 배열을 업데이트합니다.
            // 예시 코드입니다. 실제 서버 요청 코드로 대체해야 합니다.
            self.buckets = fetchBuckets()
        case .category:
            // 서버로부터 Category 데이터를 요청하고 categories 배열을 업데이트합니다.
            // 예시 코드입니다. 실제 서버 요청 코드로 대체해야 합니다.
            self.categories = fetchCategories()
        case .dday:
            self.buckets = fetchDDay()
        case .challange:
            // 챌린지 데이터를 처리하는 코드
            self.buckets = fetchChallenge()
        }
    }
    
    // 서버로부터 Bucket 데이터를 가져오는 메서드 (예시)
    private func fetchBuckets() -> [Bucket] {
        // 서버 요청 로직 구현
        // ...
        
        return [
            Bucket(id: 0, title: "기본 버킷이다", bucketType: "NORMAL", exposureStatus: "PUBLIC", status: 0, dDay: 10, userCount: 0, goalCount: 1),
            Bucket(id: 0, title: "기본 버킷이다기본 버킷이다기본 버킷이다기본 버킷이다기본 버킷이다기본 버킷이다기본 버킷이다", bucketType: "NORMAL", exposureStatus: "PUBLIC", status: 0, dDay: -20, userCount: 0, goalCount: 1),
            Bucket(id: 0, title: "무슨 버킷이냐", bucketType: "NORMAL", exposureStatus: "PUBLIC", status: 0, dDay: 0, userCount: 0, goalCount: 1),
            Bucket(id: 0, title: "횟수 버킷이다", bucketType: "NORMAL", exposureStatus: "PUBLIC", status: 0, dDay: 0, userCount: 1, goalCount: 3),
            
            Bucket(id: 0, title: "완료 버킷이다", bucketType: "NORMAL", exposureStatus: "PUBLIC", status: 0, dDay: 0, userCount: 1, goalCount: 1),
        ]
    }
    
    // 서버로부터 Category 데이터를 가져오는 메서드 (예시)
    private func fetchCategories() -> [Category] {
        // 서버 요청 로직 구현
        // ...
        return [
            Category(id: 0, title: "기본", defaultYn: true, bucketlistCount: 3),
            Category(id: 1, title: "몰람마", defaultYn: false, bucketlistCount: 1),
            Category(id: 2, title: "운동", defaultYn: false, bucketlistCount: 5),
            Category(id: 3, title: "개발", defaultYn: false, bucketlistCount: 4)
        ]
    }
    
    private func fetchDDay() -> [Bucket] {
        return [
            Bucket(id: 0, title: "스위스 여행가자", bucketType: "NORMAL", exposureStatus: "PUBLIC", status: 0, dDay: 10, userCount: 0, goalCount: 1),
            Bucket(id: 0, title: "스위스 여행가자스위스 여행가자스위스 여행가자스위스 여행가자스위스 여행가자스위스 여행가자", bucketType: "NORMAL", exposureStatus: "PUBLIC", status: 0, dDay: -20, userCount: 0, goalCount: 1),
            Bucket(id: 0, title: "스위스 여행가자", bucketType: "NORMAL", exposureStatus: "PUBLIC", status: 0, dDay: 0, userCount: 0, goalCount: 1),
            Bucket(id: 0, title: "스위스 여행가자", bucketType: "NORMAL", exposureStatus: "PUBLIC", status: 0, dDay: 0, userCount: 1, goalCount: 3),
        ]
    }
    
    private func fetchChallenge() -> [Bucket] {
        return []
    }
}

//
//  TotalBucketToolsView.swift
//  BerryBucket
//
//  Created by 태원 on 9/2/23.
//

import SwiftUI

struct TotalBucketToolsView: View {
    var buckets: [Bucket] = []
    private var progressBuckets: [Bucket] {
        return buckets.filter {$0.userCount < $0.goalCount}
    }
    
    private var completedBuckets: [Bucket] {
        return buckets.filter {$0.userCount == $0.goalCount}
    }
    
    var body: some View {
        
        HStack(spacing: 0) {
            Text("진행 중  \(progressBuckets.count)")
                .font(.notoSansKR(.regular, size: 13))
                .foregroundStyle(Color(uiColor: BerryBucketColor.gray8))
            
            Color(uiColor: BerryBucketColor.gray6)
                .frame(width: 1, height: 10)
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            
            Text("완료 \(completedBuckets.count)")
                .font(.notoSansKR(.regular, size: 13))
                .foregroundStyle(Color(uiColor: BerryBucketColor.gray8))
            
            Spacer()
            
            Button(action: {
                print("didTapFilterButton")
            }, label: {
                Image("btn32Filter")
            })
            
            Color(uiColor: BerryBucketColor.gray4)
                .frame(width: 1, height: 16)
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
        
            Button(action: {
                print("didTapSortButton")
            }, label: {
                Image("btn32Search")
            })
            
        }
        .frame(height: 64)
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
        .background(Color(uiColor: BerryBucketColor.gray2))
    }
}

#Preview {
    TotalBucketToolsView()
}

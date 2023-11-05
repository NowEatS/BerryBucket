//
//  ChallengeToolsView.swift
//  BerryBucket
//
//  Created by 태원 on 11/6/23.
//

import SwiftUI

struct ChallengeToolsView: View {
    
    var challangeBuckets: [Bucket] = []
    var body: some View {
        HStack(spacing: 0) {
            
            Text("챌린지 \(challangeBuckets.count)개 진행 중. ")
                .font(.system(size: 13))
                .foregroundColor(Color(uiColor: BerryBucketColor.main3))
            
            Text(" 화이팅! ")
                .font(.system(size: 13))
                .foregroundColor(Color(uiColor: BerryBucketColor.gray8))
            
            Text("🙌")
                .font(.system(size: 20))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
            
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
    ChallengeToolsView()
}

//
//  DDayToolsView.swift
//  BerryBucket
//
//  Created by 태원 on 11/6/23.
//

import SwiftUI

struct DDayToolsView: View {
    
    var dDayBuckets: [Bucket] = []
    private var overDateBuckets: [Bucket] {
        return dDayBuckets.filter {$0.dDay > 0}
    }
    
    var body: some View {
        HStack(spacing: 0) {
            
            if overDateBuckets.count > 0 {
                Text("지난 디데이가 ")
                    .font(.notoSansKR(.regular, size: 13))
                    .foregroundColor(Color(uiColor: BerryBucketColor.gray8))
                
                Text("\(overDateBuckets.count)개 ")
                    .font(.notoSansKR(.regular, size: 13))
                    .foregroundColor(Color(uiColor: BerryBucketColor.error2))
                
                Text("있어요!")
                    .font(.notoSansKR(.regular, size: 13))
                    .foregroundColor(Color(uiColor: BerryBucketColor.gray8))
                
            } else {
                Button(action: {
                    print("didTapMakeReminderButton")
                }, label: {
                    Text("디데이 알림 설정하기")
                        .font(.notoSansKR(.regular, size: 13))
                        .foregroundColor(Color(uiColor: BerryBucketColor.subD4))
                })
            }
            
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
    DDayToolsView()
}

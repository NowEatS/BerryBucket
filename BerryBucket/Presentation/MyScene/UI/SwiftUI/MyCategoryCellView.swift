//
//  MyCategoryCellView.swift
//  BerryBucket
//
//  Created by 태원 on 11/6/23.
//

import SwiftUI

struct MyCategoryCellView: View {
    var categoryTitle: String = ""
    var bucketCount: Int = 0
    
    var body: some View {
        HStack() {
            // 카테고리 타이틀
            Text(categoryTitle)
                .font(.notoSansKR(.medium, size: 14))
                .foregroundStyle(Color(uiColor: BerryBucketColor.gray10))
                .lineLimit(1)
                .padding(EdgeInsets(top: 22, leading: 16, bottom: 22, trailing: 12))
            
            Spacer()
            
            Text("\(bucketCount)")
                .font(.notoSansKR(.medium, size: 14))
                .foregroundStyle(Color(uiColor: BerryBucketColor.gray7))
                .lineLimit(1)
                .padding(EdgeInsets(top: 22, leading: 0, bottom: 22, trailing: 20))
        }
        .frame(minHeight: 64)
        .background(Color(uiColor: BerryBucketColor.gray1))
        //.border(<#T##content: ShapeStyle##ShapeStyle#>)
        .cornerRadius(4)
        .compositingGroup()
        .shadow(color: Color(red: 147/255, green: 149/255, blue: 157/255, opacity: 0.25), radius: 2.0)
    }
}

#Preview {
    MyCategoryCellView()
}

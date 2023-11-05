//
//  CategoryToolsView.swift
//  BerryBucket
//
//  Created by 태원 on 11/6/23.
//

import SwiftUI

struct CategoryToolsView: View {
    
    var recommendedCategories: [Category] = [Category(id: 0, title: "여행", defaultYn: false, bucketlistCount: 0)]
    var body: some View {
        
        HStack(spacing: 0) {
            Text("추천 카테고리")
                .font(.system(size: 13))
                .foregroundStyle(Color(uiColor: BerryBucketColor.gray8))
            
            Spacer().frame(width:8)
            
            ForEach(recommendedCategories, id: \.self) { category in
                Text("#"+category.title)
                    .font(.system(size: 13))
                    .foregroundStyle(Color(uiColor: BerryBucketColor.main4))
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
            
            Spacer(minLength: 8)
            
            Button(action: {
                print("didTapEditButton")
            }, label: {
                Text("편집")
                    .font(.system(size: 16))
                    .foregroundStyle(Color(uiColor: BerryBucketColor.gray9))
            })
            
            Color(uiColor: BerryBucketColor.gray4)
                .frame(width: 1, height: 16)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 8))
        
            Button(action: {
                print("didTapSortButton")
            }, label: {
                Image("btn32Search")
            })
        }
        .frame(height: 48)
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
        .background(Color(uiColor: BerryBucketColor.gray2))
    }
}

#Preview {
    CategoryToolsView()
}

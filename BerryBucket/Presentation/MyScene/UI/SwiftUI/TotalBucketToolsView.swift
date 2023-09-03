//
//  TotalBucketToolsView.swift
//  BerryBucket
//
//  Created by 태원 on 9/2/23.
//

import SwiftUI

struct TotalBucketToolsView: View {
    var body: some View {
        
        HStack() {
            Text("진행 중 27")
                .font(.system(size: 13))
                .foregroundStyle(Color(uiColor: BerryBucketColor.gray8))
            
            Color(uiColor: BerryBucketColor.gray6)
                .frame(width: 1, height: 10)
            
            Text("완료 0")
                .font(.system(size: 13))
                .foregroundStyle(Color(uiColor: BerryBucketColor.gray8))
            
            Spacer()
            
            
            
            Button(action: {
                print("didTapFilterButton")
            }, label: {
                Image("btn32Filter")
            })
            
            Color(uiColor: BerryBucketColor.gray4)
                .frame(width: 1, height: 16)
        
            Button(action: {
                print("didTapSortButton")
            }, label: {
                Image("btn32Search")
            })
            
        }
        .frame(height: 48)
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
    }
}

#Preview {
    TotalBucketToolsView()
}

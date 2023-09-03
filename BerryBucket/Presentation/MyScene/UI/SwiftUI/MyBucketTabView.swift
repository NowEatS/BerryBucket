//
//  MyBucketTabView.swift
//  BerryBucket
//
//  Created by 태원 on 9/2/23.
//

import SwiftUI

struct MyBucketTabView: View {
    var body: some View {
        VStack() {
            HStack() {
                Button {
                    print("didTapAllButton")
                } label: {
                    Text("전체")
                        .foregroundStyle(Color(BerryBucketColor.gray10))
                        .font(.system(size: 16, weight: .bold))
                }
                .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 4))

                Button {
                    print("didTapCategoryButton")
                } label: {
                    Text("카테고리")
                        .foregroundStyle(Color(BerryBucketColor.gray6))
                        .font(.system(size: 16, weight: .bold))
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 4))
                
                Button {
                    print("didTapDDayButton")
                } label: {
                    Text("디데이")
                        .foregroundStyle(Color(BerryBucketColor.gray6))
                        .font(.system(size: 16, weight: .bold))
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 4))
                
                Button {
                    print("didTapChallangeButton")
                } label: {
                    Text("챌린지")
                        .foregroundStyle(Color(BerryBucketColor.gray6))
                        .font(.system(size: 16, weight: .bold))
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 4))
                
                Spacer()
            }
            .frame(height: 44)
            
            TotalBucketToolsView()
                .background(Color(uiColor: BerryBucketColor.gray2))
        }
    }
}

#Preview {
    MyBucketTabView().previewLayout(.fixed(width: .infinity, height: 40))
}

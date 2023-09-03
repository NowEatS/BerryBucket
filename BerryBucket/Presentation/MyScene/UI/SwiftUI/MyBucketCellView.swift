//
//  MyBucketCellView.swift
//  BerryBucket
//
//  Created by 태원 on 8/28/23.
//

import SwiftUI

struct MyBucketCellView: View {
    var body: some View {
        ZStack() {
            HStack() {
                Text("스위스 여행가자!")
                    .font(.system(size: 14))
                    .lineLimit(2)
                    .lineSpacing(8.0)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                
                Spacer(minLength: 0)
                
                CheckButtonView(action: {
                    print("Tap Complete Button")
                })
                .frame(width: 32, height: 32)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            }
            .frame(minHeight: 64)
            .background(Color(BerryBucketColor.gray1))
            .cornerRadius(4.0)
            .compositingGroup()
            .shadow(color: Color(red: 147/255, green: 149/255, blue: 157/255, opacity: 0.25), radius: 2.0)
        }
    }
}

#Preview {
    MyBucketCellView().previewLayout(.fixed(width: .infinity, height: 80))
}

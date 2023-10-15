//
//  MyProfileView.swift
//  BerryBucket
//
//  Created by 태원 on 9/2/23.
//

import SwiftUI

struct MyProfileView: View {
    let needToCheckNoti: Bool = true
    
    var strokeStyle: StrokeStyle = .init(lineWidth: 3, lineCap: .round, lineJoin: .round)
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: 16)
            
            HStack() {
                Spacer()
                ZStack {
                    Image("btn32Alarm")
                        .frame(width: 32, height: 32)
                    if needToCheckNoti {
                        Circle()
                            .fill(Color(uiColor: BerryBucketColor.error2))
                            .frame(width: 4, height: 4)
                            .offset(x: 10, y: -10)
                    }
                }
                .onTapGesture {
                    // Open Notification View
                    print("Open Notification View")
                }
                
                Image("btn32More")
                    .onTapGesture {
                        // Open Setting View
                        print("Open Setting View")
                    }
            }
            .padding(16)
            .frame(height: 32)
            
            Spacer().frame(height: 8)
            
            ZStack {
                Circle()
                    .trim(from: 0.0, to: 0.9)
                    .stroke(Color(uiColor: BerryBucketColor.main4.withAlphaComponent(1.0)), style: strokeStyle)
                    .rotationEffect(.degrees(-90))
                    .frame(width: 86, height: 86)
                
                Image("test_profile")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)

                Rectangle()
                    .fill(.green.opacity(0.3))
                    .frame(width: 40, height: 40)
                    .offset(y: 43)
            }
            .frame(height: 116)
            
            
            Spacer().frame(height: 4)
            
            Text("게으른 개발자")
                .frame(height: 22)
                .font(.system(size: 15))
                .foregroundStyle(Color(uiColor: BerryBucketColor.main3))
            
            Spacer().frame(height: 4)
            
            Text("태원")
                .frame(height: 22)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(Color(uiColor: BerryBucketColor.gray10))
            
            Spacer().frame(height: 8)
            
            Text("ㅎㅇㄹ 저는 인프피 / 뭐?")
                .frame(height: 22)
                .font(.system(size: 13))
                .foregroundStyle(Color(uiColor: BerryBucketColor.gray6))
            
            Spacer().frame(height: 24)
            
            HStack {
                Spacer()
                Spacer()
                VStack(spacing: 0) {
                    Text("300")
                        .frame(height: 30)
                        .font(.system(size: 20))
                        .foregroundStyle(Color(uiColor: BerryBucketColor.gray10))
                    
                    Text("팔로워")
                        .frame(height: 20)
                        .font(.system(size: 14))
                        .foregroundStyle(Color(uiColor: BerryBucketColor.gray7))
                }
                Spacer()
                VStack(spacing: 0) {
                    Text("120")
                        .frame(height: 30)
                        .font(.system(size: 20))
                        .foregroundStyle(Color(uiColor: BerryBucketColor.gray10))
                    
                    Text("팔로잉")
                        .frame(height: 20)
                        .font(.system(size: 14))
                        .foregroundStyle(Color(uiColor: BerryBucketColor.gray7))
                }
                Spacer()
                Spacer()
            }
            
            Spacer()
        }
        .frame(height: 352)
    }
}

#Preview {
    MyProfileView().previewLayout(.fixed(width: .infinity, height: 352))
}

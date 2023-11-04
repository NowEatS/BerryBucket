//
//  MyBucketCellView.swift
//  BerryBucket
//
//  Created by 태원 on 8/28/23.
//

import SwiftUI

struct MyBucketCellView: View {
    var bucketTitle: String = "스위스 여행가자"
    var bucketDday: Int = -9
    var goalCount: Int = 1
    @State var userCount: Int = 0
    
    @State private var progress: Double = 0.0
    
    @State private var needToPlayAnimation: Bool = false
    
    @State private var cellBorderColor: Color = Color(uiColor: BerryBucketColor.main2)
    @State private var cellBorderWidth: CGFloat = 0
    
    @State private var isRepeatBucket: Bool = false
    @State private var isComplete: Bool = false
    @State private var completeStateFirst: Bool = false
    
    @State var showDday: Bool = true
    
    private var isOverDate: Bool { bucketDday > 0 }
    
    private var titleTopPadding: CGFloat {
        return showDday ? 32 : 22
    }
    private var titleBottomPadding: CGFloat {
        return isRepeatBucket ? 18 : 22
    }
    
    private var cellHeight: CGFloat {
        if showDday {
            // 디데이 표시 높이
            if isRepeatBucket {
                return 98
            }
            return 74
        } else {
            if isRepeatBucket {
                // 횟수 표시 높이
                return 88
            }
            // 기본 버킷리스트 높이
            return 64
        }
    }
    
    private var stringForDDayText: String {
        return bucketDday == 0 ? "D-Day" : isOverDate ? "D+\(bucketDday)" : "D\(bucketDday)"
    }
    
    var body: some View {
        ZStack() {
            HStack() {
                VStack(alignment: .leading, spacing: 0) {
                    // 타이틀
                    Text(bucketTitle)
                        .font(.system(size: 14))
                        .foregroundStyle(Color(uiColor: isComplete || completeStateFirst ? BerryBucketColor.gray6 : BerryBucketColor.gray9))
                        .lineLimit(showDday || isRepeatBucket ? 1: 2)
                        .lineSpacing(8.0)
                    
                    // 진행도
                    if isRepeatBucket && (!isComplete || !completeStateFirst) {
                        HStack(spacing: 0) {
                            ProgressView(value: progress, total: Double(goalCount))
                                .progressViewStyle(LinearProgressViewStyle(tint: Color(uiColor: showDday ? (isOverDate ? BerryBucketColor.gray6: BerryBucketColor.subD2) : BerryBucketColor.main2)))
                                .frame(width: 176, height: 8)
                                .cornerRadius(2)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 12))
                            
                            Text("\(userCount)")
                                .font(.system(size: 13))
                                .foregroundStyle(Color(uiColor: showDday ? (isOverDate ? BerryBucketColor.gray6: BerryBucketColor.subD2) : BerryBucketColor.main2))
                            Text("/\(goalCount)")
                                .font(.system(size: 13))
                                .foregroundStyle(Color(uiColor: BerryBucketColor.gray4))
                        }
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
                        .onAppear() {
                            progress = Double(userCount)
                        }
                    }
                }
                .padding(EdgeInsets(top: titleTopPadding, leading: 16, bottom: titleBottomPadding, trailing: 0))
                
                Spacer(minLength: 0)
                
                if !isComplete, !completeStateFirst {
                    CheckButtonView(action: {
                        print("Tap Complete Button")
                        if userCount < goalCount {
                            userCount += 1
                            progress += 1
                            
                            needToPlayAnimation = userCount == goalCount
                            if userCount == goalCount {
                                // 딤드 애니메이션 시작
                                withAnimation(.easeInOut) {
//                                    cellBorderColor = Color(uiColor: BerryBucketColor.main2)
                                    cellBorderWidth = 1
                                } completion: {
                                    withAnimation(.easeInOut) {
                                        cellBorderWidth = 0
                                        completeStateFirst = true
                                        showDday = false
                                        isRepeatBucket = false
                                    } completion: {
                                        withAnimation(.easeInOut) {
                                            isComplete = true
                                        }
                                    }
                                }
                            }
                        }
                    })
                    .frame(width: 32, height: 32)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                }
            }
            .frame(minHeight: cellHeight)
            .background(Color(uiColor: isComplete ? BerryBucketColor.gray3 : BerryBucketColor.gray1))
            .border(cellBorderColor, width: cellBorderWidth)
            .cornerRadius(4)
            .compositingGroup()
            .shadow(color: Color(red: 147/255, green: 149/255, blue: 157/255, opacity: 0.25), radius: 2.0)
            
            if showDday {
                VStack(spacing: 0) {
                    HStack() {
                        Spacer().frame(width: 16)
                        
                        // D-Day Text
                        Text(stringForDDayText)
                            .font(.system(size: 12, weight: .bold))
                            .foregroundStyle(Color(uiColor: BerryBucketColor.gray1))
                            .frame(height: 22)
                            .padding(EdgeInsets(top: 3, leading: 8, bottom: 3, trailing: 8))
                            .background(Color(uiColor: isOverDate ?
                                              BerryBucketColor.error2 :
                                                BerryBucketColor.subD3))
                            .cornerRadius(4, corners: [.bottomLeft, .bottomRight])
                        
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
        .onAppear() {
            isComplete = userCount == goalCount
            if !isComplete {
                isRepeatBucket = goalCount > 1
            }
        }
    }
}

#Preview {
    MyBucketCellView().previewLayout(.fixed(width: .infinity, height: 74))
}

//
//  MyBucketTabView.swift
//  BerryBucket
//
//  Created by 태원 on 9/2/23.
//

import SwiftUI

struct MyBucketTabView: View {
    @ObservedObject var viewModel: MyBucketTabViewModel
    
    private var tabIndicatorLeadingPadding: CGFloat {
        let padding: [CGFloat] = [26, 77, 158, 223]
        return padding[viewModel.selectedTabIndex.rawValue]
    }
    private var tabIndicatorWidth: CGFloat {
        let width: [CGFloat] = [34, 62, 48, 48]
        return width[viewModel.selectedTabIndex.rawValue]
    }
    
    private func setSelectedTabIndex(_ tabIndex: BucketTabIndex) {
        withAnimation {
            viewModel.selectedTabIndex = tabIndex
        } completion: {
            viewModel.fetchData()
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Button {
                    print("didTapAllButton")
                    if viewModel.selectedTabIndex != .all {
                        setSelectedTabIndex(.all)
                    }
                } label: {
                    Text("전체")
                        .foregroundStyle(Color(viewModel.selectedTabIndex == .all ? BerryBucketColor.gray10 : BerryBucketColor.gray6))
                        .font(.system(size: 16, weight: .bold))
                }
                .padding(EdgeInsets(top: 0, leading: 28, bottom: 0, trailing: 0))
                
                Button {
                    print("didTapCategoryButton")
                    if viewModel.selectedTabIndex != .category {
                        setSelectedTabIndex(.category)
                    }
                } label: {
                    Text("카테고리")
                        .foregroundStyle(Color(viewModel.selectedTabIndex == .category ? BerryBucketColor.gray10 : BerryBucketColor.gray6))
                        .font(.system(size: 16, weight: .bold))
                }
                .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
                
                Button {
                    print("didTapDDayButton")
                    if viewModel.selectedTabIndex != .dday {
                        setSelectedTabIndex(.dday)
                    }
                } label: {
                    Text("디데이")
                        .foregroundStyle(Color(viewModel.selectedTabIndex == .dday ? BerryBucketColor.gray10 : BerryBucketColor.gray6))
                        .font(.system(size: 16, weight: .bold))
                }
                .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
                
                Button {
                    print("didTapChallangeButton")
                    if viewModel.selectedTabIndex != .challange {
                        setSelectedTabIndex(.challange)
                    }
                } label: {
                    Text("챌린지")
                        .foregroundStyle(Color(viewModel.selectedTabIndex == .challange ? BerryBucketColor.gray10 : BerryBucketColor.gray6))
                        .font(.system(size: 16, weight: .bold))
                }
                .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
                
                Spacer()
            }
            .frame(height: 41)
            
            HStack(spacing: 0) {
                Spacer().frame(width: tabIndicatorLeadingPadding)
                
                Color(uiColor: BerryBucketColor.gray10)
                    .frame(width: tabIndicatorWidth, height: 3)
                
                Spacer()
            }
            .frame(height: 3)
            
            switch viewModel.selectedTabIndex {
            case .all:
                TotalBucketToolsView(buckets: viewModel.buckets)
            case .category:
                CategoryToolsView()
            case .dday:
                DDayToolsView(dDayBuckets: viewModel.buckets)
            case .challange:
                ChallengeToolsView()
            }
        }
    }
}

//#Preview {
//    MyBucketTabView().previewLayout(.fixed(width: .infinity, height: 40))
//}

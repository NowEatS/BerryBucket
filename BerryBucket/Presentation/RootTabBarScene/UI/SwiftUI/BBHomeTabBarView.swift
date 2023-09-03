//
//  BBHomeTabBarView.swift
//  BerryBucket
//
//  Created by 태원 on 6/15/23.
//

import SwiftUI

struct BBHomeTabBarView: View {
    @ObservedObject var tabBarViewModel: TabBarViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            let selectedIndex = tabBarViewModel.selectedIndex
            HStack {
                Button {
                    print("Tap My Button")
                    if selectedIndex != 0 {
                            tabBarViewModel.select(index: 0)
                        }
                } label: {
                    Image(selectedIndex == 0 ? "ico36My_selected" : "ico36My_unselected")
                }
                Spacer(minLength: 32)
                Button {
                    print("Tap Feed Button")
                    if selectedIndex != 1 {
                            tabBarViewModel.select(index: 1)
                        }
                } label: {
                    Image(selectedIndex == 1 ? "ico36Feed_selected" : "ico36Feed_unselected")
                }
                Spacer(minLength: 32)
                Button {
                    print("Tap Search Button")
                    if selectedIndex != 2 {
                            tabBarViewModel.select(index: 2)
                        }
                } label: {
                    Image(selectedIndex == 2 ? "ico36Search_selected" : "ico36Search_unselected")
                }
                Spacer(minLength: 32)
                Button {
                    print("Tap More Button")
                    if selectedIndex != 3 {
                            tabBarViewModel.select(index: 3)
                        }
                } label: {
                    Image(selectedIndex == 3 ? "ico36More_selected" : "ico36More_unselected")
                }
                Spacer()
                Button {
                    print("Tap Add Button")
                } label: {
                    Image("btnAdd")
                }
            }
            .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
            .frame(height: 70.0)
            .background(Color(BerryBucketColor.gray1))
            .shadow(color: Color(BerryBucketColor.shadowColor), radius: 8.0)
        }
    }
}

#Preview {
    BBHomeTabBarView(tabBarViewModel: TabBarViewModel())
}

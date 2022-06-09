//
//  ContentView.swift
//  BerryBucket
//
//  Created by 태원 on 2022/06/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Color(uiColor: .white)
            }
            
            HStack {
                Button {
                    print("Tap My Button")
                } label: {
                    Image("ico36My")
                }
                Spacer(minLength: 32)
                Button {
                    print("Tap My Button")
                } label: {
                    Image("ico36Feed")
                }
                Spacer(minLength: 32)
                Button {
                    print("Tap My Button")
                } label: {
                    Image("ico36Search")
                }
                Spacer(minLength: 32)
                Button {
                    print("Tap My Button")
                } label: {
                    Image("ico36More")
                }
                Spacer()
                Button {
                    print("Tap My Button")
                } label: {
                    Image("btnAdd")
                }
            }
            .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 70.0)
            .background(Color(BerryBucketColor.gray1)
//                .shadow(color: Color(UIColor.blue), radius: 8, x: 0, y: -2.0)
////                .mask(Rectangle().padding(.top, -150.0)))
                .shadow(color: Color(BerryBucketColor.shadowColor), radius: 8.0, x: 0, y: 0)
                .mask(Rectangle().padding(.top, -10)))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
        }
    }
}

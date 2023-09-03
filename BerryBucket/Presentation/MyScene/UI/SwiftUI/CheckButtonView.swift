//
//  CheckButtonView.swift
//  BerryBucket
//
//  Created by 태원 on 9/3/23.
//

import SwiftUI

struct CheckButtonView: View {
    var animationDuration: Double = 0.75
    var strokeStyle: StrokeStyle = .init(lineWidth: 2, lineCap: .round, lineJoin: .round)
    @State private var outerTrimEnd: CGFloat = 0
    @State private var innerTrimEnd: CGFloat = 0
    @State private var alpha = 0.0
    @State private var strokeColor: Color = Color(uiColor: BerryBucketColor.main2)
    
    private var action: (() -> Void)? = nil
    
    init(action: (() -> Void)? = nil) {
        self.action = action
    }
    
    var body: some View {
        ZStack {
            Image("btn32Check")
            Circle()
                .trim(from: 0.0, to: outerTrimEnd)
                .stroke(Color(uiColor: BerryBucketColor.main2.withAlphaComponent(alpha)), style: strokeStyle)
                .rotationEffect(.degrees(-90))
            
            CheckMark()
                .trim(from: 0.0, to: innerTrimEnd)
                .stroke(Color(uiColor: BerryBucketColor.main2.withAlphaComponent(alpha)), style: strokeStyle)
                .frame(width: 14, height: 14)
        }
        .frame(width: 32, height: 32)
        .onTapGesture {
            outerTrimEnd = 0
            innerTrimEnd = 0
            alpha = 1.0
            strokeColor = Color(uiColor: BerryBucketColor.main2.withAlphaComponent(alpha))
            
            animate()
        }
    }
    
    func animate() {
        withAnimation(.linear(duration: 0.5*animationDuration)) {
            outerTrimEnd = 1.0
        }
        
        withAnimation(
            .linear(duration: 0.5*animationDuration)
            .delay(0.5*animationDuration)
        ) {
            innerTrimEnd = 1.0
        }
        
        if let action = action {
            DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                action()
            }
        }
        
        withAnimation(
            .linear(duration: 0.25*animationDuration)
            .delay(1.5*animationDuration)
        ) {
            alpha = 0.0
        }
    }
}

struct CheckMark: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.size.width
        let height = rect.size.height
        
        var path = Path()
        path.move(to: .init(x: 0.0*width, y: 0.4 * height))
        path.addLine(to: .init(x: 0.45*width, y: 0.85*height))
        path.addLine(to: .init(x: 0.9*width, y: 0.2*height))
        return path
    }
}

#Preview {
    CheckButtonView()
}

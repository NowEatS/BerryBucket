//
//  Font.swift
//  BerryBucket
//
//  Created by 태원 on 11/9/23.
//

import UIKit
import SwiftUI

extension UIFont {
    // NotoSansKR을 위한 enum을 추가하여 사용하기 쉽게 만듭니다.
    enum NotoSansKR: String {
        case black = "NotoSansKR-Black"
        case bold = "NotoSansKR-Bold"
        case light = "NotoSansKR-Light"
        case medium = "NotoSansKR-Medium"
        case regular = "NotoSansKR-Regular"
        case thin = "NotoSansKR-Thin"
    }
    
    // 위에 정의한 enum을 사용하여 커스텀 폰트를 리턴하는 static 메소드를 만듭니다.
    static func notoSansKR(_ type: NotoSansKR, size: CGFloat) -> UIFont? {
        return UIFont(name: type.rawValue, size: size)
    }
    
    /*
     let label = UILabel()
     label.font = UIFont.notoSansKR(.medium, size: 18)
     */
}

extension Font {
    // UIFont의 확장에서와 같이 NotoSansKR enum을 정의합니다.
    enum NotoSansKR: String {
        case black = "NotoSansKR-Black"
        case bold = "NotoSansKR-Bold"
        case light = "NotoSansKR-Light"
        case medium = "NotoSansKR-Medium"
        case regular = "NotoSansKR-Regular"
        case thin = "NotoSansKR-Thin"
    }
    
    // UIFont의 확장과 유사하게 Font를 리턴하는 static 메소드를 만듭니다.
    static func notoSansKR(_ type: NotoSansKR, size: CGFloat) -> Font {
        return Font.custom(type.rawValue, size: size)
    }
    
    /*
     Text("Hello, World!")
     .font(.notoSansKR(.medium, size: 18))
     */
}

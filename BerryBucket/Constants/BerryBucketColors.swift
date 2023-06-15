//
//  BerryBucketColors.swift
//  BerryBucket
//
//  Created by 태원 on 6/15/23.
//

import UIKit

struct BerryBucketColor {
    private init() {
        
    }
    
    // GrayScale
    static let gray1 = hexStringToUIColor(hex: "#FFFFFF")
    static let gray2 = hexStringToUIColor(hex: "#FAFAFA")
    static let gray3 = hexStringToUIColor(hex: "#F0F0F0")
    static let gray4 = hexStringToUIColor(hex: "#E0E0E0")
    static let gray5 = hexStringToUIColor(hex: "#CCCCCC")
    static let gray6 = hexStringToUIColor(hex: "#B4B4B4")
    static let gray7 = hexStringToUIColor(hex: "#888888")
    static let gray8 = hexStringToUIColor(hex: "#666666")
    static let gray9 = hexStringToUIColor(hex: "#444444")
    static let gray10 = hexStringToUIColor(hex: "#222222")
    static let gray11 = hexStringToUIColor(hex: "#000000")
    
    // System
    static let error1 = hexStringToUIColor(hex: "#FFD0C4")
    static let error2 = hexStringToUIColor(hex: "#FF8668")
    static let error3 = hexStringToUIColor(hex: "#FC4113")
    
    // Main
    static let main1 = hexStringToUIColor(hex: "#F1F6FF")
    static let main2 = hexStringToUIColor(hex: "#A6C6FF")
    static let main3 = hexStringToUIColor(hex: "#5A95FF")
    static let main4 = hexStringToUIColor(hex: "#007BFF")
    static let main5 = hexStringToUIColor(hex: "#284F81")
    static let main6 = hexStringToUIColor(hex: "#0D1F35")
    
    // Sub - d
    static let subD1 = hexStringToUIColor(hex: "#FFE3A6")
    static let subD2 = hexStringToUIColor(hex: "#FFCA5A")
    static let subD3 = hexStringToUIColor(hex: "#FFAD00")
    static let subD4 = hexStringToUIColor(hex: "#8B6109")
    
    static let shadowColor = UIColor(red: 139/255, green: 139/255, blue: 139/255, alpha: 0.1)
}

private func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

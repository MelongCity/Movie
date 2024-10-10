//
//  UIFont+.swift
//  Moolog
//
//  Created by 아라 on 10/10/24.
//

import UIKit

extension UIFont {
    public enum FontType: String{
        case bold = "Bold"
        case medium = "Medium"
    }
    
    static func Pretendard(
        type: FontType,
        size: CGFloat
    ) -> UIFont? {
        return .init(
            name: "Pretendard-\(type.rawValue)",
            size: size
        )
    }
}

extension UIFont {
    static let head = UIFont.Pretendard(
        type: .bold,
        size: 20
    )
    
    static let sub = UIFont.Pretendard(
        type: .bold,
        size: 14
    )
    
    static let title = UIFont.Pretendard(
        type: .bold,
        size: 16
    )
    
    static let body1 = UIFont.Pretendard(
        type: .medium,
        size: 16
    )
    
    static let body2 = UIFont.Pretendard(
        type: .medium,
        size: 13
    )
    
    static let caption = UIFont.Pretendard(
        type: .medium,
        size: 12
    )
    
    static let button = UIFont.Pretendard(
        type: .bold,
        size: 15
    )
}

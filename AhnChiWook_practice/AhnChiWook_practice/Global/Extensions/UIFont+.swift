//
//  UIFont+.swift
//  AhnChiWook_practice
//
//  Created by 안치욱 on 10/13/25.
//

import UIKit

extension UIFont {
    enum FontFamily {
        case thin, extraLight, light, regular, medium, semiBold, bold, extraBold, black
        
        var kind: String {
            switch self {
            case .thin:
                return "Thin"
            case .extraLight:
                return "ExtraLight"
            case .light:
                return "Light"
            case .regular:
                return "Regular"
            case .medium:
                return "Medium"
            case .semiBold:
                return "SemiBold"
            case .bold:
                return "Bold"
            case .extraBold:
                return "ExtraBold"
            case .black:
                return "Black"
            }
        }
    }
    
    static func pretendard(_ fontFamily: FontFamily, size: CGFloat) -> UIFont {
        guard let pretendardFont = UIFont(name: "Pretendard-\(fontFamily.kind)", size: size) else {
            fatalError("fatalError: 폰트를 찾을 수 없어요ㅠ!")
        }
        
        return pretendardFont
    }
}

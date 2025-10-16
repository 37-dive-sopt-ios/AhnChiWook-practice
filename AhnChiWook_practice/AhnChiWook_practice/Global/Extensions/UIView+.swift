//
//  UIView+.swift
//  AhnChiWook_practice
//
//  Created by 안치욱 on 10/14/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}

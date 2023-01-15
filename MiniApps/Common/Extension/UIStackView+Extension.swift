//
//  UIStackView+Extension.swift
//  MiniApps
//
//  Created by Jimmi Oh on 15/01/23.
//

import UIKit

extension UIStackView {
    public func setupArrangedSubviews(_ views: UIView...) {
        for item in views {
            addArrangedSubview(item)
        }
    }
}

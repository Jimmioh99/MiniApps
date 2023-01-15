//
//  UIView+Extension.swift
//  MiniApps
//
//  Created by Jimmi Oh on 15/01/23.
//

import UIKit

extension UIView {
    @discardableResult
    public func parent(_ view: UIView) -> Self {
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    public func setupSubviews(_ views: [UIView]) {
        for item in views {
            addSubview(item)
        }
    }
    
    public func setLayer(cornerRadius: CGFloat? = nil, borderWidth width: CGFloat? = nil, borderColor color: UIColor? = nil, clipToBounds: Bool = true) {
        setNeedsLayout()
        layoutIfNeeded()
        if let radius = cornerRadius {
            let size = (frame.width == 0 ? frame.height : frame.width) / 2
            layer.cornerRadius = (radius == 0 ? size : radius)
        } else {
            layer.cornerRadius = 0
        }
        
        
        if let width = width {
            layer.borderWidth = width
        }
        if let color = color {
            layer.borderColor = color.cgColor
        }
        
        layer.masksToBounds = clipToBounds
    }
    
    func addCorners(radius: CGFloat, corners: CACornerMask = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]) {
        setNeedsLayout()
        layoutIfNeeded()
        layer.cornerRadius = radius
        layer.maskedCorners = corners
    }
    
    func addShadow(radius: CGFloat, backgroundColor: UIColor = .white, corners: CACornerMask = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]) {
        addCorners(radius: radius, corners: corners)
        layer.backgroundColor = backgroundColor.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4.0
    }
}

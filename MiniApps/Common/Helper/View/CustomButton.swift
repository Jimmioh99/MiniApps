//
//  CustomButton.swift
//  MiniApps
//
//  Created by Jimmi Oh on 15/01/23.
//

import UIKit

enum CustomButtonEnum {
    case dark
    case light
}

class CustomButton: UIButton {
    
    var type: CustomButtonEnum
    
    init(title: String, type: CustomButtonEnum = .dark) {
        
        self.type = type
        
        super.init(frame: CGRect.zero)
        
        setTitle(title, for: .normal)
        
        setupConstraints()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setLayer(cornerRadius: 25, borderWidth: 2, borderColor: .black)
        
        setTitleColor(type == .dark ? .white : .black, for: .normal)
        backgroundColor = type == .dark ? .black : .white
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}

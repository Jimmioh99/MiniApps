//
//  ErrorMessageView.swift
//  MiniApps
//
//  Created by Jimmi Oh on 15/01/23.
//

import UIKit

final class ErrorMessageView: UIView {
    
    let textLbl = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(textLbl)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setLayer(cornerRadius: 20, borderWidth: 1, borderColor: .red)
        backgroundColor = UIColor.red.withAlphaComponent(0.2)
        
        textLbl.textColor = UIColor.red
        textLbl.numberOfLines = 3
    }
    
    func setupConstraints() {
        textLbl.snp.makeConstraints { make in
            make.top.leading.equalTo(self).offset(20)
            make.trailing.bottom.equalTo(self).offset(-20)
        }
    }
}
